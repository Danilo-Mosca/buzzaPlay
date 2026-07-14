# 🧠 BuzzaPlay

**BuzzaPlay** – Trasforma il tuo smartphone nel pulsante più veloce. Una web-app per quiz dal vivo che sostituisce la classica pulsantiera fisica con il browser.
Supporta due modalità di gioco: **Quizzettone** (buzz classico) e **Asta Fantacalcio** (aste a crediti).

Il **backend** (Node.js + WebSocket) gestisce in tempo reale lo stato del gioco e la comunicazione con tutti i dispositivi connessi.  
Il **frontend** (React + Vite) offre una UI gamificata con sezioni separate per giocatore e amministratore.

## 🎯 Scopo dell’applicazione

**BuzzaPlay** è pensata per:
- quiz dal vivo e aste a crediti
- giochi a squadre o individuali
- contesti educativi o ricreativi
- eventi in cui non si vogliono usare dispositivi hardware dedicati

## 🌐 Accessibilità

BuzzaPlay è utilizzabile senza installare app dedicate ed è compatibile con:

- 📱 Smartphone  
- 📱 Tablet  
- 💻 PC e Notebook  

È sufficiente un browser moderno e una connessione alla rete.

## 🚀 Funzionalità

### Modalità Quizzettone (classica)
- 🔌 Comunicazione in tempo reale tramite WebSocket
- 🧑‍🤝‍🧑 Gestione di più giocatori contemporaneamente
- 🛎️ Pulsante BUZZ con feedback immediato
- 🏆 **Classifica** con punteggi persistenti (➕/➖ per giocatore, reset globale)
- ❓ **Database PostgreSQL** (14 categorie, 100+ domande con 4 risposte ciascuna)
- 🎲 **Domande visualizzabili nell'admin** con filtri per categoria e difficoltà
- 🔀 **Risposte in ordine casuale** (Fisher-Yates shuffle lato server)
- 💡 **Rivela risposta corretta** (UI locale nell'admin)

### Modalità Asta Fantacalcio
- 💰 **Budget individuale** — ogni giocatore parte con un monte crediti assegnato dall'admin
- ⏱️ **Timer countdown** circolare con colori (verde >5s, giallo 3–5s, rosso <3s con pulsazione)
- 🔘 **Pulsante OFFRI** — i giocatori competono per fare l'offerta più alta entro il tempo
- 🚫 **Auto-esclusione** — chi non ha più budget sufficiente viene escluso automaticamente
- 🛡️ **Anti-last-second** — se si preme OFFRI con ≤3s, il timer viene resettato a 3s
- 📋 **Due sotto-modalità:**
  - **Standard** — il vincitore del buzz inserisce digitalmente l'offerta in crediti
  - **Base** — l'offerta è gestita a voce dall'admin, che sblocca manualmente il timer
- 🎤 **Nome del miglior offerente** mostrato in tempo reale durante l'asta
- 🔐 Pannello admin protetto da password
- 🎛️ Admin: cambio modalità, avvio/annulla asta, gestione budget e blocchi
- 📊 **Scheda "Stato Asta"** — timer, offerta, miglior offerente, stato pulsantiera, esclusioni
- 🎨 UI gamificata (gradiente scuro, animazioni, card, responsive mobile-first)
- 🌐 Funziona su qualsiasi rete LAN senza configurazione IP

## Struttura del progetto

```
buzzaplay/
├── backend-buzzaplay/            ← Server WebSocket (Node.js)
│   ├── .env                      ← Password admin + DATABASE_URL (gitignored)
│   ├── .env.example              ← Template per .env
│   ├── server.js                 ← Entry point (porta 3000)
│   │                             (stato quiz + stato asta + 20+ messaggi)
│   ├── db/
│   │   ├── schema.sql            ← DDL tabelle (categorie + domande)
│   │   ├── seed.sql              ← Dati iniziali (14 categorie, 100+ domande)
│   │   └── index.js              ← Connessione PostgreSQL + init
│   └── package.json
├── frontend-buzzaplay/           ← Client React (Vite)
│   ├── src/
│   │   ├── main.jsx              ← Entry point
│   │   ├── App.jsx               ← Routes: / e /admin
│   │   ├── components/
│   │   │   ├── QuizButton.jsx    ← Schermata giocatore (modalità quiz)
│   │   │   ├── AuctionPlayer.jsx ← Schermata giocatore (modalità asta)
│   │   │   ├── Admin.jsx         ← Dashboard admin (entrambe modalità)
│   │   │   ├── AuctionAdmin.jsx  ← Admin dashboard (modalità asta)
│   │   │   ├── DomandeQuiz.jsx   ← Gestione DB domande quiz (admin)
│   │   │   ├── AdminLogin.jsx    ← Schermata login admin
│   │   │   └── CountdownTimer.jsx← Timer circolare SVG (riutilizzato)
│   │   ├── hooks/
│   │   │   ├── useQuizSocket.jsx ← Hook WebSocket (quiz + asta + domande DB)
│   │   │   └── useAdminAuth.jsx  ← Hook auth admin
│   │   └── utils/
│   │       └── playerIdentity.js ← UUID + localStorage
│   └── package.json
├── AGENTS.md                     ← Istruzioni per l'agente AI
├── implementation_plan.md        ← Documento di design originale
├── implementation_plan_asta_fantacalcio.md  ← Documento di design asta
├── implementation_plan_db_quizzettone.md   ← Documento di design database
└── README.md
```

## Requisiti

- Node.js 20.6+ (per `--env-file` e `--watch`)
- Database PostgreSQL (opzionale — il server parte comunque in modalità graceful)
  - Se mancante o non raggiungibile: il server funziona senza la sezione "Domande Quiz"
  - Tutte le altre funzionalità (buzz, punteggi, aste) funzionano normalmente
  - Su Render.com: PostgreSQL Free Tier incluso
  - In locale: Docker (`docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=password postgres:16`)

## 📦 Avvio del progetto

```bash
# 1. Clona la repository:
git clone https://github.com/danilo-mosca/buzzaplay.git
```

```bash
# 2. Backend: installa dipendenze e avvia
cd backend-buzzaplay
npm install
cp .env.example .env          # configura password admin e DATABASE_URL
npm run dev                   # server su ws://localhost:3000

# 3. Frontend (nuovo terminale)
cd frontend-buzzaplay
npm install
npm run dev                   # http://localhost:5173

# 4. Per accesso da altri dispositivi sulla stessa rete avviare il frontend con il comando:
npm run dev -- --host
```

## Utilizzo

### Modalità Quizzettone
1. Apri `http://localhost:5173` — i giocatori inseriscono il nome e premono BUZZ
2. Apri `http://localhost:5173/admin` — l'amministratore abilita buzz, assegna punteggi
3. I dispositivi sulla stessa rete usano l'IP del server al posto di `localhost`

### Modalità Asta Fantacalcio
1. Dall'admin, clicca **💰 Asta Fantacalcio** per cambiare modalità
2. Assegna un **budget iniziale** a tutti i giocatori (es. 500)
3. Configura **durata timer**, **modalità** (Standard/Base) e **offerta base**
4. Clicca **🎬 AVVIA ASTA** — parte il countdown
5. I giocatori premono **OFFRI!** per aggiudicarsi il diritto di fare un'offerta
6. In modalità Standard: il vincitore inserisce l'importo e conferma
7. In modalità Base: il vincitore parla, poi clicca **✅ Confermo** (pulsante separato da OFFRI, lontano per evitare click accidentali) oppure l'admin clicca **🔓 RIPRENDI ASTA**
8. Al termine, il vincitore paga in crediti — l'admin può avviare una nuova asta

## Comandi disponibili

| Package | Comando | Effetto |
|---|---|---|
| backend | `npm run dev` | `node --env-file=.env --watch server.js` |
| frontend | `npm run dev` | `vite` (dev server) |
| frontend | `npm run build` | `vite build` (produzione) |
| frontend | `npm run lint` | `eslint .` |
| frontend | `npm run preview` | `vite preview` (anteprima build) |

## Messaggi WebSocket (back-end)

### Quiz (entrambe modalità)
| Messaggio | Direzione | Effetto |
|---|---|---|
| `HELLO` | → server | Registrazione/riconnessione giocatore |
| `BUZZ` | → server | Pressione pulsante (solo modalità quiz) |
| `ADMIN_LOGIN` | → server | Autenticazione admin |
| `ADMIN_SET_CAN_BUZZ` | → server | Abilita/blocca buzz per giocatore |
| `ADMIN_FORCE_RESET_PLAYER` | → server | Reset identità giocatore |
| `PLAYER_UNREGISTER` | → server | Auto-deregistrazione |
| `RESET` | → server | Reset quiz o annulla asta |
| `PLAYERS_UPDATE` | ← server | Lista giocatori aggiornata |
| `WINNER` | ← server | Annuncio primo BUZZ |
| `SCORES_UPDATE` | ← server | Classifica aggiornata |
| `FORCE_RESET` | ← server | Forza reset lato client |

### Asta Fantacalcio
| Messaggio | Direzione | Effetto |
|---|---|---|
| `ADMIN_SET_GAME_MODE` | → server | Cambia modalità (quiz ↔ auction) |
| `ADMIN_SET_BUDGET` | → server | Assegna budget a tutti i giocatori |
| `ADMIN_ADJUST_PLAYER_BUDGET` | → server | Modifica budget di un singolo |
| `ADMIN_START_AUCTION` | → server | Avvia nuova asta |
| `ADMIN_CANCEL_AUCTION` | → server | Annulla asta in corso |
| `ADMIN_RESUME_AUCTION` | → server | Sblocca buzz (modalità Base) |
| `AUCTION_BUZZ` | → server | Pressione OFFRI |
| `AUCTION_BID` | → server | Invio offerta (modalità Standard) |
| `AUCTION_CONFIRM_SPEAK` | → server | Player conferma la parola e sblocca il timer (modalità Base) |
| `AUCTION_STARTED` | ← server | Asta avviata |
| `AUCTION_TIMER` | ← server | Tick countdown (ogni secondo) |
| `AUCTION_BUZZ_WINNER` | ← server | Vincitore del buzz |
| `AUCTION_BID_REQUEST` | ← server | Richiesta offerta al vincitore |
| `AUCTION_BID_UPDATE` | ← server | Nuova offerta registrata |
| `AUCTION_TIMEOUT` | ← server | Asta terminata (vincitore o deserta) |
| `AUCTION_CANCELLED` | ← server | Asta annullata dall'admin |
| `AUCTION_STATE` | ← server | Stato completo asta (sync) |
| `AUCTION_PLAYER_EXCLUDED` | ← server | Giocatore escluso per budget |
| `AUCTION_ERROR` | ← server | Errore specifico per giocatore |
| `BUDGETS_UPDATE` | ← server | Budget aggiornati |
| `GAME_MODE_CHANGE` | ← server | Cambio modalità notificato a tutti |

### Domande Quiz (Database PostgreSQL)
| Messaggio | Direzione | Effetto |
|---|---|---|
| `ADMIN_GET_CATEGORIES` | → server | Richiede la lista delle categorie (solo admin) |
| `ADMIN_GET_QUESTION` | → server | Richiede una domanda con filtri categoria/difficoltà (solo admin) |
| `CATEGORIES` | ← server | Lista delle categorie disponibili |
| `QUESTION` | ← server | Domanda con 4 risposte mescolate (o `exhausted: true` se filtro esaurito) |
| `QUESTION_CYCLE_RESET` | ← server | Tutte le domande mostrate, ciclo di non-ripetizione resettato |

## Tecnologie

- **Backend:** Node.js, `ws` (WebSocket), `pg` (PostgreSQL driver)
- **Frontend:** React 19, Vite, react-router-dom v7
- **Stile:** CSS vanilla con design system custom
- **Persistenza:** PostgreSQL (domande quiz), localStorage (identità player, auth admin), server RAM (stato gioco, punteggi, budget)
- **Rilevamento connessioni morte:** WebSocket ping/pong heartbeat ogni 15s
