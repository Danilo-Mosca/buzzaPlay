import { useEffect, useRef } from 'react';
import { getOrCreatedPlayerId } from '../utils/playerIdentity';

/**
 * 🎮 useQuizSocket — Hook per la connessione WebSocket
 * 
 * Questo hook gestisce la comunicazione in tempo reale tra il client
 * (sia player che admin) e il server WebSocket. Supporta entrambe le
 * modalità di gioco: Quizzettone classico e Asta Fantacalcio.
 * 
 * @param {'player'|'admin'} role - Ruolo del client
 * @param {function} onMessage - Callback invocata per ogni messaggio ricevuto
 * @returns {object} - Funzioni per interagire col server
 */
export function useQuizSocket(role, onMessage) {
    // useRef mantiene la stessa socket tra i render
    const socketRef = useRef(null);
    // Coda di messaggi: accumula i comandi inviati prima che la socket diventi OPEN
    const messageQueueRef = useRef([]);
    // Ref per il timeout di riconnessione (per cancellarlo al cleanup)
    const reconnectTimeoutRef = useRef(null);
    // Ref per la callback di re-autenticazione dopo riconnessione
    const onReconnectRef = useRef(null);
    // Flag: true se la chiusura è stata intenzionale (es. unmount del componente)
    const intentionalCloseRef = useRef(false);
    // Flag: true solo sulla primissima connessione (per non chiamare onReconnect al mount)
    const isFirstConnectRef = useRef(true);

    /**
     * 🔌 Crea (o ricrea) la connessione WebSocket.
     * Separata in una funzione così può essere richiamata sia al mount
     * che dopo una disconnessione non intenzionale (reconnect automatico).
     */
    function connect() {
        // Annulla eventuali timeout di riconnessione pendenti
        if (reconnectTimeoutRef.current) {
            clearTimeout(reconnectTimeoutRef.current);
            reconnectTimeoutRef.current = null;
        }

        // Creiamo la connessione WebSocket. window.location.hostname è una proprietà di JavaScript che ti restituisce il nome del dominio (host) della pagina web corrente. Serve a connettersi da reti differenti, nel test ho usato il classico ip dinamico ws://192.168.1.86:3000 ovvero nel mio ambiente di sviluppo locale.
        // RIATTIVARE LA RIGA DI SEGUITO PER I TEST IN LOCALE E COMMENTARE LE DUE RIGHE DOPO MODIFICHE PER IL DEPLOY:
        const ws = new WebSocket(`ws://${window.location.hostname}:3000`);    // Crea la connessione al server WebSocket

        // MODIFICHE PER IL DEPLOY: (disattivare la riga sopra e attivare le due seguenti)
        // MODIFICHE PER IL DEPLOY: (disattivare le due righe di seguito e riattivare quella di sopra se si vuole far partire l'app in locale per test)
        // Cosa fa questa modifica: dice al frontend di connettersi allo stesso host da cui è servito (es. buzzaplay.onrender.com) con path /ws. nginx intercetterà /ws e lo proxy-passà al backend Node.js.
        // const protocol = window.location.protocol === 'https:' ? 'wss:' : 'ws:';
        // const ws = new WebSocket(`${protocol}//${window.location.host}/ws`);

        socketRef.current = ws;         // Salva la socket in socketRef.current così può essere riutilizzata fuori dall’useEffect.
        // socketRef.current conterrà sempre l’istanza attiva della socket

        ws.onopen = () => {
            console.log('🔌 WebSocket aperta');
            // Svuota la coda dei messaggi accumulati
            while (messageQueueRef.current.length > 0) {
                const payload = messageQueueRef.current.shift();
                ws.send(JSON.stringify(payload));
            }

            // Se NON è la primissima connessione, chiama la callback di re-auth
            // che il componente ha registrato via socket.onReconnect(...)
            if (!isFirstConnectRef.current && onReconnectRef.current) {
                onReconnectRef.current();
            }
            isFirstConnectRef.current = false;
        };

        ws.onmessage = (event) => {
            const data = JSON.parse(event.data);
            onMessage(data);
        };

        /**
         * 🔴 Riconnessione automatica: se la WebSocket si chiude INASPETTATAMENTE
         * (non per unmount del componente o chiamata intenzionale), dopo 3 secondi
         * ricreiamo la connessione. Il componente verrà notificato via onReconnect
         * per re-inviare HELLO o ADMIN_LOGIN.
         */
        ws.onclose = () => {
            if (!intentionalCloseRef.current) {
                console.log('🔴 WebSocket chiusa inaspettatamente — riconnessione tra 3 secondi...');
                reconnectTimeoutRef.current = setTimeout(() => {
                    connect();
                }, 3000);
            }
        };

        ws.onerror = () => {
            // L'evento 'error' è SEMPRE seguito da 'close', quindi gestiamo
            // la riconnessione in onclose per evitare duplicati.
        };
    }

    // useEffect eseguito solo al montaggio del componente
    useEffect(() => {
        // Prima connessione: all'avvio del componente
        intentionalCloseRef.current = false;
        isFirstConnectRef.current = true;
        connect();

        // Cleanup allo smontaggio del componente
        return () => {
            intentionalCloseRef.current = true;   // Impedisce il reconnect
            if (reconnectTimeoutRef.current) {
                clearTimeout(reconnectTimeoutRef.current);
                reconnectTimeoutRef.current = null;
            }
            if (socketRef.current) {
                socketRef.current.close();
                socketRef.current = null;
            }
        };
    }, []);

    /**
     * 🛡️ INVIO SICURO DEI MESSAGGI
     * Se la socket non è ancora OPEN, il messaggio viene accodato
     * e inviato automaticamente appena la connessione è pronta.
     * Questo evita race condition all'avvio.
     */
    function safeSend(payload) {
        const ws = socketRef.current;
        if (!ws || ws.readyState !== WebSocket.OPEN) {
            console.warn('⚠️ WebSocket non pronta, messaggio messo in coda:', payload);
            messageQueueRef.current.push(payload);
            return;
        }
        ws.send(JSON.stringify(payload));
    }

    // ================================================================
    //  FUNZIONI COMUNI (player + admin)
    // ================================================================

    /**
     * Invia HELLO al server per registrare il player.
     * Il server risponde con NAME_OK (o NAME_TAKEN).
     */
    function sendWelcome(playerName) {
        const playerId = getOrCreatedPlayerId();
        safeSend({ type: 'HELLO', playerId, playerName, role });
    }

    /**
     * 🔐 Autentica l'admin presso il server WebSocket.
     * Questo assegna il ruolo 'admin' alla socket lato server.
     */
    function sendAdminLogin(password) {
        safeSend({ type: 'ADMIN_LOGIN', password });
    }

    /**
     * 🗑️ Auto-deregistrazione del player.
     * Inviato PRIMA di resettare il localStorage per "Entra come nuovo giocatore".
     */
    function selfUnregister() {
        safeSend({ type: 'PLAYER_UNREGISTER' });
    }

    // ================================================================
    //  FUNZIONI MODALITÀ QUIZETTONE
    // ================================================================

    /**
     * 🔘 BUZZ — Pressione del pulsante (modalità Quizzettone).
     */
    const buzz = () => {
        safeSend({ type: 'BUZZ' });
    };

    /**
     * 🔄 RESET — Reset del quiz (solo admin).
     */
    const reset = () => {
        safeSend({ type: 'RESET' });
    };

    /**
     * 🔓 ADMIN → Abilita/disabilita il buzzer di un player.
     */
    const setPlayerCanBuzz = (playerId, canBuzz) => {
        safeSend({ type: 'ADMIN_SET_CAN_BUZZ', playerId, canBuzz });
    };

    /**
     * 🧨 ADMIN → Forza reset identità di un player.
     */
    const forceResetPlayer = (playerId) => {
        safeSend({ type: 'ADMIN_FORCE_RESET_PLAYER', playerId });
    };

    /**
     * 🏆 ADMIN → Incrementa/decrementa punteggio classifica.
     */
    function adjustScore(playerId, delta) {
        safeSend({ type: 'ADMIN_ADJUST_SCORE', playerId, delta });
    }

    /**
     * 🏆 ADMIN → Rimuove un giocatore dalla classifica.
     */
    function removeScore(playerId) {
        safeSend({ type: 'ADMIN_REMOVE_SCORE', playerId });
    }

    /**
     * 🏆 ADMIN → Resetta tutti i punteggi.
     */
    function resetScores() {
        safeSend({ type: 'ADMIN_RESET_SCORES' });
    }

    // ================================================================
    //  ❓ FUNZIONI DOMANDE QUIZ (DATABASE)
    // ================================================================

    /**
     * 📋 ADMIN → Richiede la lista delle categorie disponibili.
     * Il server risponde con { type: 'CATEGORIES', categories: [{id, nome}] }
     */
    function getCategories() {
        safeSend({ type: 'ADMIN_GET_CATEGORIES' });
    }

    /**
     * ❓ ADMIN → Richiede una domanda casuale con i filtri specificati.
     * @param {number|null} categoria_id - ID categoria (null = tutte)
     * @param {string|null} difficolta - 'facile'|'medio'|'difficile' (null = tutte)
     * Il server risponde con { type: 'QUESTION', domanda: { id, categoria, difficolta, testo, risposte } }
     */
    function getQuestion(categoria_id = null, difficolta = null) {
        safeSend({ type: 'ADMIN_GET_QUESTION', categoria_id, difficolta });
    }

    // ================================================================
    //  🎮 FUNZIONI MODALITÀ ASTA FANTACALCIO
    // ================================================================

    /**
     * 🎮 ADMIN → Cambia la modalità di gioco.
     * @param {'quiz'|'auction'} mode
     */
    function setGameMode(mode) {
        safeSend({ type: 'ADMIN_SET_GAME_MODE', mode });
    }

    /**
     * 💰 ADMIN → Assegna budget iniziale a TUTTI i player.
     * @param {number} budget - Crediti da assegnare
     */
    function setBudget(budget) {
        safeSend({ type: 'ADMIN_SET_BUDGET', budget });
    }

    /**
     * 💰 ADMIN → Modifica budget di un singolo player.
     * @param {string} playerId - UUID del player
     * @param {number} budget - Nuovo budget
     */
    function adjustPlayerBudget(playerId, budget) {
        safeSend({ type: 'ADMIN_ADJUST_PLAYER_BUDGET', playerId, budget });
    }

    /**
     * ▶️ ADMIN → Avvia una nuova asta.
     * @param {'standard'|'base'} mode - Modalità asta
     * @param {number} timerDuration - Secondi del countdown
     * @param {number} minBid - Offerta base di partenza (solo standard)
     */
    function startAuction(mode, timerDuration = 10, minBid = 0) {
        safeSend({ type: 'ADMIN_START_AUCTION', mode, timerDuration, minBid });
    }

    /**
     * ✕ ADMIN → Annulla l'asta corrente.
     */
    function cancelAuction() {
        safeSend({ type: 'ADMIN_CANCEL_AUCTION' });
    }

    /**
     * 🔓 ADMIN → Riprende l'asta dopo la pausa (solo modalità Base).
     * Dopo che il vincitore del buzz ha parlato a voce, l'admin
     * clicca questo pulsante per sbloccare il timer.
     */
    function resumeAuction() {
        safeSend({ type: 'ADMIN_RESUME_AUCTION' });
    }

    /**
     * 🔘 PLAYER → Pressione del pulsante OFFRI (modalità Asta).
     * Diverso da buzz() (Quizzettone): qui il server valida
     * budget, auto-rilanci e concorrenza.
     */
    function auctionBuzz() {
        safeSend({ type: 'AUCTION_BUZZ' });
    }

    /**
     * 💰 PLAYER → Invia l'offerta (solo modalità Standard).
     * Dopo aver premuto auctionBuzz e ricevuto AUCTION_BID_REQUEST,
     * il player invia l'importo che vuole offrire.
     * @param {number} amount - Crediti offerti
     */
    function placeBid(amount) {
        safeSend({ type: 'AUCTION_BID', amount });
    }

    /**
     * ✅ PLAYER → Conferma di aver parlato (solo modalità Base).
     *
     * Dopo aver premuto OFFRI e parlato a voce, il giocatore clicca "Confermo"
     * per far ripartire il timer. Invia il proprio UUID così il server può
     * verificare che sia proprio il giocatore che ha buzzato.
     * L'admin ha comunque "Riprendi asta" come fallback.
     */
    function confirmSpeak() {
        const playerId = getOrCreatedPlayerId();
        safeSend({ type: 'AUCTION_CONFIRM_SPEAK', playerId });
    }

    // ================================================================
    //  EXPORT — tutte le funzioni pubbliche
    // ================================================================
    return {
        // Comuni
        sendWelcome,
        sendAdminLogin,
        selfUnregister,
        safeSend,

        // 🔄 Callback di re-autenticazione dopo riconnessione automatica
        onReconnect: (callback) => { onReconnectRef.current = callback; },

        // Quizzettone
        buzz,
        reset,
        setPlayerCanBuzz,
        forceResetPlayer,
        adjustScore,
        removeScore,
        resetScores,

        // Domande Quiz (Database)
        getCategories,
        getQuestion,

        // Asta Fantacalcio
        setGameMode,
        setBudget,
        adjustPlayerBudget,
        startAuction,
        cancelAuction,
        resumeAuction,
        auctionBuzz,
        placeBid,
        confirmSpeak,
    };
}
