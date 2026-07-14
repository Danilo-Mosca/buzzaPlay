import { useState, useEffect } from 'react';
import { useQuizSocket } from "../hooks/useQuizSocket";
import { useAdminAuth } from "../hooks/useAdminAuth";
import AdminLogin from "./AdminLogin";
import AuctionAdmin from "./AuctionAdmin";
import DomandeQuiz from "./DomandeQuiz";

function Admin() {

    const { isAdmin, loginError, login, logout, attachSendAdminLogin, handleAdminOk, handleAdminDenied } = useAdminAuth();

    const [players, setPlayers] = useState([]);
    const [winner, setWinner] = useState(null);
    const [scores, setScores] = useState([]);
    // Stato per la modalità di gioco, l'asta e la persistenza risultato
    const [gameMode, setGameMode] = useState('quiz');

    // === Stato per le domande Quiz (Database PostgreSQL) ===
    // Questi tre stati sono passati come props a <DomandeQuiz />.
    // Lo stato interno ai filtri (selectedCategoria, selectedDifficolta, revealed)
    // vive dentro DomandeQuiz.jsx per mantenere Admin.jsx più snello.
    //
    // categories:        lista {id, nome} ricevuta dal server via CATEGORIES
    // categoriesLoaded:  true dopo la prima risposta CATEGORIES (distingue "non ancora
    //                    caricato" da "caricato ma vuoto" = DB down)
    // currentQuestion:   oggetto domanda corrente o null se nessuna domanda visibile
    const [categories, setCategories] = useState([]);
    const [categoriesLoaded, setCategoriesLoaded] = useState(false);
    const [currentQuestion, setCurrentQuestion] = useState(null);
    /**
     * 🔁 Filtro domande esaurito — flag per notificare l'utente.
     * Quando il server risponde con exhausted: true, significa che
     * tutte le domande per la categoria/difficoltà selezionata sono
     * state già mostrate. Questo stato viene passato a DomandeQuiz
     * per mostrare il messaggio "Domande esaurite per la tipologia
     * selezionata" al posto dei normali filtri.
     * Si resetta quando l'admin cambia i dropdown o clicca
     * "Mostra Domanda" con un filtro diverso.
     */
    const [filterExhausted, setFilterExhausted] = useState(false);

    /**
     * 🔄 Contatore cicli di reset — trigger per la notifica toast.
     * Ogni volta che il server resetta il ciclo (tutte le domande
     * mostrate, si ricomincia), incrementa questo contatore.
     * DomandeQuiz lo usa come dipendenza in useEffect per mostrare
     * il toast "🔄 Tutte le domande sono state mostrate, si ricomincia!"
     * con auto-dismiss dopo 4 secondi. L'uso di un contatore invece
     * di un boolean garantisce che l'effect si attivi anche se il
     * reset avviene due volte di fila (il nuovo valore è sempre diverso).
     */
    const [cycleResetCounter, setCycleResetCounter] = useState(0);
    const [auctionEnded, setAuctionEnded] = useState(false);
    const [auctionState, setAuctionState] = useState({
        active: false,
        mode: 'standard',
        timerRemaining: 0,
        timerDuration: 10,
        currentBid: 0,
        minBid: 0,
        currentLeaderName: null,
        buzzLocked: false,
        bidRequestedTo: null,
        excludedIds: [],
    });

    const socket = useQuizSocket('admin', (msg) => {
        // === Messaggi autenticazione admin ===
        // ADMIN_OK: login admin riuscito → il socket ha ruolo 'admin'
        // Richiediamo subito la lista delle categorie per popolare
        // il dropdown "Categoria" nella sezione Domande Quiz.
        // Questo avviene sia al primo login che dopo riconnessione automatica
        // (grazie al re-invio di ADMIN_LOGIN via onReconnect).
        //
        // NOTA BENE: resettiamo filterExhausted e currentQuestion per
        // coprire il caso in cui l'admin avesse esaurito una categoria
        // nella sessione precedente. Anche se il server ha pulito
        // shownQuestionIds (sul nuovo ADMIN_LOGIN), senza questo reset
        // il frontend manterrebbe filterExhausted = true e il banner
        // "esaurite" resterebbe visibile, confondendo l'admin.
        // La chiamata a handleAdminOk() eventualmente setta isAdmin = true,
        // ma non tocca questi due stati specifici.
        if (msg.type === 'ADMIN_OK') {
            handleAdminOk();
            setFilterExhausted(false);
            setCurrentQuestion(null);
            socket.getCategories();
            return;
        }
        if (msg.type === 'ADMIN_DENIED') {
            handleAdminDenied();
            return;
        }

        // === Messaggi comuni ===
        if (msg.type === 'PLAYERS_UPDATE') {
            setPlayers(msg.players);
        }
        if (msg.type === 'WINNER') {
            setWinner(msg.player);
        }
        if (msg.type === 'RESET') {
            setWinner(null);
        }
        if (msg.type === 'SCORES_UPDATE') {
            setScores(msg.scores);
        }

        // === Messaggi cambio modalità ===
        if (msg.type === 'GAME_MODE_CHANGE') {
            setGameMode(msg.mode);
            // Se si passa a quiz, resettiamo lo stato dell'asta
            if (msg.mode === 'quiz') {
                setAuctionEnded(false);
                setAuctionState({
                    active: false,
                    mode: 'standard',
                    timerRemaining: 0,
                    timerDuration: 10,
                    currentBid: 0,
                    minBid: 0,
                    currentLeaderName: null,
                    buzzLocked: false,
                    bidRequestedTo: null,
                    excludedIds: [],
                });
            }
        }

        // === Messaggi Asta ===
        if (msg.type === 'AUCTION_STARTED') {
            setAuctionEnded(false);
            setAuctionState(prev => ({
                ...prev,
                active: true,
                mode: msg.mode,
                timerRemaining: msg.timerDuration,
                timerDuration: msg.timerDuration,
                currentBid: msg.minBid,
                minBid: msg.minBid,
                currentLeaderName: null,
                buzzLocked: false,
                bidRequestedTo: null,
            }));
        }

        if (msg.type === 'AUCTION_TIMER') {
            setAuctionState(prev => ({ ...prev, timerRemaining: msg.remaining }));
        }

        if (msg.type === 'AUCTION_BUZZ_WINNER') {
            setAuctionState(prev => ({
                ...prev,
                currentLeaderName: msg.playerName,
                buzzLocked: true,
            }));
        }

        if (msg.type === 'AUCTION_BID_UPDATE') {
            setAuctionState(prev => ({
                ...prev,
                currentBid: msg.amount,
                currentLeaderName: msg.playerName,
                buzzLocked: false,
                bidRequestedTo: null,
            }));
        }

        if (msg.type === 'AUCTION_TIMEOUT') {
            setAuctionEnded(true);
            setAuctionState(prev => ({
                ...prev,
                active: false,
                buzzLocked: false,
            }));
        }

        if (msg.type === 'AUCTION_CANCELLED') {
            setAuctionEnded(false);
            setAuctionState(prev => ({
                ...prev,
                active: false,
                buzzLocked: false,
                currentLeaderName: null,
                currentBid: prev.minBid,
            }));
        }

        if (msg.type === 'AUCTION_STATE') {
            setAuctionState({
                active: msg.active,
                mode: msg.mode,
                timerRemaining: msg.timerRemaining,
                timerDuration: msg.timerDuration,
                currentBid: msg.currentBid,
                minBid: msg.minBid,
                currentLeaderName: msg.currentLeaderName,
                buzzLocked: msg.buzzLocked,
                bidRequestedTo: msg.bidRequestedTo,
                excludedIds: msg.excludedIds || [],
            });
        }

        if (msg.type === 'AUCTION_PLAYER_EXCLUDED') {
            setAuctionState(prev => ({
                ...prev,
                excludedIds: [...prev.excludedIds, msg.playerId],
            }));
        }

        // Messaggi di budget — aggiorniamo i player con i nuovi budget
        if (msg.type === 'BUDGETS_UPDATE') {
            setPlayers(prev => prev.map(p => {
                const budgetEntry = msg.budgets.find(b => b.id === p.id);
                return budgetEntry ? { ...p, budget: budgetEntry.budget } : p;
            }));
        }

        // === Messaggi Domande Quiz (Database) ===
        // CATEGORIES: arriva dal server dopo ADMIN_GET_CATEGORIES
        // Contiene la lista di {id, nome} per popolare il dropdown in DomandeQuiz
        // categoriesLoaded = true segnala a DomandeQuiz che il caricamento è avvenuto
        // (anche se categories è vuoto = DB non raggiungibile)
        if (msg.type === 'CATEGORIES') {
            setCategories(msg.categories || []);
            setCategoriesLoaded(true);
        }

        // QUESTION: arriva dal server dopo ADMIN_GET_QUESTION
        // Contiene { id, categoria, difficolta, testo, risposte[{testo, corretta}] }
        // Se msg.domanda è null → nessuna domanda corrisponde ai filtri
        // Se msg.exhausted è true → tutte le domande per questo filtro sono state mostrate
        // Nota: il reset di revealed non serve più qui perché gestito internamente
        // da DomandeQuiz.jsx tramite key={currentQuestion.id} su QuestionDisplay.
        if (msg.type === 'QUESTION') {
            setCurrentQuestion(msg.domanda);
            if (msg.domanda === null) {
                // exhausted: true = filtro esaurito (tutte le domande per
                // questa categoria/difficoltà sono state mostrate)
                setFilterExhausted(msg.exhausted || false);
            }
        }

        // QUESTION_CYCLE_RESET: il server ha resettato il ciclo di
        // non-ripetizione (tutte le domande sono state mostrate, si
        // ricomincia da capo). Incrementa il contatore per triggerare
        // la notifica toast in DomandeQuiz.
        if (msg.type === 'QUESTION_CYCLE_RESET') {
            setCycleResetCounter(prev => prev + 1);
        }
    });

    // Collega la funzione sendAdminLogin del socket a useAdminAuth (solo al mount)
    useEffect(() => {
        attachSendAdminLogin(socket.sendAdminLogin);
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    // All'avvio, se esiste una password salvata, tenta il re-login automatico (solo al mount)
    useEffect(() => {
        const savedPassword = localStorage.getItem('quiz_admin_password');
        if (savedPassword) {
            socket.sendAdminLogin(savedPassword);
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    // 🔄 Re-autenticazione dopo riconnessione automatica della WebSocket.
    // Senza questo, dopo un reconnect il socket non sarebbe più admin
    // e i pulsanti RESET QUIZ / AVVIA ASTA smetterebbero di funzionare.
    useEffect(() => {
        socket.onReconnect(() => {
            const savedPassword = localStorage.getItem('quiz_admin_password');
            if (savedPassword) {
                console.log('🔄 WebSocket riconnessa — re-invio login admin');
                socket.sendAdminLogin(savedPassword);
            }
        });
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    if (!isAdmin) {
        return <AdminLogin onLogin={login} error={loginError} />;
    }

    /**
     * 🎮 Cambia la modalità di gioco
     */
    function handleSetGameMode(mode) {
        socket.setGameMode(mode);
    }

    return (
        <div className="page page--admin">
            <div className="admin-header">
                <div className="game-logo" style={{ marginBottom: 0 }}>
                    {gameMode === 'auction' ? 'Asta Fantacalcio' : 'Quizzettone'}
                </div>
                <div className="admin-header__actions">
                    <button
                        className="btn btn--ghost btn--sm"
                        onClick={logout}
                    >
                        Logout
                    </button>
                </div>
            </div>

            {/* 🎮 Game Mode Toggle */}
            <div className="mode-toggle">
                <button
                    className={`mode-toggle__btn ${gameMode === 'quiz' ? 'mode-toggle__btn--active' : ''}`}
                    onClick={() => handleSetGameMode('quiz')}
                    disabled={gameMode === 'quiz'}
                >
                    🎯 Quizzettone
                </button>
                <button
                    className={`mode-toggle__btn ${gameMode === 'auction' ? 'mode-toggle__btn--active' : ''}`}
                    onClick={() => handleSetGameMode('auction')}
                    disabled={gameMode === 'auction'}
                >
                    💰 Asta Fantacalcio
                </button>
            </div>

            {/* Rendering condizionale in base alla modalità */}
            {gameMode === 'auction' ? (
                <AuctionAdmin
                    socket={socket}
                    players={players}
                    auctionState={auctionState}
                    auctionEnded={auctionEnded}
                    setAuctionState={setAuctionState}
                />
            ) : (
                /* --- MODALITÀ QUIZETTONE (invariata) --- */
                <div className="admin-content">
                    {/* Winner banner */}
                    {winner && (
                        <div className="admin-section" style={{ padding: '1rem 1.5rem' }}>
                            <div className="winner-banner" style={{ margin: 0 }}>
                                <div className="winner-banner__label">Primo a premere</div>
                                <div className="winner-banner__name">{winner}</div>
                            </div>
                        </div>
                    )}

                    {/* ===== INIZIO SEZIONE DOMANDE QUIZ (Database PostgreSQL) ===== */}
                    {/*
                     * DomandeQuiz — componente estratto per mantenere Admin.jsx più snello.
                     * Gestisce internamente:
                     *   - Filtri (categoria/difficoltà) e avviso DB down
                     *   - Visualizzazione domanda + risposte + rivela risposta corretta
                     * Riceve da Admin.jsx: socket, categories, categoriesLoaded, currentQuestion
                     * Comunica verso Admin.jsx: onCloseQuestion fa setCurrentQuestion(null)
                     */}
                    <DomandeQuiz
                        socket={socket}
                        categories={categories}
                        categoriesLoaded={categoriesLoaded}
                        currentQuestion={currentQuestion}
                        onCloseQuestion={() => setCurrentQuestion(null)}
                        filterExhausted={filterExhausted}
                        onDismissExhausted={() => setFilterExhausted(false)}
                        cycleResetCounter={cycleResetCounter}
                    />
                    {/* ===== FINE SEZIONE DOMANDE QUIZ ===== */}

                    {/* Quiz controls */}
                    <div className="admin-section">
                        <div className="admin-section__header">
                            <div className="admin-section__title">🎮 Controlli Quiz</div>
                        </div>
                        <button
                            className="btn btn--primary"
                            onClick={socket.reset}
                            style={{ fontSize: '1.1rem', padding: '0.75rem 2rem' }}
                        >
                            🔄 RESET QUIZ
                        </button>
                    </div>

                    {/* Players table */}
                    <div className="admin-section">
                        <div className="admin-section__header">
                            <div className="admin-section__title">👥 Giocatori ({players.length})</div>
                        </div>

                        {players.length === 0 ? (
                            <div className="empty-state">
                                <div className="empty-state__icon">👤</div>
                                <div className="empty-state__text">Nessun giocatore connesso</div>
                            </div>
                        ) : (
                            <div className="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Nome</th>
                                            <th>Buzz</th>
                                            <th>Azioni</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {players.map(player => (
                                            <tr key={player.id}>
                                                <td style={{ fontWeight: 600 }}>{player.name}</td>
                                                <td>
                                                    <span className={`badge ${player.canBuzz ? 'badge--success' : 'badge--error'}`}>
                                                        {player.canBuzz ? '🟢 Abilitato' : '🔴 Bloccato'}
                                                    </span>
                                                </td>
                                                <td>
                                                    <div style={{ display: 'flex', gap: '0.35rem', alignItems: 'center' }}>
                                                        <button
                                                            className={`btn btn--icon ${player.canBuzz ? 'btn--danger' : 'btn--success'}`}
                                                            onClick={() =>
                                                                socket.setPlayerCanBuzz(
                                                                    player.id,
                                                                    !player.canBuzz
                                                                )
                                                            }
                                                            title={player.canBuzz ? 'Blocca' : 'Sblocca'}
                                                        >
                                                            {player.canBuzz ? '🔒' : '🔓'}
                                                        </button>
                                                        <button
                                                            className="btn btn--icon btn--danger"
                                                            onClick={() => {
                                                                const confirmed =
                                                                    confirm(
                                                                        `Resettare il player "${player.name}" ?`
                                                                    );
                                                                if (!confirmed) return;
                                                                socket.forceResetPlayer(player.id);
                                                            }}
                                                            title="Reset Player"
                                                        >
                                                            🧨
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                            </div>
                        )}
                    </div>

                    {/* Scoreboard */}
                    <div className="admin-section">
                        <div className="admin-section__header">
                            <div className="admin-section__title">🏆 Classifica</div>
                            {scores.length > 0 && (
                                <button
                                    className="btn btn--ghost btn--sm"
                                    onClick={socket.resetScores}
                                >
                                    Resetta tutto
                                </button>
                            )}
                        </div>

                        {scores.length === 0 ? (
                            <div className="empty-state">
                                <div className="empty-state__icon">🏆</div>
                                <div className="empty-state__text">Nessun punteggio</div>
                            </div>
                        ) : (
                            <div className="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nome</th>
                                            <th>Punteggio</th>
                                            <th>Azioni</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {[...scores]
                                            .sort((a, b) => b.score - a.score)
                                            .map((entry, i) => (
                                                <tr key={entry.id}>
                                                    <td>
                                                        <span className={`rank-number ${i < 3 ? 'rank-number--top' : ''}`}>
                                                            {i + 1}
                                                        </span>
                                                    </td>
                                                    <td style={{ fontWeight: 600 }}>{entry.name}</td>
                                                    <td className="score-display">{entry.score}</td>
                                                    <td>
                                                        <div className="score-actions">
                                                            <button
                                                                className="btn btn--icon btn--danger"
                                                                onClick={() => socket.adjustScore(entry.id, -1)}
                                                                title="−1"
                                                            >
                                                                −
                                                            </button>
                                                            <button
                                                                className="btn btn--icon btn--success"
                                                                onClick={() => socket.adjustScore(entry.id, 1)}
                                                                title="+1"
                                                            >
                                                                +
                                                            </button>
                                                            <button
                                                                className="btn btn--icon btn--ghost"
                                                                onClick={() => socket.removeScore(entry.id)}
                                                                title="Rimuovi dalla classifica"
                                                            >
                                                                🗑️
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            ))
                                        }
                                    </tbody>
                                </table>
                            </div>
                        )}
                    </div>

                </div>
            )}
        </div>
    );
}

export default Admin;
