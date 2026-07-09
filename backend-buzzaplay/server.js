// Importiamo la libreria ws (WebSocket server)
import { WebSocketServer, WebSocket } from 'ws';
// Modulo database PostgreSQL per le domande del Quizzettone
// Espone db.init() (chiamato all'avvio) e db.query() (per fare query)
import db from './db/index.js';

// Creiamo un server WebSocket che ascolta sulla porta 3000
// Prima del deploy per il locale:
// const wss = new WebSocketServer({ port: 3000 });
// Dopo il deploy visibile su Render.com:
const wss = new WebSocketServer({ host: '127.0.0.1', port: 3000 });

/**
 * 🔐 PASSWORD ADMIN (da .env)
 */
const ADMIN_PASSWORD = process.env.ADMIN_PASSWORD;
if (!ADMIN_PASSWORD) {
    console.error('❌ ERRORE: ADMIN_PASSWORD non definita. Creare un file .env con ADMIN_PASSWORD=...');
    process.exit(1);
}

/**
 * 🗄️ DATABASE_URL — URL di connessione a PostgreSQL (opzionale).
 * Su Render.com viene popolata automaticamente quando crei un PostgreSQL.
 * In locale, va inserita manualmente nel .env.
 * Esempio: postgres://user:password@host:5432/buzzaplay
 * Se mancante, db.init() entra in modalità graceful: server parte senza database.
 */

/* ============================================================
   STATO MODALITÀ QUIZETTONE (invariato)
   ============================================================ */
let buzzerLocked = false; // true = qualcuno ha già premuto
let firstPlayer = null;  // nome del primo giocatore
const connectedPlayers = new Map();     // UUID → { name, canBuzz } — connessioni attive
const registeredPlayers = new Map();    // UUID → { name, canBuzz } — identità persistenti

/**
 * 🏆 Punteggi classifica (UUID → numero)
 */
const scores = new Map();

/**
 * 🔗 Tiene traccia del WebSocket ATTIVO per ogni player (UUID → ws).
 * Serve per gestire la race condition al refresh: su server remoti (Render)
 * il vecchio evento 'close' può arrivare DOPO il nuovo HELLO, cancellando
 * erroneamente il player da connectedPlayers.
 */
const activeSockets = new Map();

/* ============================================================
   STATO MODALITÀ ASTA FANTACALCIO (NUOVO)
   ============================================================ */

/**
 * gameMode determina quale modalità di gioco è attiva:
 * - 'quiz'    → modalità Quizzettone classica (invariata)
 * - 'auction' → modalità Asta Fantacalcio (nuova)
 */
let gameMode = 'quiz';

/**
 * budgets memorizza i crediti rimanenti per ogni giocatore (UUID → numero).
 * Viene popolato quando l'admin assegna il budget iniziale
 * e scalato quando un giocatore vince un'asta.
 */
const budgets = new Map();

/**
 * auctionState contiene TUTTO lo stato corrente dell'asta in corso.
 * Quando active = false, significa che nessuna asta è in esecuzione
 * e i player non possono premere il pulsante OFFRI.
 */
const auctionState = {
    active: false,                // true se c'è un'asta in corso
    mode: 'standard',             // 'standard' (con input crediti) | 'base' (solo voce)
    timerDuration: 10,            // secondi iniziali del countdown (impostato dall'admin)
    timerRemaining: 0,            // secondi rimanenti nel countdown attuale
    timerInterval: null,          // riferimento al setInterval per poterlo cancellare
    currentBid: 0,                // offerta attuale più alta
    minBid: 0,                    // offerta base di partenza (solo modalità standard)
    currentLeaderId: null,        // UUID del miglior offerente
    currentLeaderName: null,      // Nome del miglior offerente
    lastBuzzTimestamp: 0,         // timestamp (Date.now()) dell'ultimo buzz valido
    buzzLocked: false,            // true = timer fermo perché qualcuno sta facendo un'offerta
    bidRequestedTo: null,         // UUID del player a cui è stato richiesto di fare un'offerta (standard)
    lastBuzzerId: null,           // UUID dell'ultimo che ha buzzato in modalità base (escluso dal prossimo round)
    excludedPlayers: new Set(),   // Set di UUID dei player esclusi dall'asta corrente
};

/* ============================================================
   CONNESSIONE WEBSOCKET
   ============================================================ */

wss.on('connection', (ws) => {
    console.log('🟢 Connessione in entrata');

    /**
     * ❤️ Heartbeat / Keepalive (ping/pong nativo WebSocket).
     * 
     * Il flag isAlive viene impostato a true all'avvio della connessione.
     * Ogni 15 secondi il server invia un ping a tutti i client; se un client
     * non risponde con pong entro il successivo ciclo di heartbeat, la
     * connessione viene terminata (ws.terminate()).
     * 
     * Questo ha due effetti positivi:
     * 1. Il traffico periodico impedisce al proxy di Render (timeout ~55s)
     *    di chiudere la WebSocket per inattività.
     * 2. Le connessioni morte (browser chiuso bruscamente, WiFi perso)
     *    vengono rilevate in ≤15s invece di attendere il timeout del proxy.
     */
    ws.isAlive = true;

    ws.on('pong', () => {
        // Il client ha risposto al ping → connessione ancora viva
        ws.isAlive = true;
    });

    /**
     * Gestione errori di connessione: se un socket si rompe (es. browser chiuso
     * bruscamente, crash di rete, o connessione interrotta), questo handler
     * garantisce che il player venga rimosso da connectedPlayers.
     * 
     * In assenza di questo handler, Node.js può lanciare un'eccezione non gestita
     * sull'evento 'error', causando il crash del server.
     */
    ws.on('error', (err) => {
        console.error(`⚠️ Errore socket per "${ws.playerName || 'sconosciuto'}":`, err.message);
        if (!ws.playerId) return;

        // Non puliamo lo stato auction (bidRequestedTo, leader, ecc.) perché
        // il player potrebbe riconnettersi dopo un refresh. Se non si riconnette,
        // l'admin può usare "Annulla Asta". Questo garantisce che un player
        // che refresh durante l'input offerta mantenga bidRequestedTo.
        if (activeSockets.get(ws.playerId) !== ws) return;

        connectedPlayers.delete(ws.playerId);
        activeSockets.delete(ws.playerId);
        broadcastPlayers();
    });

    /**
     * Evento: il client manda un messaggio
     */
    ws.on('message', async (msg) => {
        const data = JSON.parse(msg);

        /* ========================================================
           🔐 LOGIN ADMIN
           ======================================================== */
        if (data.type === 'ADMIN_LOGIN') {
            if (data.password === ADMIN_PASSWORD) {
                ws.role = 'admin';

                ws.send(JSON.stringify({
                    type: 'ADMIN_OK'
                }));

                console.log('🔐 Admin autenticato');

                // In modalità auction, inviamo anche lo stato dell'asta e i budget
                if (gameMode === 'auction') {
                    broadcastAuctionState();
                    broadcastBudgets();
                }

                broadcastPlayers();
                broadcastScores();
            } else {
                ws.send(JSON.stringify({
                    type: 'ADMIN_DENIED'
                }));
            }
            return;
        }

        /* ========================================================
           👋 HELLO — handshake iniziale del giocatore
           ======================================================== */
        if (data.type === 'HELLO') {
            const { playerId, playerName, role } = data;

            // 🔁 CASO 1: UUID GIÀ REGISTRATO (refresh / reconnect)
            if (registeredPlayers.has(playerId)) {
                const savedData = registeredPlayers.get(playerId);
                const savedName = savedData.name;

                if (activeSockets.has(playerId)) {
                    const oldWs = activeSockets.get(playerId);
                    oldWs._replacedBy = ws;
                }
                activeSockets.set(playerId, ws);

                ws.playerId = playerId;
                ws.playerName = savedName;
                ws.role = role || 'player';

                connectedPlayers.set(playerId, {
                    name: savedName,
                    canBuzz: savedData.canBuzz
                });

                // In modalità auction, al reconnect informiamo il player
                // del suo budget, dello stato dell'asta e se è escluso
                const auctionPayload = (gameMode === 'auction') ? {
                    gameMode,
                    budget: budgets.get(playerId) || 0,
                    auctionActive: auctionState.active,
                    auctionMode: auctionState.mode,
                    timerRemaining: auctionState.timerRemaining,
                    currentBid: auctionState.currentBid,
                    minBid: auctionState.minBid,
                    currentLeaderName: auctionState.currentLeaderName,
                    buzzLocked: auctionState.buzzLocked,
                    bidRequestedTo: auctionState.bidRequestedTo,
                    lastBuzzerId: auctionState.lastBuzzerId,
                    excluded: auctionState.excludedPlayers.has(playerId),
                } : {};

                ws.send(JSON.stringify({
                    type: 'NAME_OK',
                    playerName: savedName,
                    reconnect: true,
                    ...auctionPayload
                }));
                console.log(`Player ${savedName} RICONNESSO! Id player: ${playerId}`);

                broadcastPlayers();
                broadcastScores();
                return;
            }

            // 🚨 CASO 2: UUID NUOVO → controllo duplicato nome
            for (const savedData of registeredPlayers.values()) {
                if (savedData.name.toUpperCase().trim() === playerName.toUpperCase().trim()) {
                    ws.send(JSON.stringify({
                        type: 'NAME_TAKEN',
                        message: 'Nome giocatore già presente, scegline un altro!'
                    }));
                    return;
                }
            }

            // ✅ Registrazione nuova identità
            registeredPlayers.set(playerId, { name: playerName, canBuzz: false });
            if (!scores.has(playerId)) {
                scores.set(playerId, 0);
            }
            // Se siamo in modalità auction e il player non ha ancora un budget,
            // non gli assegniamo nulla — sarà l'admin a farlo tramite ADMIN_SET_BUDGET
            if (!budgets.has(playerId)) {
                budgets.set(playerId, 0);
            }

            ws.playerId = playerId;
            ws.playerName = playerName;
            ws.role = role || 'player';

            if (activeSockets.has(playerId)) {
                activeSockets.get(playerId)._replacedBy = ws;
            }
            activeSockets.set(playerId, ws);

            connectedPlayers.set(playerId, {
                name: playerName,
                canBuzz: false
            });

            // Anche per un nuovo giocatore, in modalità auction inviamo lo stato
            const auctionPayload = (gameMode === 'auction') ? {
                gameMode,
                budget: budgets.get(playerId) || 0,
                auctionActive: auctionState.active,
                auctionMode: auctionState.mode,
                timerRemaining: auctionState.timerRemaining,
                currentBid: auctionState.currentBid,
                minBid: auctionState.minBid,
                currentLeaderName: auctionState.currentLeaderName,
                buzzLocked: auctionState.buzzLocked,
                bidRequestedTo: auctionState.bidRequestedTo,
                lastBuzzerId: auctionState.lastBuzzerId,
                excluded: auctionState.excludedPlayers.has(playerId),
            } : {};

            ws.send(JSON.stringify({
                type: 'NAME_OK',
                ...auctionPayload
            }));

            console.log(`🟢 ${ws.role.toUpperCase()} "${ws.playerName}" (${ws.playerId}) connesso`);

            broadcastPlayers();
            broadcastScores();
            return;
        }

        /* ========================================================
           🎮 ADMIN → CAMBIA MODALITÀ DI GIOCO
           ======================================================== */
        if (data.type === 'ADMIN_SET_GAME_MODE') {
            if (ws.role !== 'admin') return;

            const { mode } = data;
            if (mode !== 'quiz' && mode !== 'auction') return;

            // Se si esce dalla modalità auction, cancelliamo l'asta in corso
            if (gameMode === 'auction' && mode === 'quiz') {
                stopAuctionTimer();
                resetAuctionState();
            }

            gameMode = mode;
            console.log(`🎮 Modalità di gioco cambiata a: ${mode}`);

            // Broadcast a TUTTI i client del cambiamento di modalità
            broadcast({ type: 'GAME_MODE_CHANGE', mode });

            // Se entriamo in modalità auction, inviamo lo stato iniziale
            if (mode === 'auction') {
                broadcastAuctionState();
                broadcastBudgets();
            }
            return;
        }

        /* ========================================================
           BUZZ QUIZETTONE — SOLO IN MODALITÀ quiz
           In modalità auction, il buzz viene ignorato.
           ======================================================== */
        if (data.type === 'BUZZ') {
            // Se siamo in modalità auction, il BUZZ classico non deve funzionare
            if (gameMode === 'auction') return;

            if (ws.role !== 'player') return;

            const player = connectedPlayers.get(ws.playerId);
            if (!player || !player.canBuzz) return;

            if (!buzzerLocked) {
                buzzerLocked = true;
                firstPlayer = player.name;

                console.log('🚨 PRIMO BUZZ:', firstPlayer);

                broadcast({
                    type: 'WINNER',
                    player: firstPlayer
                });
            }
        }

        /* ========================================================
           🎛️ ADMIN → ABILITA / DISABILITA BUZZ (entrambe le modalità)
           ======================================================== */
        if (data.type === 'ADMIN_SET_CAN_BUZZ') {
            if (ws.role !== 'admin') return;

            const { playerId, canBuzz } = data;
            const player = connectedPlayers.get(playerId);
            if (!player) return;

            player.canBuzz = canBuzz;

            const regPlayer = registeredPlayers.get(playerId);
            if (regPlayer) regPlayer.canBuzz = canBuzz;

            broadcastPlayers();
        }

        /* ========================================================
           🧨 ADMIN → FORZA RESET IDENTITÀ PLAYER (entrambe le modalità)
           ======================================================== */
        if (data.type === 'ADMIN_FORCE_RESET_PLAYER') {
            if (ws.role != 'admin') {
                console.log(`⛔ RESET rifiutato (non admin)`);
                return;
            }

            const { playerId } = data;

            wss.clients.forEach(client => {
                if (client.playerId === playerId) {
                    client.send(JSON.stringify({ type: 'FORCE_RESET' }));
                }
            });

            connectedPlayers.delete(playerId);
            registeredPlayers.delete(playerId);
            activeSockets.delete(playerId);
            scores.delete(playerId);
            // In modalità auction, cancelliamo anche il budget
            budgets.delete(playerId);
            // Rimuoviamo dall'elenco degli esclusi dell'asta corrente
            auctionState.excludedPlayers.delete(playerId);
            // Pulisci lastBuzzerId se corrisponde al player rimosso
            if (auctionState.lastBuzzerId === playerId) {
                auctionState.lastBuzzerId = null;
            }

            broadcastPlayers();
            broadcastScores();
            if (gameMode === 'auction') {
                broadcastBudgets();
            }
        }

        /* ========================================================
           🗑️ PLAYER → AUTO-DEREGISTRAZIONE (entrambe le modalità)
           ======================================================== */
        if (data.type === 'PLAYER_UNREGISTER') {
            if (ws.playerId) {
                connectedPlayers.delete(ws.playerId);
                registeredPlayers.delete(ws.playerId);
                scores.delete(ws.playerId);
                activeSockets.delete(ws.playerId);
                // In modalità auction, cancelliamo anche il budget
                budgets.delete(ws.playerId);
                auctionState.excludedPlayers.delete(ws.playerId);
                if (auctionState.lastBuzzerId === ws.playerId) {
                    auctionState.lastBuzzerId = null;
                }

                broadcastPlayers();
                broadcastScores();
                if (gameMode === 'auction') {
                    broadcastBudgets();
                }
                console.log(`🗑️ Player "${ws.playerName}" si è auto-deregistrato`);
            }
        }

        /* ========================================================
           🔄 RESET QUIZ (solo admin) — modalità quiz
           In modalità auction, questo messaggio annulla l'asta
           ======================================================== */
        if (data.type === 'RESET') {
            if (ws.role !== 'admin') {
                console.log('⛔ RESET QUIZ rifiutato (non admin)');
                return;
            }

            if (gameMode === 'auction') {
                // In modalità auction, RESET annulla l'asta corrente
                stopAuctionTimer();
                resetAuctionState();
                broadcast({ type: 'AUCTION_CANCELLED' });
                broadcastAuctionState();
                console.log('🔄 Asta annullata dall\'admin (tramite RESET)');
                return;
            }

            // Modalità quiz: reset classico
            buzzerLocked = false;
            firstPlayer = null;

            console.log('🔄 RESET QUIZ eseguito dall\'admin');

            broadcast({ type: 'RESET' });
        }

        /* ========================================================
           🏆 ADMIN → AGGIUSTA PUNTEGGIO (solo modalità quiz)
           ======================================================== */
        if (data.type === 'ADMIN_ADJUST_SCORE') {
            if (ws.role !== 'admin') return;

            const { playerId, delta } = data;
            const current = scores.get(playerId);
            if (current === undefined) return;

            scores.set(playerId, current + delta);
            broadcastScores();
        }

        /* ========================================================
           🏆 ADMIN → RIMUOVI PUNTEGGIO (solo modalità quiz)
           ======================================================== */
        if (data.type === 'ADMIN_REMOVE_SCORE') {
            if (ws.role !== 'admin') return;

            scores.delete(data.playerId);
            broadcastScores();
        }

        /* ========================================================
           🏆 ADMIN → RESETTA TUTTI I PUNTEGGI (solo modalità quiz)
           ======================================================== */
        if (data.type === 'ADMIN_RESET_SCORES') {
            if (ws.role !== 'admin') return;

            for (const id of scores.keys()) {
                scores.set(id, 0);
            }
            broadcastScores();
            console.log('🏆 Classifica resettata dall\'admin');
        }

        /* ============================================================
           ❓ DOMANDE QUIZ (DATABASE) — NUOVI HANDLER
           ============================================================
           Questi handler servono l'admin dashboard per visualizzare
           le domande del Quizzettone prelevate dal database PostgreSQL.
           Le domande NON vengono trasmesse ai player — sono visibili
           solo nella schermata admin.
           ============================================================ */

        /**
         * 📋 ADMIN_GET_CATEGORIES — Richiede la lista di tutte le categorie.
         *
         * Query: SELECT tutte le categorie ordinate alfabeticamente.
         * Risposta: { type: 'CATEGORIES', categories: [{id, nome}] }
         *
         * Questa lista popola il dropdown "Categoria" nella dashboard admin,
         * permettendo all'admin di filtrare le domande per categoria.
         */
        if (data.type === 'ADMIN_GET_CATEGORIES') {
            // Solo gli admin autenticati possono richiedere le categorie
            if (ws.role !== 'admin') return;

            try {
                // Query semplice: tutte le categorie in ordine alfabetico
                const result = await db.query('SELECT id, nome FROM categorie ORDER BY nome');
                ws.send(JSON.stringify({
                    type: 'CATEGORIES',
                    categories: result.rows  // Array di {id, nome}
                }));
            } catch (err) {
                console.error('❌ Errore query categorie:', err.message);
            }
            return;
        }

        /**
         * ❓ ADMIN_GET_QUESTION — Richiede una domanda casuale con filtri.
         *
         * Parametri opzionali (entrambi default null = "Casuale"):
         *   categoria_id  → filtra per categoria specifica
         *   difficolta    → filtra per 'facile'/'medio'/'difficile'
         *
         * La query SQL usa WHERE con OR $1 IS NULL per rendere i filtri
         * opzionali: se categoria_id è null, vengono prese TUTTE le categorie.
         *
         * ORDER BY RANDOM() + LIMIT 1 → prende una riga casuale.
         *
         * Le 4 risposte (1 corretta + 3 errate) vengono poi mischiate
         * con l'algoritmo Fisher-Yates prima di essere inviate, così
         * l'ordine è sempre imprevedibile.
         */
        if (data.type === 'ADMIN_GET_QUESTION') {
            // Solo gli admin autenticati possono richiedere domande
            if (ws.role !== 'admin') return;

            // categoria_id = null → tutte le categorie (selezionato "Casuale")
            // difficolta = null → tutte le difficoltà (selezionato "Casuale")
            const { categoria_id = null, difficolta = null } = data;

            try {
                // Query parametrizzata: i filtri sono opzionali grazie a OR $1 IS NULL
                // ORDER BY RANDOM() + LIMIT 1 seleziona una domanda casuale
                const result = await db.query(
                    `SELECT d.id, d.difficolta, d.domanda,
                            d.risposta_corretta, d.risposta_errata_1,
                            d.risposta_errata_2, d.risposta_errata_3,
                            c.nome AS categoria
                     FROM domande d
                     JOIN categorie c ON d.categoria_id = c.id
                     WHERE (c.id = $1 OR $1 IS NULL)
                       AND (d.difficolta = $2 OR $2 IS NULL)
                     ORDER BY RANDOM()
                     LIMIT 1`,
                    [categoria_id, difficolta]
                );

                // Nessuna domanda trovata con questi filtri
                if (result.rows.length === 0) {
                    ws.send(JSON.stringify({
                        type: 'QUESTION',
                        domanda: null  // Il frontend mostrerà "Nessuna domanda trovata"
                    }));
                    return;
                }

                // Costruisce l'array delle 4 risposte con flag corretta
                // La risposta corretta è sempre la prima, le errate dopo
                // (verranno mischiate subito dopo)
                const row = result.rows[0];
                const risposte = [
                    { testo: row.risposta_corretta, corretta: true },
                    { testo: row.risposta_errata_1, corretta: false },
                    { testo: row.risposta_errata_2, corretta: false },
                    { testo: row.risposta_errata_3, corretta: false },
                ];

                // 🔀 Fisher-Yates shuffle: mescola l'array in-place così
                // l'ordine delle risposte è casuale e il giocatore non può
                // sapere quale sia la corretta dalla posizione
                shuffleFisherYates(risposte);

                // Invia la domanda completa all'admin
                ws.send(JSON.stringify({
                    type: 'QUESTION',
                    domanda: {
                        id: row.id,
                        categoria: row.categoria,    // Nome della categoria (es. "Scienze")
                        difficolta: row.difficolta,   // 'facile', 'medio', 'difficile'
                        testo: row.domanda,
                        risposte,                     // Array di 4 {testo, corretta} mescolato
                    }
                }));
            } catch (err) {
                console.error('❌ Errore query domanda:', err.message);
            }
            return;
        }

        /* ============================================================
           🎮 MODALITÀ ASTA FANTACALCIO — NUOVI HANDLER
           ============================================================ */

        /**
         * 💰 ADMIN → IMPOSTA BUDGET INIZIALE PER TUTTI I PLAYER
         * Assegna lo stesso budget (in crediti) a ogni giocatore registrato.
         * Se un player si connette dopo, parte con budget 0 — l'admin
         * dovrà assegnarglielo manualmente o ri-assegnare a tutti.
         */
        if (data.type === 'ADMIN_SET_BUDGET') {
            if (ws.role !== 'admin') return;

            const { budget } = data;
            if (typeof budget !== 'number' || budget < 0) return;

            // Assegna il budget a TUTTI i player registrati
            for (const id of registeredPlayers.keys()) {
                budgets.set(id, budget);
            }

            console.log(`💰 Budget ${budget} assegnato a tutti i player`);
            broadcastBudgets();
            return;
        }

        /**
         * 💰 ADMIN → MODIFICA BUDGET DI UN SINGOLO PLAYER
         * Permette all'admin di ritoccare il budget di un giocatore specifico,
         * utile per correggere errori o fare aggiustamenti manuali.
         */
        if (data.type === 'ADMIN_ADJUST_PLAYER_BUDGET') {
            if (ws.role !== 'admin') return;

            const { playerId, budget } = data;
            if (typeof budget !== 'number' || budget < 0) return;
            if (!registeredPlayers.has(playerId)) return;

            budgets.set(playerId, budget);
            console.log(`💰 Budget di ${registeredPlayers.get(playerId).name} aggiornato a ${budget}`);
            broadcastBudgets();
            return;
        }

        /**
         * ▶️ ADMIN → AVVIA UNA NUOVA ASTA
         * Imposta i parametri dell'asta (modalità, durata timer, offerta base)
         * e fa partire il countdown. Tutti i client ricevono AUCTION_STARTED.
         * 
         * @param {string} mode - 'standard' (con input crediti) o 'base' (solo voce)
         * @param {number} timerDuration - secondi del countdown (default 10)
         * @param {number} minBid - offerta base di partenza per modalità standard (default 0)
         */
        if (data.type === 'ADMIN_START_AUCTION') {
            if (ws.role !== 'admin') return;
            if (auctionState.active) return; // asta già in corso

            const { mode = 'standard', timerDuration = 10, minBid = 0 } = data;

            // Validazione parametri
            if (timerDuration < 3 || timerDuration > 120) return;
            if (minBid < 0) return;

            // Resetta lo stato dell'asta (esclusioni, leader, offerte)
            resetAuctionState();
            auctionState.active = true;
            auctionState.mode = mode;
            auctionState.timerDuration = timerDuration;
            auctionState.timerRemaining = timerDuration;
            auctionState.minBid = minBid;
            auctionState.currentBid = minBid;
            auctionState.lastBuzzerId = null;

            // Avvia il timer del countdown
            startAuctionTimer();

            console.log(`▶️ Asta AVVIATA — modalità: ${mode}, timer: ${timerDuration}s, offerta base: ${minBid}`);

            broadcast({
                type: 'AUCTION_STARTED',
                mode,
                timerDuration,
                minBid,
            });
            return;
        }

        /**
         * ✕ ADMIN → ANNULLA L'ASTA CORRENTE
         * Ferma il countdown, resetta lo stato dell'asta e notifica tutti.
         */
        if (data.type === 'ADMIN_CANCEL_AUCTION') {
            if (ws.role !== 'admin') return;
            if (!auctionState.active) return;

            stopAuctionTimer();
            resetAuctionState();
            broadcast({ type: 'AUCTION_CANCELLED' });
            broadcastAuctionState();
            console.log('✕ Asta ANNULLATA dall\'admin');
            return;
        }

        /**
         * 🔘 PLAYER → PRESSIONE PULSANTE ASTA (AUCTION_BUZZ)
         * 
         * Quando un giocatore preme il pulsante "OFFRI" durante un'asta attiva,
         * il server valuta:
         * 1. Se l'asta è attiva
         * 2. Se il timer non è già bloccato (buzzLocked = false)
         * 3. Se il player non è escluso (budget insufficiente)
         * 4. Se il player ha ancora budget sufficiente
         * 5. Se il player non è l'attuale leader (no auto-rilancio)
         * 6. Se sono passati almeno 200ms dall'ultimo buzz (concorrenza)
         * 
         * Se tutto ok, il player vince il buzz, il timer si ferma (buzzLocked = true)
         * e in modalità standard gli viene richiesto di inserire un'offerta.
         */
        if (data.type === 'AUCTION_BUZZ') {
            // Solo in modalità auction e solo da player
            if (gameMode !== 'auction') return;
            if (ws.role !== 'player') return;
            if (!auctionState.active) return;

            const playerId = ws.playerId;
            const player = connectedPlayers.get(playerId);
            if (!player || !player.canBuzz) return;

            // Validazione 1: timer bloccato? (asta in attesa di offerta)
            if (auctionState.buzzLocked) return;

            // Validazione 2: player escluso per budget? (solo modalità standard)
            if (auctionState.mode === 'standard' && auctionState.excludedPlayers.has(playerId)) {
                ws.send(JSON.stringify({
                    type: 'AUCTION_ERROR',
                    code: 'PLAYER_EXCLUDED',
                    message: 'Sei stato escluso dall\'asta corrente perché non hai abbastanza crediti.'
                }));
                return;
            }

            // Validazione 3: budget insufficiente? (solo modalità standard)
            if (auctionState.mode === 'standard') {
                const playerBudget = budgets.get(playerId) || 0;
                const minBuzzBid = auctionState.currentBid + 1;
                if (playerBudget < minBuzzBid) {
                    auctionState.excludedPlayers.add(playerId);
                    ws.send(JSON.stringify({
                        type: 'AUCTION_ERROR',
                        code: 'BUDGET_EXCEEDED',
                        message: 'Asta superiore ai tuoi crediti!'
                    }));
                    broadcast({
                        type: 'AUCTION_PLAYER_EXCLUDED',
                        playerId,
                        playerName: player.name,
                        reason: 'budget_exceeded'
                    });
                    return;
                }

                // Auto-rilancio? Il leader corrente non può premere (solo standard)
                if (playerId === auctionState.currentLeaderId) {
                    ws.send(JSON.stringify({
                        type: 'AUCTION_ERROR',
                        code: 'SELF_OUTBID',
                        message: 'Sei già il miglior offerente! Aspetta che qualcun altro offra di più.'
                    }));
                    return;
                }
            }

            // Validazione 4 (BASE): ultimo offerente non può ripetere
            if (auctionState.mode === 'base' && playerId === auctionState.lastBuzzerId) {
                ws.send(JSON.stringify({
                    type: 'AUCTION_ERROR',
                    code: 'BUZZ_AGAIN',
                    message: 'Hai appena parlato! Aspetta il prossimo giro.'
                }));
                return;
            }

            // Validazione 5: concorrenza — meno di 200ms dall'ultimo buzz? Ignora
            const now = Date.now();
            if (now - auctionState.lastBuzzTimestamp < 200) {
                return;
            }

            // --- Tutte le validazioni superate: il buzz è valido! ---

            auctionState.lastBuzzTimestamp = now;

            // Anti-last-second: se timer <= 3 secondi, lo resettiamo a 3
            if (auctionState.timerRemaining <= 3 && auctionState.timerRemaining > 0) {
                auctionState.timerRemaining = 3;
                console.log(`🛡️ Anti-last-second: timer resettato a 3s per ${player.name}`);
            }

            // ⏹ FERMA IL TIMER: nessun altro può premere finché non riprende
            stopAuctionTimer();
            auctionState.buzzLocked = true;
            auctionState.bidRequestedTo = null;
            auctionState.currentLeaderName = player.name;

            // In modalità base, segniamo chi ha buzzato per escluderlo dal prossimo round
            if (auctionState.mode === 'base') {
                auctionState.lastBuzzerId = playerId;
            }

            console.log(`🔘 BUZZ ASTA: ${player.name} ha premuto per primo — timer fermo`);

            // Broadcast a TUTTI: chi ha premuto
            broadcast({
                type: 'AUCTION_BUZZ_WINNER',
                playerId,
                playerName: player.name
            });

            // In modalità standard, chiediamo l'offerta SOLO al vincitore
            if (auctionState.mode === 'standard') {
                auctionState.bidRequestedTo = playerId;
                ws.send(JSON.stringify({
                    type: 'AUCTION_BID_REQUEST',
                    playerId,
                    playerName: player.name
                }));
                console.log(`💬 Richiesta offerta a ${player.name}`);
            } else {
                // Modalità base: il vincitore ha la parola, nessun input digitale.
                // L'admin gestisce l'offerta a voce e poi clicca "Riprendi Asta"
                // per sbloccare buzzLocked e far ripartire il timer.
                console.log(`🎤 ${player.name} ha la parola (modalità base)`);
            }

            broadcastAuctionState();
            return;
        }

        /**
         * 💰 PLAYER → INVIO OFFERTA (solo modalità Standard)
         * 
         * Dopo aver ricevuto AUCTION_BID_REQUEST, il player invia l'importo
         * che vuole offrire. Il server valida:
         * 1. Siamo in modalità standard
         * 2. Il player è proprio quello a cui è stata richiesta l'offerta
         * 3. L'importo >= currentBid + 1
         * 4. L'importo <= budget del player
         * 
         * Se valida, aggiorna currentBid, currentLeader, sblocca il timer
         * e fa ripartire il countdown. Poi controlla le esclusioni.
         */
        if (data.type === 'AUCTION_BID') {
            if (gameMode !== 'auction') return;
            if (ws.role !== 'player') return;
            if (!auctionState.active) return;
            if (auctionState.mode !== 'standard') return;

            const { amount } = data;
            const playerId = ws.playerId;
            const player = connectedPlayers.get(playerId);

            // Validazione 1: solo il player a cui è stata richiesta può offrire
            if (auctionState.bidRequestedTo !== playerId) {
                ws.send(JSON.stringify({
                    type: 'AUCTION_ERROR',
                    code: 'BID_NOT_REQUESTED',
                    message: 'Non è il tuo turno per fare un\'offerta.'
                }));
                return;
            }

            // Validazione 2: importo valido (deve essere >= currentBid + 1)
            const minValidBid = auctionState.currentBid + 1;
            if (amount < minValidBid) {
                ws.send(JSON.stringify({
                    type: 'AUCTION_ERROR',
                    code: 'BID_TOO_LOW',
                    message: `L'offerta minima è ${minValidBid} crediti.`
                }));
                return;
            }

            const playerBudget = budgets.get(playerId) || 0;

            // Validazione 3: budget sufficiente
            if (amount > playerBudget) {
                ws.send(JSON.stringify({
                    type: 'AUCTION_ERROR',
                    code: 'BUDGET_EXCEEDED',
                    message: `Non hai abbastanza crediti! Il tuo budget è ${playerBudget}.`
                }));
                return;
            }

            // --- Offerta valida! ---
            auctionState.currentBid = amount;
            auctionState.currentLeaderId = playerId;
            auctionState.currentLeaderName = player.name;
            auctionState.buzzLocked = false;
            auctionState.bidRequestedTo = null;

            // ▶️ Il timer RIPARTE: resettiamo a timerDuration e riavviamo il countdown
            auctionState.timerRemaining = auctionState.timerDuration;
            startAuctionTimer();

            console.log(`💰 ${player.name} offre ${amount} crediti (budget: ${playerBudget}) — timer ripartito`);

            // Broadcast a tutti della nuova offerta
            broadcast({
                type: 'AUCTION_BID_UPDATE',
                playerId,
                playerName: player.name,
                amount
            });

            // Controllo esclusioni: tutti i player che non possono più competere
            // vengono automaticamente esclusi dall'asta corrente
            checkPlayerExclusions();

            broadcastAuctionState();
            broadcastBudgets();
            return;
        }

        /**
         * 🔓 ADMIN → RIPRENDI ASTA (solo modalità Base)
         * Dopo che il vincitore del buzz ha parlato (modalità base),
         * l'admin clicca questo pulsante per sbloccare buzzLocked
         * e far ripartire il countdown.
         */
        if (data.type === 'ADMIN_RESUME_AUCTION') {
            if (ws.role !== 'admin') return;
            if (!auctionState.active) return;
            if (auctionState.mode !== 'base') return;
            if (!auctionState.buzzLocked) return;

            auctionState.buzzLocked = false;
            auctionState.bidRequestedTo = null;
            // ▶️ Timer riparte da timerDuration
            auctionState.timerRemaining = auctionState.timerDuration;
            // ⏭ L'ultimo offerente rimane escluso (lastBuzzerId) fino a che
            // qualcun altro non buzz
            startAuctionTimer();

            console.log('🔓 Asta ripresa (modalità base) — timer ripartito');
            broadcastAuctionState();
            return;
        }

        /**
         * ✅ PLAYER → CONFERMA PAROLA (solo modalità Base)
         *
         * Dopo aver premuto OFFRI e parlato a voce, il giocatore che ha vinto il buzz
         * clicca "Confermo" per comunicare al server che ha finito. Il server esegue
         * la stessa logica di ADMIN_RESUME_AUCTION (sblocca buzzLocked, riavvia timer)
         * ma validando che la richiesta provenga proprio dal giocatore che ha buzzato.
         *
         * L'admin mantiene "Riprendi asta" come fallback per sicurezza (es. il
         * giocatore si disconnette o non clicca).
         */
        if (data.type === 'AUCTION_CONFIRM_SPEAK') {
            // Solo i player possono usare questo messaggio
            if (ws.role !== 'player') return;
            // L'asta deve essere attiva, in modalità base, con buzzLocked = true
            if (!auctionState.active) return;
            if (auctionState.mode !== 'base') return;
            if (!auctionState.buzzLocked) return;

            const playerId = ws.playerId;
            // Solo il giocatore che ha buzzato per ultimo può confermare
            if (playerId !== auctionState.lastBuzzerId) return;

            // Sblocca il timer e lo fa ripartire (stessa logica di ADMIN_RESUME_AUCTION)
            auctionState.buzzLocked = false;
            auctionState.bidRequestedTo = null;
            auctionState.timerRemaining = auctionState.timerDuration;
            startAuctionTimer();

            console.log(`✅ Player "${ws.playerName}" ha confermato la parola — asta ripresa`);
            broadcastAuctionState();
            return;
        }
    });

    /**
     * Evento: client disconnesso
     *
     * Logica:
     * 1. Se la socket è stata già sostituita (nuova HELLO arrivata) → skip.
     * 2. NON puliamo lo stato auction (bidRequestedTo, leader, ecc.):
     *    - Se il player ha fatto refresh, si riconnette e riprende da dov'era.
     *    - Se ha chiuso il browser definitivamente, l'admin può annullare l'asta.
     * 3. Rimuoviamo solo da connectedPlayers e activeSockets.
     */
    ws.on('close', () => {
        if (!ws.playerId) {
            console.log(`🔴 ${ws.role || '?'} "${ws.playerName || 'Sconosciuto'}" disconnesso (mai registrato)`);
            return;
        }

        if (activeSockets.get(ws.playerId) !== ws) {
            console.log(`🔴 ${ws.role || '?'} "${ws.playerName}" disconnesso (sostituito da reconnect)`);
            return;
        }

        connectedPlayers.delete(ws.playerId);
        activeSockets.delete(ws.playerId);
        broadcastPlayers();

        console.log(`🔴 ${ws.role || '?'} "${ws.playerName}" disconnesso definitivamente`);
    });
});

/* ============================================================
   FUNZIONI HELPER — BROADCAST
   ============================================================ */

/**
 * Invia un messaggio JSON a TUTTI i client connessi.
 * Filtra solo le socket in stato OPEN per evitare errori.
 */
function broadcast(message) {
    const payload = JSON.stringify(message);
    wss.clients.forEach(client => {
        if (client.readyState === WebSocket.OPEN) {
            client.send(payload);
        }
    });
}

/**
 * 👥 Invia la lista dei giocatori connessi a TUTTI i client.
 * In modalità auction, include anche il budget di ogni player.
 */
function broadcastPlayers() {
    const players = Array.from(connectedPlayers.entries()).map(
        ([id, data]) => {
            const player = {
                id,
                name: data.name,
                canBuzz: data.canBuzz,
            };
            // In modalità auction, includiamo il budget
            if (gameMode === 'auction') {
                player.budget = budgets.get(id) || 0;
            }
            return player;
        }
    );

    broadcast({
        type: 'PLAYERS_UPDATE',
        players
    });
}

/**
 * 🏆 Invia la classifica dei punteggi a TUTTI i client
 */
function broadcastScores() {
    const scoreList = Array.from(scores.entries()).map(
        ([id, score]) => {
            const player = registeredPlayers.get(id);
            return {
                id,
                name: player ? player.name : 'Sconosciuto',
                score
            };
        }
    );

    broadcast({
        type: 'SCORES_UPDATE',
        scores: scoreList
    });
}

/**
 * 🔀 Fisher-Yates shuffle — mescola un array in-place.
 *
 * Algoritmo classico di mescolamento con complessità O(n):
 * - Parte dall'ultimo elemento e sceglie casualmente un indice j tra 0 e i
 * - Scambia l'elemento corrente (i) con quello all'indice j
 * - Continua finché non arriva al primo elemento
 *
 * Usato per randomizzare l'ordine delle risposte delle domande prima
 * di inviarle all'admin. Il server conosce qual è la corretta (flag
 * corretta: true) ma la posizione è imprevedibile.
 *
 * @param {Array} array - Array da mescolare (modificato in-place)
 * @returns {Array} - Lo stesso array mescolato
 *
 * Esempio:
 *   let risposte = [
 *     { testo: 'Vero', corretta: true },
 *     { testo: 'Falso', corretta: false },
 *   ];
 *   shuffleFisherYates(risposte);
 *   // → [{ testo: 'Falso', corretta: false }, { testo: 'Vero', corretta: true }]
 */
function shuffleFisherYates(array) {
    for (let i = array.length - 1; i > 0; i--) {
        // Sceglie un indice casuale tra 0 e i (incluso)
        const j = Math.floor(Math.random() * (i + 1));
        // Scambia l'elemento in posizione i con quello in posizione j
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}

/* ============================================================
   FUNZIONI HELPER — ASTA FANTACALCIO
   ============================================================ */

/**
 * 🎮 Invia lo stato completo dell'asta a tutti i client.
 * Utile al reconnect dell'admin o dei player per sincronizzarsi.
 */
function broadcastAuctionState() {
    broadcast({
        type: 'AUCTION_STATE',
        active: auctionState.active,
        mode: auctionState.mode,
        timerRemaining: auctionState.timerRemaining,
        timerDuration: auctionState.timerDuration,
        currentBid: auctionState.currentBid,
        minBid: auctionState.minBid,
        currentLeaderId: auctionState.currentLeaderId,
        currentLeaderName: auctionState.currentLeaderName,
        buzzLocked: auctionState.buzzLocked,
        bidRequestedTo: auctionState.bidRequestedTo,
        lastBuzzerId: auctionState.lastBuzzerId,
        excludedIds: Array.from(auctionState.excludedPlayers),
    });
}

/**
 * 💰 Invia la lista dei budget di tutti i player a tutti i client.
 * L'admin li usa per monitorare i crediti, i player vedono solo il proprio.
 */
function broadcastBudgets() {
    const budgetList = Array.from(budgets.entries()).map(([id, budget]) => {
        const player = registeredPlayers.get(id);
        return {
            id,
            name: player ? player.name : 'Sconosciuto',
            budget
        };
    });

    broadcast({
        type: 'BUDGETS_UPDATE',
        budgets: budgetList
    });
}

/**
 * ▶️ Avvia il timer del countdown dell'asta.
 * Ogni secondo decrementa timerRemaining e fa broadcast.
 * Quando timerRemaining arriva a 0, l'asta termina.
 * Se timerRemaining <= 3 e > 0, è la "zona pericolo" —
 * il prossimo buzz valido resetta il timer a 3 (anti-last-second).
 */
function startAuctionTimer() {
    // Cancella eventuale timer precedente (sicurezza)
    if (auctionState.timerInterval) {
        clearInterval(auctionState.timerInterval);
    }

    auctionState.timerInterval = setInterval(() => {
        auctionState.timerRemaining--;

        // Broadcast del timer ogni secondo
        broadcast({
            type: 'AUCTION_TIMER',
            remaining: auctionState.timerRemaining
        });

        // Timer scaduto → chiusura asta
        if (auctionState.timerRemaining <= 0) {
            stopAuctionTimer();
            closeAuction();
        }
    }, 1000);
}

/**
 * ⏹ Ferma il timer del countdown.
 */
function stopAuctionTimer() {
    if (auctionState.timerInterval) {
        clearInterval(auctionState.timerInterval);
        auctionState.timerInterval = null;
    }
}

/**
 * 🏁 Chiude l'asta corrente.
 * Se c'è un leader (miglior offerente), gli vengono scalati i crediti
 * e viene proclamato vincitore. Poi resetta lo stato dell'asta.
 */
function closeAuction() {
    auctionState.active = false;
    stopAuctionTimer();

    const winnerId = auctionState.currentLeaderId;
    const winnerName = auctionState.currentLeaderName;
    const winningBid = auctionState.currentBid;

    if (winnerId && winningBid > 0) {
        // Budget scalato solo in modalità standard
        if (auctionState.mode === 'standard') {
            const currentBudget = budgets.get(winnerId) || 0;
            const newBudget = Math.max(0, currentBudget - winningBid);
            budgets.set(winnerId, newBudget);
            console.log(`🏆 ${winnerName} vince l'asta con ${winningBid} crediti! Budget residuo: ${newBudget}`);
            broadcastBudgets();
        }

        broadcast({
            type: 'AUCTION_TIMEOUT',
            winnerId,
            winnerName,
            amount: winningBid
        });
    } else if (auctionState.mode === 'base' && winnerName) {
        // Modalità base: il vincitore è l'ultimo che ha buzzato (gestito a voce dall'admin)
        console.log(`🏆 ${winnerName} vince l'asta (modalità base)`);
        broadcast({
            type: 'AUCTION_TIMEOUT',
            winnerId: null,
            winnerName,
            amount: 0
        });
    } else {
        // Nessuna offerta valida — asta deserta
        console.log('⏰ Asta terminata — nessun vincitore');
        broadcast({
            type: 'AUCTION_TIMEOUT',
            winnerId: null,
            winnerName: null,
            amount: 0
        });
    }

    broadcastAuctionState();
}

/**
 * 🔄 Resetta completamente lo stato dell'asta (senza fermare il timer — usa stopAuctionTimer prima).
 * Pulisce leader, offerte, esclusioni e blocchi.
 */
function resetAuctionState() {
    auctionState.active = false;
    auctionState.mode = 'standard';
    auctionState.timerDuration = 10;
    auctionState.timerRemaining = 0;
    auctionState.timerInterval = null;
    auctionState.currentBid = 0;
    auctionState.minBid = 0;
    auctionState.currentLeaderId = null;
    auctionState.currentLeaderName = null;
    auctionState.lastBuzzTimestamp = 0;
    auctionState.buzzLocked = false;
    auctionState.bidRequestedTo = null;
    auctionState.lastBuzzerId = null;
    auctionState.excludedPlayers = new Set();
}

/**
 * 🔍 Controlla le esclusioni dopo un'offerta.
 * Un player viene escluso se il suo budget è inferiore all'offerta minima
 * per il rilancio successivo (currentBid + 1). Il leader corrente (chi ha
 * appena fatto l'offerta) non viene escluso — verrà gestito dall'auto-rilancio
 * al prossimo tentativo di buzz.
 */
function checkPlayerExclusions() {
    const minNextBid = auctionState.currentBid + 1;

    for (const [playerId, budget] of budgets.entries()) {
        // Salta il leader corrente (ha appena fatto un'offerta valida)
        if (playerId === auctionState.currentLeaderId) continue;

        // Salta chi è già escluso
        if (auctionState.excludedPlayers.has(playerId)) continue;

        // Escludi se il budget è insufficiente per il rilancio minimo
        if (budget < minNextBid) {
            auctionState.excludedPlayers.add(playerId);

            const playerName = registeredPlayers.has(playerId)
                ? registeredPlayers.get(playerId).name
                : 'Sconosciuto';

            console.log(`🚫 ${playerName} escluso dall'asta (budget ${budget} < minimo ${minNextBid})`);

            broadcast({
                type: 'AUCTION_PLAYER_EXCLUDED',
                playerId,
                playerName,
                reason: 'budget_exceeded'
            });
        }
    }
}

/**
 * Pulisce periodicamente le connessioni WebSocket in stato CLOSED/CLOSING.
 * NON invia messaggi di heartbeat — controlla solo il readyState interno
 * del socket (zero traffico di rete). Cattura socket il cui evento 'close'
 * non è stato processato correttamente (es. browser chiuso, crash).
 */
const CLEANUP_INTERVAL = setInterval(() => {
    let changed = false;
    wss.clients.forEach(client => {
        if (client.readyState === WebSocket.CLOSED || client.readyState === WebSocket.CLOSING) {
            if (client.playerId) {
                // Pulizia stato auction se necessario
                if (gameMode === 'auction' && auctionState.active) {
                    if (auctionState.currentLeaderId === client.playerId) {
                        auctionState.currentLeaderId = null;
                        auctionState.currentLeaderName = null;
                    }
                    if (auctionState.bidRequestedTo === client.playerId) {
                        auctionState.bidRequestedTo = null;
                    }
                    if (auctionState.lastBuzzerId === client.playerId) {
                        auctionState.lastBuzzerId = null;
                    }
                }
                connectedPlayers.delete(client.playerId);
                activeSockets.delete(client.playerId);
                changed = true;
            }
        }
    });
    if (changed) {
        broadcastPlayers();
        broadcastAuctionState();
    }
}, 30000);

/**
 * ❤️ Heartbeat interval: ogni 15 secondi invia un ping a tutti i client.
 * 
 * - Se isAlive === false → il client non ha risposto al ping precedente
 *   → connessione morta, chiamiamo terminate() che triggera l'evento 'close'
 *   e la conseguente pulizia (connectedPlayers, activeSockets, ecc.).
 * - Se isAlive === true → impostiamo false e mandiamo un nuovo ping;
 *   se il client risponderà col pong, isAlive tornerà true.
 * 
 * Questo serve a:
 *   ✅ Tenere viva la WebSocket attraverso il proxy di Render (timeout ~55s)
 *   ✅ Rilevare connessioni morte in ≤15s (invece di aspettare 55s+)
 */
const HEARTBEAT_INTERVAL = setInterval(() => {
    wss.clients.forEach((ws) => {
        if (ws.isAlive === false) {
            // Nessun pong ricevuto dal ciclo precedente → socket morta
            console.log(`💀 Heartbeat kill per "${ws.playerName || 'sconosciuto'}" (${ws.role || '?'})`);
            // terminate() chiude brutalmente la socket → triggera l'evento 'close'
            // che provvede a pulire connectedPlayers e activeSockets
            ws.terminate();
            return;
        }
        // Marca come "in attesa di pong" e invia il ping
        ws.isAlive = false;
        ws.ping();
    });
}, 15000);

/**
 * 🗄️ Inizializza il database PostgreSQL.
 *
 * Cosa fa db.init():
 * 1. Si connette a PostgreSQL usando DATABASE_URL
 * 2. Crea le tabelle categorie e domande (se non esistono)
 * 3. Se le tabelle sono vuote, le popola con i dati di seed.sql
 *
 * Se DATABASE_URL è mancante o la connessione fallisce,
 * il server parte comunque (modalità graceful), ma la sezione
 * "Domande Quiz" nell'admin mostrerà un avviso.
 *
 * Nota: l'avvio del WebSocket server (new WebSocketServer) non è
 * bloccante, quindi le connessioni possono arrivare prima che
 * db.init() finisca. È sicuro perché i primi messaggi (HELLO,
 * ADMIN_LOGIN) non usano il database — solo ADMIN_GET_CATEGORIES
 * e ADMIN_GET_QUESTION dipendono dal DB, e arrivano dopo il login.
 */
await db.init();
console.log(`🚀 Quiz server WebSocket in ascolto sulla porta 3000`);
