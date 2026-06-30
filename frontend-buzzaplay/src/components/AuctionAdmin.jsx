import { useState } from 'react';
import CountdownTimer from './CountdownTimer.jsx';

/**
 * 🎮 AuctionAdmin — Dashboard dell'admin per la modalità Asta Fantacalcio
 * 
 * Questo componente viene renderizzato al posto della UI classica
 * quando l'admin attiva la modalità 'auction'. Fornisce:
 * - Configurazione e avvio dell'asta
 * - Timeline dello stato asta in tempo reale
 * - Gestione dei budget dei giocatori
 * - Controlli per bloccare/sbloccare/reset player
 * 
 * @param {object} socket - Oggetto socket restituito da useQuizSocket
 * @param {Array} players - Lista giocatori (con budget e stato)
 * @param {object} auctionState - Stato corrente dell'asta
 * @param {function} setAuctionState - Setter per lo stato dell'asta (locale)
 */
export default function AuctionAdmin({ socket, players, auctionState, auctionEnded }) {
    /**
     * Mostra la sezione "Stato Asta" anche dopo l'aggiudicazione.
     * Deriviamo direttamente dallo stato: se l'asta è attiva OPPURE
     * c'è un leader (asta appena chiusa con vincitore), mostriamo la sezione.
     * All'avvio di una nuova asta active → true e currentLeaderName → null,
     * quindi il risultato precedente "scompare" naturalmente.
     */
    const showStatusSection = auctionState.active || auctionEnded;

    // Stato per i controlli di configurazione
    const [auctionMode, setAuctionMode] = useState('standard');
    const [timerDuration, setTimerDuration] = useState(10);
    const [minBid, setMinBid] = useState(0);
    const [globalBudget, setGlobalBudget] = useState(500);
    const [editBudgetId, setEditBudgetId] = useState(null);
    const [editBudgetValue, setEditBudgetValue] = useState('');

    /**
     * ▶️ Avvia una nuova asta con i parametri correnti
     */
    function handleStartAuction() {
        socket.startAuction(auctionMode, timerDuration, minBid);
    }

    /**
     * ✕ Annulla l'asta corrente
     */
    function handleCancelAuction() {
        socket.cancelAuction();
    }

    /**
     * 💰 Assegna budget a tutti i player
     */
    function handleSetGlobalBudget() {
        const budget = parseInt(globalBudget, 10);
        if (isNaN(budget) || budget < 0) return;
        socket.setBudget(budget);
    }

    /**
     * 💰 Avvia modifica budget per un player specifico
     */
    function handleEditBudgetStart(playerId, currentBudget) {
        setEditBudgetId(playerId);
        setEditBudgetValue(String(currentBudget));
    }

    /**
     * 💰 Conferma modifica budget per un player
     */
    function handleEditBudgetConfirm(playerId) {
        const budget = parseInt(editBudgetValue, 10);
        if (isNaN(budget) || budget < 0) return;
        socket.adjustPlayerBudget(playerId, budget);
        setEditBudgetId(null);
        setEditBudgetValue('');
    }

    /**
     * 💰 Annulla modifica budget
     */
    function handleEditBudgetCancel() {
        setEditBudgetId(null);
        setEditBudgetValue('');
    }

    /**
     * 🧨 Reset player (lo rimuove completamente)
     */
    function handleForceReset(playerId, playerName) {
        const confirmed = confirm(`Resettare il player "${playerName}"?`);
        if (!confirmed) return;
        socket.forceResetPlayer(playerId);
    }

    /**
     * 🔓 Riprendi asta (modalità base)
     */
    function handleResumeAuction() {
        socket.resumeAuction();
    }

    return (
        <div className="admin-content">
            {/* ⏱️ Configurazione Asta */}
            <div className="admin-section">
                <div className="admin-section__header">
                    <div className="admin-section__title">⚙️ Configurazione Asta</div>
                </div>

                <div className="auction-config-grid">
                    <div className="auction-config-field">
                        <label className="auction-config-field__label">Durata timer (sec)</label>
                        <input
                            className="input"
                            type="number"
                            min={3}
                            max={120}
                            value={timerDuration}
                            onChange={(e) => setTimerDuration(parseInt(e.target.value, 10) || 10)}
                            disabled={auctionState.active}
                        />
                    </div>

                    <div className="auction-config-field">
                        <label className="auction-config-field__label">Modalità</label>
                        <select
                            className="input"
                            value={auctionMode}
                            onChange={(e) => setAuctionMode(e.target.value)}
                            disabled={auctionState.active}
                        >
                            <option value="standard">Standard (con input crediti)</option>
                            <option value="base">Base (solo voce)</option>
                        </select>
                    </div>

                    {auctionMode === 'standard' && (
                        <div className="auction-config-field">
                            <label className="auction-config-field__label">Offerta base (crediti)</label>
                            <input
                                className="input"
                                type="number"
                                min={0}
                                value={minBid}
                                onChange={(e) => setMinBid(parseInt(e.target.value, 10) || 0)}
                                disabled={auctionState.active}
                            />
                        </div>
                    )}

                    {auctionMode === 'standard' && (
                        <div className="auction-config-field">
                            <label className="auction-config-field__label">Budget iniziale</label>
                            <div className="budget-set-row">
                                <input
                                    className="input"
                                    type="number"
                                    min={0}
                                    value={globalBudget}
                                    onChange={(e) => setGlobalBudget(parseInt(e.target.value, 10) || 0)}
                                />
                                <button
                                    className="btn btn--success btn--sm"
                                    onClick={handleSetGlobalBudget}
                                    title="Assegna questo budget a tutti i giocatori"
                                >
                                    Assegna a tutti
                                </button>
                            </div>
                        </div>
                    )}
                </div>

                <div className="auction-actions-row">
                    {!auctionState.active ? (
                        <button
                            className="btn btn--primary"
                            onClick={handleStartAuction}
                            style={{ fontSize: '1.1rem', padding: '0.75rem 2rem' }}
                        >
                            🎬 AVVIA ASTA
                        </button>
                    ) : (
                        <>
                            <button
                                className="btn btn--danger"
                                onClick={handleCancelAuction}
                                style={{ fontSize: '1.1rem', padding: '0.75rem 2rem' }}
                            >
                                ✕ ANNULLA ASTA
                            </button>
                            {auctionState.mode === 'base' && auctionState.buzzLocked && (
                                <button
                                    className="btn btn--success"
                                    onClick={handleResumeAuction}
                                    style={{ fontSize: '1.1rem', padding: '0.75rem 2rem' }}
                                >
                                    🔓 RIPRENDI ASTA
                                </button>
                            )}
                        </>
                    )}
                </div>
            </div>

            {/* 🏆 Stato Asta in tempo reale */}
            {/* Mostrato durante l'asta E dopo l'aggiudicazione (finché non parte una nuova asta) */}
            {showStatusSection && (
                <div className="admin-section">
                    <div className="admin-section__header">
                        <div className="admin-section__title">🏆 Stato Asta</div>
                        {!!auctionState.currentLeaderName && !auctionState.active && (
                            <span className="badge badge--success" style={{ fontSize: '0.75rem' }}>
                                ✅ Aggiudicata
                            </span>
                        )}
                    </div>

                    <div className="auction-status-grid">
                        <div className="auction-status-item">
                            <div className="auction-status-item__label">Timer</div>
                            <div style={{ display: 'flex', justifyContent: 'center' }}>
                                <CountdownTimer
                                    remaining={auctionState.timerRemaining}
                                    max={auctionState.timerDuration}
                                    size="small"
                                />
                            </div>
                        </div>
                        <div className="auction-status-item">
                            <div className="auction-status-item__label">Offerta attuale</div>
                            <div className="auction-status-item__value">
                                {auctionState.mode === 'standard'
                                    ? `${auctionState.currentBid} crediti${auctionState.currentLeaderName ? ` — ${auctionState.currentLeaderName}` : ''}`
                                    : '-'}
                            </div>
                        </div>
                        <div className="auction-status-item">
                            <div className="auction-status-item__label">Miglior offerente</div>
                            <div className="auction-status-item__value">
                                {auctionState.currentLeaderName || 'Nessuno'}
                            </div>
                        </div>
                        <div className="auction-status-item">
                            <div className="auction-status-item__label">Stato pulsantiera</div>
                            <div className="auction-status-item__value">
                                {auctionState.buzzLocked ? (
                                    <span className="badge badge--error">
                                        🔴 Bloccata
                                        {auctionState.currentLeaderName && (
                                            <span style={{ display: 'block', fontSize: '0.85rem', marginTop: '0.25rem' }}>
                                                da {auctionState.currentLeaderName}
                                            </span>
                                        )}
                                    </span>
                                ) : (
                                    <span className="badge badge--success">🟢 Libera</span>
                                )}
                            </div>
                        </div>
                        {auctionState.mode === 'standard' && (
                            <div className="auction-status-item">
                                <div className="auction-status-item__label">Giocatori esclusi</div>
                                <div className="auction-status-item__value">
                                    {auctionState.excludedIds ? auctionState.excludedIds.length : 0}
                                </div>
                            </div>
                        )}
                        {auctionState.mode === 'base' && auctionState.lastBuzzerId && (
                            <div className="auction-status-item">
                                <div className="auction-status-item__label">Ultimo offerente</div>
                                <div className="auction-status-item__value">
                                    {auctionState.currentLeaderName || 'Nessuno'}
                                </div>
                            </div>
                        )}
                    </div>
                </div>
            )}

            {/* 👥 Giocatori con budget */}
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
                                    {auctionState.mode === 'standard' && <th>Crediti</th>}
                                    <th>Stato</th>
                                    <th>Azioni</th>
                                </tr>
                            </thead>
                            <tbody>
                                {players.map(player => (
                                    <tr key={player.id} className={
                                        auctionState.excludedIds && auctionState.excludedIds.includes(player.id)
                                            ? 'table-row--excluded'
                                            : ''
                                    }>
                                        <td style={{ fontWeight: 600 }}>{player.name}</td>
                                        {auctionState.mode === 'standard' && (
                                            <td>
                                                {editBudgetId === player.id ? (
                                                    <div className="budget-edit-row">
                                                        <input
                                                            className="input budget-edit-input"
                                                            type="number"
                                                            min={0}
                                                            value={editBudgetValue}
                                                            onChange={(e) => setEditBudgetValue(e.target.value)}
                                                            onKeyDown={(e) => {
                                                                if (e.key === 'Enter') handleEditBudgetConfirm(player.id);
                                                                if (e.key === 'Escape') handleEditBudgetCancel();
                                                            }}
                                                            autoFocus
                                                        />
                                                        <button
                                                            className="btn btn--icon btn--success"
                                                            onClick={() => handleEditBudgetConfirm(player.id)}
                                                            title="Conferma"
                                                        >
                                                            ✓
                                                        </button>
                                                        <button
                                                            className="btn btn--icon btn--ghost"
                                                            onClick={handleEditBudgetCancel}
                                                            title="Annulla"
                                                        >
                                                            ✕
                                                        </button>
                                                    </div>
                                                ) : (
                                                    <span className={`budget-display ${player.budget <= 0 ? 'budget-display--empty' : ''}`}>
                                                        {player.budget}
                                                    </span>
                                                )}
                                            </td>
                                        )}
                                        <td>
                                            <span className={`badge ${player.canBuzz ? 'badge--success' : 'badge--error'}`}>
                                                {player.canBuzz ? '🟢 Abilitato' : '🔴 Bloccato'}
                                            </span>
                                            {auctionState.mode === 'standard' && auctionState.excludedIds && auctionState.excludedIds.includes(player.id) && (
                                                <span className="badge badge--error" style={{ marginLeft: '0.35rem' }}>
                                                    🚫 Escluso
                                                </span>
                                            )}
                                            {auctionState.mode === 'base' && auctionState.lastBuzzerId === player.id && !auctionState.buzzLocked && (
                                                <span className="badge badge--warning" style={{ marginLeft: '0.35rem' }}>
                                                    ⏳ In attesa
                                                </span>
                                            )}
                                        </td>
                                        <td>
                                            <div style={{ display: 'flex', gap: '0.35rem', alignItems: 'center' }}>
                                                {/* Modifica budget (solo standard) */}
                                                {auctionState.mode === 'standard' && (
                                                    <button
                                                        className="btn btn--icon btn--ghost"
                                                        onClick={() => handleEditBudgetStart(player.id, player.budget)}
                                                        title="Modifica crediti"
                                                    >
                                                        ✏️
                                                    </button>
                                                )}
                                                {/* Blocca / Sblocca */}
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
                                                {/* Reset player */}
                                                <button
                                                    className="btn btn--icon btn--danger"
                                                    onClick={() => handleForceReset(player.id, player.name)}
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
        </div>
    );
}
