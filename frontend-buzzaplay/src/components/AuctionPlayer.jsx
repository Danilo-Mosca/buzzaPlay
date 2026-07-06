import { useState, useEffect } from 'react';
import { useQuizSocket } from '../hooks/useQuizSocket.jsx';
import { getOrCreatedPlayerId, getPlayerName, setPlayerName, resetPlayerId } from '../utils/playerIdentity.js';
import CountdownTimer from './CountdownTimer.jsx';

/**
 * 🎮 AuctionPlayer — Schermata del giocatore in modalità Asta Fantacalcio
 * 
 * Questa pagina viene mostrata al posto di QuizButton quando l'admin
 * attiva la modalità 'auction'. Gestisce:
 * - Timer countdown visivo
 * - Pulsante OFFRI (con validazioni: budget, esclusioni, auto-rilancio)
 * - Input per offerta in modalità Standard
 * - Visualizzazione budget, leader corrente, esclusioni
 * - Annuncio vincitore a fine asta
 */
export default function AuctionPlayer() {
    const playerId = getOrCreatedPlayerId();
    const savedName = getPlayerName();

    const [playerName, setPlayerNameState] = useState(savedName || '');
    const [joined, setJoined] = useState(!!savedName);
    const [connecting, setConnecting] = useState(false);
    const [error, setError] = useState(null);

    // Stato dell'asta
    const [auctionActive, setAuctionActive] = useState(false);
    const [auctionMode, setAuctionMode] = useState('standard');
    const [timerRemaining, setTimerRemaining] = useState(0);
    const [timerDuration, setTimerDuration] = useState(10);
    const [currentBid, setCurrentBid] = useState(0);
    const [currentLeaderName, setCurrentLeaderName] = useState(null);
    const [buzzLocked, setBuzzLocked] = useState(false);
    const [bidRequested, setBidRequested] = useState(false);
    const [excluded, setExcluded] = useState(false);
    const [myBudget, setMyBudget] = useState(0);
    const [players, setPlayers] = useState([]);
    const [canBuzz, setCanBuzz] = useState(false);
    const [winnerAnnouncement, setWinnerAnnouncement] = useState(null);
    const [auctionError, setAuctionError] = useState(null);
    const [baseExcluded, setBaseExcluded] = useState(false);
    const [isCurrentSpeaker, setIsCurrentSpeaker] = useState(false);
    const [bidInput, setBidInput] = useState('');
    const [bidError, setBidError] = useState(null);
    const [isBidding, setIsBidding] = useState(false);

    // === Funzione per applicare stato asta ===
    // Definità prima di useQuizSocket così è accessibile nella callback
    function applyAuctionState(state) {
        setAuctionActive(state.auctionActive !== undefined ? state.auctionActive : state.active);
        setAuctionMode(state.auctionMode || state.mode || 'standard');
        if (state.timerRemaining !== undefined) setTimerRemaining(state.timerRemaining);
        if (state.timerDuration !== undefined) setTimerDuration(state.timerDuration);
        if (state.currentBid !== undefined) setCurrentBid(state.currentBid);
        if (state.currentLeaderName !== undefined) setCurrentLeaderName(state.currentLeaderName);
        if (state.buzzLocked !== undefined) setBuzzLocked(state.buzzLocked);
        setBidRequested(state.bidRequestedTo === playerId);
        setExcluded(state.excluded || (state.excludedIds && state.excludedIds.includes(playerId)));
        if (state.budget !== undefined) setMyBudget(state.budget);
        // Modalità base: esclusione ultimo offerente
        if (state.mode === 'base' || state.auctionMode === 'base') {
            setBaseExcluded(state.lastBuzzerId === playerId);
            // Determina se QUESTO giocatore è l'attuale speaker (ha buzzato e
            // l'asta è in pausa in attesa della sua conferma). Usato per mostrare
            // il pulsante "Confermo" solo al giocatore che ha la parola.
            setIsCurrentSpeaker(
                state.lastBuzzerId === playerId &&
                state.buzzLocked === true
            );
        } else {
            setBaseExcluded(false);
            setIsCurrentSpeaker(false);
        }
    }

    const socket = useQuizSocket('player', (msg) => {
        // === Messaggi di connessione ===
        if (msg.type === 'NAME_OK') {
            setJoined(true);
            setError(null);
            setConnecting(false);
            if (msg.gameMode === 'auction') {
                applyAuctionState(msg);
            }
        }

        if (msg.type === 'NAME_TAKEN') {
            setError(msg.message);
            setJoined(false);
            setConnecting(false);
        }

        if (msg.type === 'FORCE_RESET') {
            resetPlayerId();
            window.location.reload();
        }

        // === Messaggi cambio modalità ===
        if (msg.type === 'FORCE_RESET') {
            resetPlayerId();
            window.location.reload();
        }

        if (msg.type === 'GAME_MODE_CHANGE') {
            // Se l'admin passa a 'quiz', ricarichiamo la pagina
            // così il routing farà visualizzare QuizButton
            if (msg.mode === 'quiz') {
                window.location.reload();
            }
        }

        // === Messaggi stato giocatori ===
        if (msg.type === 'PLAYERS_UPDATE') {
            const me = msg.players.find(p => p.id === playerId);
            if (me) {
                setCanBuzz(me.canBuzz);
                if (me.budget !== undefined) {
                    setMyBudget(me.budget);
                }
            }
            setPlayers(msg.players.map(p => ({
                name: p.name,
                budget: p.budget,
                canBuzz: p.canBuzz,
                id: p.id
            })));
        }

        // === Messaggi BUDGET ===
        if (msg.type === 'BUDGETS_UPDATE') {
            // Aggiorna il budget del giocatore corrente con il valore
            // già scalato dal server (nessuna doppia deduzione lato client)
            const me = msg.budgets.find(b => b.id === playerId);
            if (me) {
                setMyBudget(me.budget);
            }
            // Sincronizza anche la lista giocatori ("Lista giocatori con budget")
            // con i budget aggiornati, così da evitare dati obsoleti dopo
            // un'aggiudicazione. Stesso pattern usato in Admin.jsx.
            setPlayers(prev => prev.map(p => {
                const budgetEntry = msg.budgets.find(b => b.id === p.id);
                return budgetEntry ? { ...p, budget: budgetEntry.budget } : p;
            }));
        }

        // === Messaggi ASTA ===
        if (msg.type === 'AUCTION_STARTED') {
            setWinnerAnnouncement(null);
            setAuctionActive(true);
            setAuctionMode(msg.mode);
            setTimerRemaining(msg.timerDuration);
            setTimerDuration(msg.timerDuration);
            setCurrentBid(msg.minBid);
            setCurrentLeaderName(null);
            setBuzzLocked(false);
            setExcluded(false);
            setBidRequested(false);
            setBaseExcluded(false);
            setIsCurrentSpeaker(false);
            setAuctionError(null);
            setBidInput('');
            setBidError(null);
        }

        if (msg.type === 'AUCTION_TIMER') {
            setTimerRemaining(msg.remaining);
        }

        if (msg.type === 'AUCTION_BUZZ_WINNER') {
            setCurrentLeaderName(msg.playerName);
            setBuzzLocked(true);
            // Segna se QUESTO giocatore è quello che ha buzzato (utile in
            // modalità base per mostrare "Confermo" solo al diretto interessato)
            setIsCurrentSpeaker(msg.playerId === playerId);
        }

        if (msg.type === 'AUCTION_BID_REQUEST') {
            // Questo messaggio arriva SOLO al player che ha vinto il buzz
            if (msg.playerId === playerId) {
                setBidRequested(true);
                setBidInput('');
                setBidError(null);
            }
        }

        if (msg.type === 'AUCTION_BID_UPDATE') {
            setCurrentBid(msg.amount);
            setCurrentLeaderName(msg.playerName);
            setBuzzLocked(false);
            setBidRequested(false);
            setIsBidding(false);
            setBidInput('');
        }

        if (msg.type === 'AUCTION_TIMEOUT') {
            setAuctionActive(false);
            setBuzzLocked(false);
            setBidRequested(false);
            setBaseExcluded(false);
            setIsCurrentSpeaker(false);
            setIsBidding(false);
            setWinnerAnnouncement({
                winnerName: msg.winnerName,
                amount: msg.amount
            });
            // NOTA: il budget NON va scalato manualmente qui perché il server
            // ha già dedotto l'importo vincente (closeAuction in server.js)
            // e ha già inviato BUDGETS_UPDATE con il valore corretto PRIMA
            // di questo messaggio. Una seconda deduzione causerebbe un
            // doppio scalto (es. 500 - 100 = 400, poi 400 - 100 = 300 ❌).
            // Il budget corretto arriva già via BUDGETS_UPDATE → setMyBudget.
        }

        if (msg.type === 'AUCTION_CANCELLED') {
            setAuctionActive(false);
            setBuzzLocked(false);
            setBidRequested(false);
            setExcluded(false);
            setBaseExcluded(false);
            setIsCurrentSpeaker(false);
            setWinnerAnnouncement(null);
            setAuctionError(null);
            setBidInput('');
            setIsBidding(false);
        }

        if (msg.type === 'AUCTION_STATE') {
            applyAuctionState(msg);
        }

        // === Messaggi di errore (solo per questo player) ===
        if (msg.type === 'AUCTION_ERROR') {
            setAuctionError(msg.message);
            if (msg.code === 'BUDGET_EXCEEDED') {
                setExcluded(true);
            }
            if (msg.code === 'BUZZ_AGAIN') {
                setBaseExcluded(true);
            }
            // Se l'errore è sull'offerta, resetta lo stato di bidding
            if (msg.code === 'BID_TOO_LOW' || msg.code === 'BUDGET_EXCEEDED') {
                setIsBidding(false);
                setBidError(msg.message);
            }
        }

        // === Messaggi di esclusione (broadcast) ===
        if (msg.type === 'AUCTION_PLAYER_EXCLUDED') {
            if (msg.playerId === playerId) {
                setExcluded(true);
                setAuctionError('Asta superiore ai tuoi crediti!');
            }
        }
    });

    // Al mount, se abbiamo un nome salvato, ci connettiamo
    useEffect(() => {
        if (savedName) {
            socket.sendWelcome(savedName);
        }
    }, []);

    // 🔄 Re-invio HELLO dopo riconnessione automatica della WebSocket.
    // Il server riconosce l'UUID e ripristina lo stato del player (budget, esclusioni, ecc.).
    useEffect(() => {
        const currentName = getPlayerName();
        if (currentName) {
            socket.onReconnect(() => {
                console.log('🔄 WebSocket riconnessa — re-invio HELLO player (asta)');
                socket.sendWelcome(currentName);
            });
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    /**
     * 🖱️ Handler per la pressione del pulsante OFFRI.
     * Usa onMouseDown (come il BUZZ classico) per minore latenza.
     */
    function handleAuctionBuzz(e) {
        e.preventDefault();
        setAuctionError(null);
        socket.auctionBuzz();
    }

    /**
     * ✅ Handler per il pulsante "Confermo" (solo modalità Base).
     * Il giocatore che ha appena parlato clicca questo pulsante
     * per far ripartire il timer e permettere ad altri di offrire.
     * Invia AUCTION_CONFIRM_SPEAK al server che sblocca buzzLocked.
     */
    function handleConfirmSpeak(e) {
        e.preventDefault();
        setAuctionError(null);
        socket.confirmSpeak();
    }

    /**
     * 💰 Handler per l'invio dell'offerta (modalità Standard).
     * Valida lato cliente prima di inviare al server.
     */
    function handlePlaceBid() {
        const amount = parseInt(bidInput, 10);
        const minValid = currentBid + 1;

        if (isNaN(amount)) {
            setBidError('Inserisci un numero valido.');
            return;
        }
        if (amount < minValid) {
            setBidError(`Offerta minima: ${minValid} crediti.`);
            return;
        }
        if (amount > myBudget) {
            setBidError(`Non hai abbastanza crediti! Budget: ${myBudget}.`);
            return;
        }

        setIsBidding(true);
        setBidError(null);
        socket.placeBid(amount);
    }

    /**
     * 🖱️ Handler per "Entra come nuovo giocatore"
     */
    function handleResetIdentity() {
        const confirmReset = confirm('Sei sicuro di voler entrare come nuovo player?');
        if (confirmReset) {
            socket.selfUnregister();
            resetPlayerId();
            window.location.reload();
        }
    }

    /**
     * Calcola l'offerta minima valida per suggerirla nel placeholder
     */
    const minValidBid = currentBid + 1;

    // ================================================================
    //  RENDERING — SCHERMATA DI LOGIN (se non ancora entrato)
    // ================================================================
    if (!joined) {
        if (connecting) {
            return (
                <div className="page">
                    <p style={{ color: 'var(--color-text-secondary)' }}>⏳ Connessione in corso...</p>
                </div>
            );
        }
        return (
            <div className="page">
                <div className="card">
                    <div className="game-logo">Asta Fantacalcio</div>
                    <p className="card__subtitle">Inserisci il tuo nome per partecipare all'asta</p>

                    <input
                        className="input"
                        value={playerName}
                        onChange={(e) => setPlayerNameState(e.target.value)}
                        placeholder="Il tuo nome"
                    />

                    <div style={{ marginTop: '0.75rem' }}>
                        <button
                            className="btn btn--primary btn--full"
                            disabled={!playerName}
                            onClick={() => {
                                setConnecting(true);
                                setPlayerName(playerName);
                                socket.sendWelcome(playerName);
                            }}
                        >
                            Entra nell'asta
                        </button>
                    </div>

                    {error && <div className="admin-login__error">{error}</div>}
                </div>
            </div>
        );
    }

    // ================================================================
    //  RENDERING — SCHERMATA DI GIOCO (asta)
    // ================================================================
    return (
        <div className="page">
            <div className="card card--auction">
                <div className="game-logo">Asta Fantacalcio</div>

                {/* Timer countdown — visibile solo durante asta attiva */}
                {auctionActive && (
                    <div className="auction-timer-container">
                        <CountdownTimer
                            remaining={timerRemaining}
                            max={timerDuration}
                            size="large"
                        />
                    </div>
                )}

                {/* Stato dell'offerta corrente */}
                {auctionActive && (
                    <div className="auction-bid-info">
                        <div className="auction-bid-info__label">
                            {auctionMode === 'standard' ? 'Offerta attuale' : 'Asta in corso'}
                        </div>
                        {auctionMode === 'standard' && (
                            <div className="auction-bid-info__amount">
                                <span className="auction-bid-info__credits">{currentBid} crediti</span>
                                {currentLeaderName && (
                                    <span className="auction-bid-info__leader"> — {currentLeaderName}</span>
                                )}
                            </div>
                        )}
                        {buzzLocked && !bidRequested && auctionMode === 'base' && (
                            <div className="auction-bid-info__message">
                                🎤 {currentLeaderName} ha la parola...
                            </div>
                        )}
                    </div>
                )}

                {/* Messaggio di attesa se nessuna asta attiva */}
                {!auctionActive && !winnerAnnouncement && (
                    <div className="auction-waiting">
                        <div className="auction-waiting__icon">⏳</div>
                        <div className="auction-waiting__text">In attesa dell'inizio dell'asta...</div>
                    </div>
                )}

                {/* Budget del giocatore (solo modalità standard) */}
                {auctionMode === 'standard' && (
                    <div className="auction-budget">
                        <div className="auction-budget__label">Il tuo budget</div>
                        <div className="auction-budget__amount">
                            <span className={myBudget <= 0 ? 'auction-budget__amount--empty' : ''}>
                                {myBudget}
                            </span> crediti
                        </div>
                    </div>
                )}

                {/* Pulsante OFFRI — da solo, senza Confermo affiancato */}
                {auctionActive && !excluded && (
                    <div style={{ display: 'flex', justifyContent: 'center' }}>
                        <button
                            className={`auction-btn ${canBuzz && !buzzLocked && !bidRequested ? 'auction-btn--pulse' : ''}`}
                            onMouseDown={handleAuctionBuzz}
                            onTouchStart={handleAuctionBuzz}
                            disabled={!canBuzz || buzzLocked || bidRequested || isBidding || baseExcluded}
                        >
                            OFFRI!
                        </button>
                    </div>
                )}

                {/* Confermo — posizionato qui, lontano da OFFRI, per evitare click accidentali */}
                {buzzLocked && !bidRequested && auctionMode === 'base' && isCurrentSpeaker && (
                    <div style={{ margin: '1.5rem 0', textAlign: 'center' }}>
                        <button
                            className="btn btn--success"
                            onClick={handleConfirmSpeak}
                            style={{ fontSize: '1.1rem', padding: '0.75rem 2rem' }}
                        >
                            ✅ Confermo
                        </button>
                    </div>
                )}

                {/* Banner esclusione (solo modalità standard) */}
                {auctionActive && excluded && auctionMode === 'standard' && (
                    <div className="excluded-banner">
                        <div className="excluded-banner__icon">🚫</div>
                        <div className="excluded-banner__text">
                            Asta superiore ai tuoi crediti!<br />
                            <span>Non puoi più partecipare a quest'asta.</span>
                        </div>
                    </div>
                )}

                {/* Messaggio: hai appena parlato (solo modalità base) */}
                {auctionActive && baseExcluded && !buzzLocked && (
                    <div className="base-excluded-message">
                        <div className="base-excluded-message__icon">⏳</div>
                        <div className="base-excluded-message__text">
                            Hai appena parlato!<br />
                            <span>Aspetta il prossimo giro.</span>
                        </div>
                    </div>
                )}

                {/* Input per offerta (solo modalità Standard, quando richiesto) */}
                {bidRequested && (
                    <div className="bid-input-container">
                        <div className="bid-input-container__label">
                            Inserisci la tua offerta
                        </div>
                        <div className="bid-input-container__min">
                            Offerta minima: <strong>{minValidBid}</strong> crediti
                        </div>
                        <div className="bid-input-row">
                            <input
                                className="input bid-input"
                                type="number"
                                min={minValidBid}
                                max={myBudget}
                                value={bidInput}
                                onChange={(e) => {
                                    setBidInput(e.target.value);
                                    setBidError(null);
                                }}
                                onKeyDown={(e) => {
                                    if (e.key === 'Enter') handlePlaceBid();
                                }}
                                placeholder={`Offerta minima: ${minValidBid}`}
                                autoFocus
                                disabled={isBidding}
                            />
                            <button
                                className="btn btn--primary bid-confirm-btn"
                                onClick={handlePlaceBid}
                                disabled={!bidInput || isBidding}
                            >
                                {isBidding ? '⏳' : 'CONFERMA'}
                            </button>
                        </div>
                        {bidError && <div className="bid-input-container__error">{bidError}</div>}
                    </div>
                )}

                {/* Errore generico dell'asta */}
                {auctionError && !excluded && !bidError && (
                    <div className="admin-login__error">{auctionError}</div>
                )}

                {/* Annuncio vincitore */}
                {winnerAnnouncement && (
                    <div className={`winner-auction ${winnerAnnouncement.winnerName ? 'winner-auction--success' : 'winner-auction--empty'}`}>
                        {winnerAnnouncement.winnerName ? (
                            <>
                                <div className="winner-auction__trophy">🏆</div>
                                <div className="winner-auction__label">Aggiudicato a</div>
                                <div className="winner-auction__name">{winnerAnnouncement.winnerName}</div>
                                <div className="winner-auction__amount">
                                    per {winnerAnnouncement.amount} crediti
                                </div>
                            </>
                        ) : (
                            <>
                                <div className="winner-auction__label">⏰ Tempo scaduto</div>
                                <div className="winner-auction__empty-text">Nessuna offerta valida</div>
                            </>
                        )}
                    </div>
                )}
            </div>

            {/* Lista giocatori con budget */}
            <div className="player-list">
                <div className="player-list__header">
                    👥 Giocatori ({players.length})
                </div>
                {players.length === 0 ? (
                    <div className="player-list__item" style={{ border: 'none', color: 'var(--color-text-muted)' }}>
                        Nessun giocatore connesso
                    </div>
                ) : (
                    players.map((p, i) => (
                        <div key={i} className="player-list__item player-list__item--auction">
                            <span className="player-list__dot" />
                            <span className="player-list__name">{p.name}</span>
                            {auctionMode === 'standard' && (
                                <span className={`player-list__budget ${p.budget <= 0 ? 'player-list__budget--empty' : ''}`}>
                                    {p.budget} crediti
                                </span>
                            )}
                        </div>
                    ))
                )}
            </div>

            <button
                className="btn btn--ghost"
                style={{ marginTop: '1rem' }}
                onClick={handleResetIdentity}
            >
                🔄 Entra come nuovo giocatore
            </button>
        </div>
    );
}
