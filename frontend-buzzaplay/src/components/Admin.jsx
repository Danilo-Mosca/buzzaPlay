import { useState, useEffect } from 'react';
import { useQuizSocket } from "../hooks/useQuizSocket";
import { useAdminAuth } from "../hooks/useAdminAuth";
import AdminLogin from "./AdminLogin";
import AuctionAdmin from "./AuctionAdmin";

function Admin() {

    const { isAdmin, loginError, login, logout, attachSendAdminLogin, handleAdminOk, handleAdminDenied } = useAdminAuth();

    const [players, setPlayers] = useState([]);
    const [winner, setWinner] = useState(null);
    const [scores, setScores] = useState([]);
    // Stato per la modalità di gioco, l'asta e la persistenza risultato
    const [gameMode, setGameMode] = useState('quiz');

    // === Stato per le domande Quiz (Database PostgreSQL) ===
    // categories: lista delle categorie ricevuta dal server ({id, nome})
    // categoriesLoaded: flag per distinguere "non ancora caricato" da "caricato ma vuoto"
    const [categories, setCategories] = useState([]);
    const [categoriesLoaded, setCategoriesLoaded] = useState(false);
    // selectedCategoria: ID della categoria selezionata nel dropdown (null = "Casuale")
    const [selectedCategoria, setSelectedCategoria] = useState(null);
    // selectedDifficolta: difficoltà selezionata nel dropdown (null = "Casuale")
    const [selectedDifficolta, setSelectedDifficolta] = useState(null);
    // currentQuestion: oggetto domanda corrente ricevuto dal server (null = nessuna domanda visibile)
    const [currentQuestion, setCurrentQuestion] = useState(null);
    // revealed: flag per l'UI locale — true = "Rivela Risposta Corretta" premuto
    const [revealed, setRevealed] = useState(false);
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
        if (msg.type === 'ADMIN_OK') {
            handleAdminOk();
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
        // Contiene la lista di {id, nome} per popolare il dropdown
        if (msg.type === 'CATEGORIES') {
            setCategories(msg.categories || []);
            setCategoriesLoaded(true);
        }

        // QUESTION: arriva dal server dopo ADMIN_GET_QUESTION
        // Contiene { id, categoria, difficolta, testo, risposte[{testo, corretta}] }
        // Se msg.domanda è null, significa che nessuna domanda corrisponde ai filtri
        // Al ricevimento di una nuova domanda, resettiamo il flag revealed
        if (msg.type === 'QUESTION') {
            setCurrentQuestion(msg.domanda);
            setRevealed(false);  // Resetta la rivelazione per la nuova domanda
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
                    {/* ❓ Domande Quiz (Database PostgreSQL)
                       
                        Questa sezione è visibile SOLO nella dashboard admin
                        (mai sui player). Permette all'admin di:
                        
                        1. Selezionare una categoria dal dropdown (popolato via CATEGORIES)
                        2. Selezionare una difficoltà (Casuale/Facile/Medio/Difficile)
                        3. Cliccare "Mostra Domanda" per ricevere una domanda casuale
                        4. Visualizzare la domanda con 4 risposte in ordine mescolato
                        5. Cliccare "Rivela Risposta Corretta" (UI locale, nessun messaggio WS)
                        6. Chiudere la domanda per tornare ai filtri
                        
                        La rivelazione della risposta corretta è puramente UI locale:
                        cambia solo lo stile della risposta con corretta: true.
                        Non viene inviato nessun messaggio WebSocket.
                    */}
                    <div className="admin-section">
                        <div className="admin-section__header">
                            <div className="admin-section__title">❓ Domande Quiz</div>
                        </div>

                        {/* 
                            FASE 1: SELEZIONE FILTRI — visibile solo quando non c'è una domanda attiva
                            Mostra i dropdown per categoria e difficoltà e il pulsante "Mostra Domanda".
                        */}
                        {!currentQuestion && (
                            <>
                                {/* ⚠️ Database domande non disponibile: mostra avviso invece dei filtri */}
                                {categoriesLoaded && categories.length === 0 ? (
                                    <div className="empty-state" style={{ marginTop: '0.5rem' }}>
                                        <div className="empty-state__icon">⚠️</div>
                                        <div className="empty-state__text">
                                            Database domande non raggiungibile.
                                        </div>
                                        <div style={{ fontSize: '0.85rem', color: '#aaa', marginTop: '0.3rem' }}>
                                            Le domande Quiz non sono disponibili.
                                            Verifica che PostgreSQL sia in esecuzione e che DATABASE_URL sia corretta.
                                        </div>
                                    </div>
                                ) : (
                                    <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '0.75rem', flexWrap: 'wrap', alignItems: 'flex-end' }}>
                                        {/* Dropdown Categoria — popolato dinamicamente dal server */}
                                        <div>
                                            <label style={{ display: 'block', fontSize: '0.8rem', marginBottom: '0.2rem', color: '#aaa' }}>
                                                Categoria
                                            </label>
                                            <select
                                                className="input"
                                                value={selectedCategoria ?? ''}
                                                onChange={e => setSelectedCategoria(e.target.value ? Number(e.target.value) : null)}
                                                style={{ padding: '0.4rem 0.6rem' }}
                                            >
                                                <option value="">Casuale</option>
                                                {categories.map(cat => (
                                                    <option key={cat.id} value={cat.id}>{cat.nome}</option>
                                                ))}
                                            </select>
                                        </div>

                                        <div>
                                            <label style={{ display: 'block', fontSize: '0.8rem', marginBottom: '0.2rem', color: '#aaa' }}>
                                                Difficoltà
                                            </label>
                                            <select
                                                className="input"
                                                value={selectedDifficolta ?? ''}
                                                onChange={e => setSelectedDifficolta(e.target.value || null)}
                                                style={{ padding: '0.4rem 0.6rem' }}
                                            >
                                                <option value="">Casuale</option>
                                                <option value="facile">Facile</option>
                                                <option value="medio">Medio</option>
                                                <option value="difficile">Difficile</option>
                                            </select>
                                        </div>

                                        <button
                                            className="btn btn--primary"
                                            onClick={() => socket.getQuestion(selectedCategoria, selectedDifficolta)}
                                        style={{ fontSize: '0.95rem', padding: '0.4rem 1rem' }}
                                    >
                                        🎲 Mostra Domanda
                                    </button>
                                </div>
                            )
                        }
                            </>
                        )}

                        {currentQuestion && (
                            <div style={{ marginTop: '0.5rem' }}>
                                <div style={{
                                    background: 'var(--surface2)',
                                    borderRadius: '0.5rem',
                                    padding: '1rem',
                                    marginBottom: '0.75rem',
                                    fontSize: '1.1rem',
                                    fontWeight: 600,
                                    lineHeight: 1.4,
                                }}>
                                    <div style={{ fontSize: '0.75rem', color: '#888', marginBottom: '0.4rem', fontWeight: 400 }}>
                                        {currentQuestion.categoria} · {currentQuestion.difficolta}
                                    </div>
                                    {currentQuestion.testo}
                                </div>

                                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.4rem' }}>
                                    {currentQuestion.risposte.map((r, i) => {
                                        const letter = String.fromCharCode(65 + i);
                                        const isCorrect = revealed && r.corretta;
                                        return (
                                            <div key={i} style={{
                                                display: 'flex',
                                                alignItems: 'center',
                                                gap: '0.5rem',
                                                padding: '0.5rem 0.75rem',
                                                borderRadius: '0.4rem',
                                                background: isCorrect ? 'var(--success-bg, #1b5e20)' : 'var(--surface2)',
                                                color: isCorrect ? '#fff' : 'inherit',
                                                transition: 'background 0.2s',
                                            }}>
                                                <span style={{
                                                    width: '1.5rem',
                                                    height: '1.5rem',
                                                    borderRadius: '50%',
                                                    background: 'var(--accent)',
                                                    color: '#fff',
                                                    display: 'flex',
                                                    alignItems: 'center',
                                                    justifyContent: 'center',
                                                    fontSize: '0.8rem',
                                                    fontWeight: 700,
                                                    flexShrink: 0,
                                                }}>
                                                    {letter}
                                                </span>
                                                <span>{r.testo}</span>
                                                {isCorrect && <span style={{ marginLeft: 'auto', fontSize: '0.8rem' }}>✅ Corretta</span>}
                                            </div>
                                        );
                                    })}
                                </div>

                                <div style={{ display: 'flex', gap: '0.5rem', marginTop: '0.75rem' }}>
                                    <button
                                        className="btn btn--ghost"
                                        onClick={() => setRevealed(true)}
                                        disabled={revealed}
                                    >
                                        💡 Rivela Risposta Corretta
                                    </button>
                                    <button
                                        className="btn btn--ghost"
                                        onClick={() => {
                                            setCurrentQuestion(null);
                                            setRevealed(false);
                                        }}
                                    >
                                        ✕ Chiudi
                                    </button>
                                </div>
                            </div>
                        )}
                    </div>
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
