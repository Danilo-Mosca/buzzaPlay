import { useState } from 'react';

/**
 * 🔍 QuestionDisplay
 *
 * Sotto-componente che mostra la domanda attiva (testo + 4 risposte) e i pulsanti
 * "Rivela Risposta Corretta" / "Chiudi".
 *
 * Perché un componente separato?
 * ------------------------------------------------------------
 * La domanda attiva ha bisogno di uno stato `revealed` (bool) che si resetta a false
 * quando arriva una NUOVA domanda. Invece di usare useEffect (che React 19 sconsiglia
 * per setState sincroni — regola `react-hooks/set-state-in-effect`), sfruttiamo il
 * meccanismo nativo di React: usiamo `key={question.id}` sul JSX del componente.
 *
 * Quando la prop `key` cambia (nuovo id domanda), React BUTTA via l'istanza corrente
 * e ne crea una nuova con stato `revealed` = false. Nessun useEffect necessario,
 * nessuna race condition, massima performance.
 *
 * Props:
 *   question  — oggetto domanda { id, categoria, difficolta, testo, risposte[{testo, corretta}] }
 *   onClose   — callback () => void, chiamato da Admin.jsx per resettare currentQuestion a null
 */
function QuestionDisplay({ question, onClose }) {
    const [revealed, setRevealed] = useState(false);

    return (
        <div style={{ marginTop: '0.5rem' }}>
            {/* Testo della domanda con categoria e difficoltà */}
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
                    {question.categoria} · {question.difficolta}
                </div>
                {question.testo}
            </div>

            {/* 4 risposte in colonna — lettera (A/B/C/D) + testo + eventuale badge "✅ Corretta" */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '0.4rem' }}>
                {question.risposte.map((r, i) => {
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
                            {/* Pallino circolare con la lettera */}
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

            {/* Pulsanti azione: rivela risposta corretta + chiudi */}
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
                    onClick={onClose}
                >
                    ✕ Chiudi
                </button>
            </div>
        </div>
    );
}

/**
 * ❓ DomandeQuiz
 *
 * Sezione della dashboard admin per la gestione delle domande del Quizzettone.
 * Qui l'admin può:
 *   1. Selezionare una categoria (popolata dinamicamente dal server) e una difficoltà
 *   2. Cliccare "Mostra Domanda" per ricevere una domanda casuale
 *   3. Visualizzare la domanda con 4 risposte in ordine mescolato (Fisher-Yates lato server)
 *   4. Cliccare "Rivela Risposta Corretta" per evidenziare la risposta giusta (UI locale)
 *   5. Chiudere la domanda per tornare ai filtri
 *
 * La sezione è visibile SOLO nell'admin, mai trasmessa ai player.
 *
 * Props (fornite da Admin.jsx):
 *   socket            — oggetto WebSocket useQuizSocket (per chiamare getQuestion())
 *   categories        — array [{id, nome}] ricevuto dal server via CATEGORIES
 *   categoriesLoaded  — booleano: true dopo la prima risposta CATEGORIES
 *   currentQuestion   — oggetto domanda { id, categoria, difficolta, testo, risposte[] } o null
 *   onCloseQuestion   — callback (() => void) che in Admin.jsx fa setCurrentQuestion(null)
 */
function DomandeQuiz({ socket, categories, categoriesLoaded, currentQuestion, onCloseQuestion }) {

    // Stato dei due dropdown: categoria (null = "Casuale") e difficoltà (null = "Casuale")
    // Questi stati sono LOCALI al componente perché riguardano solo l'interfaccia filtri.
    const [selectedCategoria, setSelectedCategoria] = useState(null);
    const [selectedDifficolta, setSelectedDifficolta] = useState(null);

    return (
        <div className="admin-section">
            <div className="admin-section__header">
                <div className="admin-section__title">❓ Domande Quiz</div>
            </div>

            {/*
             * FASE 1 — Nessuna domanda attiva: mostra i filtri o l'avviso DB down.
             * Quando currentQuestion è null, l'admin può scegliere categoria e difficoltà,
             * oppure vede un avviso se il database PostgreSQL non è raggiungibile.
             */}
            {!currentQuestion ? (
                <>
                    {/*
                     * CASO 1A — Database non disponibile: categoriesLoaded è true ma
                     * categories è vuoto. Mostra un messaggio di avviso invece dei filtri.
                     * Questo accade quando DATABASE_URL è mancante o PostgreSQL non risponde.
                     */}
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
                        <>
                            {/*
                             * CASO 1B — Database OK: mostra i due dropdown e il pulsante.
                             * La lista delle categorie è popolata dal server via CATEGORIES.
                             */}
                            <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '0.75rem', flexWrap: 'wrap', alignItems: 'flex-end' }}>
                            {/* Dropdown Categoria — popolato dal server via CATEGORIES */}
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

                            {/* Dropdown Difficoltà — valori fissi: facile / medio / difficile */}
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

                            {/*
                             * Pulsante "Mostra Domanda" — invia ADMIN_GET_QUESTION al server
                             * con i filtri correnti. La risposta arriverà asincrona via QUESTION.
                             */}
                            <button
                                className="btn btn--primary"
                                onClick={() => socket.getQuestion(selectedCategoria, selectedDifficolta)}
                                style={{ fontSize: '0.95rem', padding: '0.4rem 1rem' }}
                            >
                                🎲 Mostra Domanda
                            </button>
                        </div>
                        </>
                    )}
                </>
            ) : (
                <>
                {/*
                 * FASE 2 — Domanda attiva: mostra la domanda con le 4 risposte.
                 * key={currentQuestion.id} forza React a ricreare QuestionDisplay da capo
                 * per ogni nuova domanda, resettando automaticamente lo stato `revealed`.
                 */}
                <QuestionDisplay
                    key={currentQuestion.id}
                    question={currentQuestion}
                    onClose={onCloseQuestion}
                />
                </>
            )}
        </div>
    );
}

export default DomandeQuiz;
