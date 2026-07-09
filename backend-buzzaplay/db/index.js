/**
 * 📦 Modulo di connessione PostgreSQL per il database delle domande del Quizzettone.
 *
 * Esporta tre funzioni:
 * - init()        → connessione + creazione tabelle + seed iniziale
 * - query()       → esegue query parametrizzate sul database
 * - isConnected() → true se il database è stato connesso con successo
 *
 * IMPORTANTE: la connessione NON è bloccante. Se DATABASE_URL è mancante
 * o PostgreSQL non è raggiungibile, il modulo entra in "modalità graceful":
 * il server parte comunque, ma le domande quiz non saranno disponibili
 * (la sezione "Domande Quiz" nell'admin mostrerà un avviso).
 *
 * Dipende dal pacchetto npm `pg` e dalla variabile d'ambiente DATABASE_URL.
 */

import pg from 'pg';               // Driver PostgreSQL ufficiale per Node.js
import { readFileSync } from 'fs'; // Legge i file .sql dal disco
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

// In ESM non esistono __dirname e __filename, li ricaviamo da import.meta.url
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const { Pool } = pg;  // Pool = pool di connessioni (gestisce automaticamente riconnessione)

// Variabile interna: il pool di connessione, inizializzato da init()
let pool = null;

// Flag che indica se il database è stato connesso con successo.
// Usato da query() per restituire risultati vuoti senza throware,
// e da isConnected() per informare il server/frontend.
let connected = false;

/**
 * 🔌 Inizializza la connessione al database e prepara le tabelle.
 *
 * Flow:
 * 1. Legge DATABASE_URL dal .env (opzionale — se mancante, graceful skip)
 * 2. Crea un Pool di connessioni PostgreSQL
 * 3. Testa la connessione con SELECT 1
 * 4. Esegue schema.sql (CREATE TABLE IF NOT EXISTS — idempotente)
 * 5. Se la tabella domande è vuota, esegue seed.sql per popolarla
 *
 * Se DATABASE_URL è mancante o la connessione fallisce, il modulo
 * imposta connected = false e termina senza errori. Il server
 * principale può continuare a funzionare senza la sezione domande.
 *
 * Da chiamare all'avvio di server.js (await db.init()).
 */
export async function init() {
  const databaseUrl = process.env.DATABASE_URL;

  // Se DATABASE_URL non è definita → graceful skip, non blocchiamo il server
  if (!databaseUrl) {
    console.warn('⚠️ DATABASE_URL non definita. Il server parte senza database domande.');
    console.warn('   Le funzionalità "Domande Quiz" non saranno disponibili.');
    connected = false;
    return;
  }

  // Crea il pool di connessioni (PostgreSQL gestisce automaticamente
  // riconnessione e pooling — non serve aprire/chiudere manualmente)
  // Render.com richiede SSL per PostgreSQL, ma usa certificati autofirmati
  // → rejectUnauthorized: false permette la connessione senza errori
  pool = new Pool({
    connectionString: databaseUrl,
    ssl: { rejectUnauthorized: false },
  });

  // Test rapido: SELECT 1 verifica che host/port/user/pass siano corretti
  try {
    await pool.query('SELECT 1');
    console.log('📦 Database PostgreSQL connesso');
    connected = true;
  } catch (err) {
    // Connessione fallita → graceful skip, non blocchiamo il server
    console.warn('⚠️ Impossibile connettersi a PostgreSQL:', err.message);
    console.warn('   Il server parte senza database domande.');
    console.warn('   Le funzionalità "Domande Quiz" non saranno disponibili.');
    connected = false;
    return;
  }

  // Esegue schema.sql → CREATE TABLE IF NOT EXISTS (non dà errore se già esistente)
  try {
    const schemaSql = readFileSync(join(__dirname, 'schema.sql'), 'utf-8');
    await pool.query(schemaSql);
    console.log('📦 Schema tabelle verificato');
  } catch (err) {
    console.warn('⚠️ Errore durante creazione schema tabelle:', err.message);
    connected = false;
    return;
  }

  // Controlla se ci sono già domande (per evitare di rieseguire il seed a ogni avvio)
  try {
    const result = await pool.query('SELECT COUNT(*)::int AS count FROM domande');
    if (result.rows[0].count === 0) {
      // Tabella vuota → esegue seed.sql con BEGIN/COMMIT e ON CONFLICT DO NOTHING
      const seedSql = readFileSync(join(__dirname, 'seed.sql'), 'utf-8');
      await pool.query(seedSql);
      console.log('📦 Database popolato con dati iniziali (seed.sql)');
    }
  } catch (err) {
    console.warn('⚠️ Errore durante verifica/popolamento domande:', err.message);
    connected = false;
    return;
  }
}

/**
 * 🗄️ Esegue una query parametrizzata sul database PostgreSQL.
 *
 * Se il database non è connesso (connected === false), restituisce
 * un risultato vuoto { rows: [], rowCount: 0 } invece di throware,
 * permettendo ai chiamanti di gestire il caso senza crash.
 *
 * @param {string} text  - SQL con placeholder $1, $2, ...
 * @param {array}  params - Valori da sostituire nei placeholder
 * @returns {object}      - Risultato della query (rows, rowCount, ...)
 *
 * Esempio:
 *   const result = await db.query(
 *     'SELECT * FROM domande WHERE difficolta = $1',
 *     ['facile']
 *   );
 */
export async function query(text, params) {
  if (!connected || !pool) {
    return { rows: [], rowCount: 0 };
  }
  return pool.query(text, params);
}

/**
 * 🔍 Restituisce true se il database PostgreSQL è attualmente connesso.
 *
 * Utile per:
 * - server.js: decidere se registrare gli handler per le domande quiz
 * - Frontend: mostrare/nascondere la sezione domande in base allo stato del DB
 */
export function isConnected() {
  return connected;
}

export default { init, query, isConnected };
