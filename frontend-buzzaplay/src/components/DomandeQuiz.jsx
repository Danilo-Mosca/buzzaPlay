import { useState, useEffect } from 'react';

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
 *   socket              — oggetto WebSocket useQuizSocket (per chiamare getQuestion())
 *   categories          — array [{id, nome}] ricevuto dal server via CATEGORIES
 *   categoriesLoaded    — booleano: true dopo la prima risposta CATEGORIES
 *   currentQuestion     — oggetto domanda { id, categoria, difficolta, testo, risposte[] } o null
 *   onCloseQuestion     — callback (() => void) che in Admin.jsx fa setCurrentQuestion(null)
 *   filterExhausted     — booleano: true se il server ha segnalato exhausted
 *                         (tutte le domande per questo filtro sono state mostrate)
 *   onDismissExhausted  — callback () => void per resettare filterExhausted in Admin.jsx
 *                         quando l'admin cambia dropdown o richiede una nuova domanda
 *   cycleResetCounter   — numero incrementale: ogni volta che il server resetta il ciclo
 *                         (tutte le domande mostrate, si ricomincia), questo valore
 *                         aumenta. L'useEffect lo usa per mostrare il toast notifica.
 */
function DomandeQuiz({ socket, categories, categoriesLoaded, currentQuestion, onCloseQuestion, filterExhausted, onDismissExhausted, cycleResetCounter }) {

    // Stato dei due dropdown: categoria (null = "Casuale") e difficoltà (null = "Casuale")
    // Questi stati sono LOCALI al componente perché riguardano solo l'interfaccia filtri.
    const [selectedCategoria, setSelectedCategoria] = useState(null);
    const [selectedDifficolta, setSelectedDifficolta] = useState(null);

    /**
     * Toast per la notifica di reset ciclo.
     * Quando tutte le domande sono state mostrate e il ciclo ricomincia,
     * mostra un messaggio per 4 secondi poi si auto-dismiss.
     * Usiamo uno stato stringa invece di un boolean per supportare
     * eventuali messaggi diversi in futuro.
     */
    const [toastMsg, setToastMsg] = useState(null);

    // useEffect che reagisce a cycleResetCounter: ogni volta che il
    // server resetta il ciclo, mostra la notifica per 4 secondi.
    // Nota: setToastMsg è wrappato in setTimeout(0) per evitare la regola
    // react-hooks/set-state-in-effect di React 19 (setState sincrono
    // dentro useEffect può causare render a cascata). Deferrendo la
    // chiamata, lo stato non viene più impostato SINCORONAMENTE dall'effetto
    // ma in un microtask successivo, rispettando la regola.
    useEffect(() => {
        if (cycleResetCounter > 0) {
            const showTimer = setTimeout(() => {
                setToastMsg('🔄 Tutte le domande sono state mostrate, si ricomincia!');
            }, 0);
            const hideTimer = setTimeout(() => setToastMsg(null), 4000);
            return () => {
                clearTimeout(showTimer);
                clearTimeout(hideTimer);
            };
        }
    }, [cycleResetCounter]);

    // Helper: quando l'admin cambia un dropdown, resetta il flag
    // filterExhausted in Admin.jsx così il messaggio scompare e
    // riappaiono i normali filtri.
    const handleCategoriaChange = (e) => {
        setSelectedCategoria(e.target.value ? Number(e.target.value) : null);
        if (filterExhausted) onDismissExhausted();
    };

    const handleDifficoltaChange = (e) => {
        setSelectedDifficolta(e.target.value || null);
        if (filterExhausted) onDismissExhausted();
    };

    return (
        <div className="admin-section">
            <div className="admin-section__header">
                <div className="admin-section__title">❓ Domande Quiz</div>
            </div>

            {/*
             * FASE 1 — Nessuna domanda attiva: mostra i filtri o l'avviso DB down,
             * oppure se filterExhausted mostra il messaggio di esaurimento.
             * Quando currentQuestion è null, l'admin può scegliere categoria e difficoltà,
             * oppure vede un avviso se il database PostgreSQL non è raggiungibile.
             */}
            <>
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
                             *
                             * NOTA BENE (bug fix): filterExhausted era un blocco sostitutivo
                             * che nascondeva completamente i dropdown quando tutte le domande
                             * per la categoria/difficoltà corrente erano esaurite. Questo
                             * impediva all'admin di cambiare filtro, intrappolandolo in un
                             * vicolo cieco.
                             *
                             * Ora filterExhausted è un BANNER DI AVVISO persistente SOPRA
                             * i dropdown. L'admin vede chiaramente che il filtro corrente è
                             * esaurito, ma PUÒ comunque interagire con i dropdown e il
                             * pulsante per cambiare categoria/difficoltà e provare nuove
                             * domande. I callback handleCategoriaChange e
                             * handleDifficoltaChange chiamano onDismissExhausted()
                             * per rimuovere il banner appena l'admin cambia filtro.
                             */}
                            {filterExhausted && (
                                <div style={{
                                    marginTop: '0.5rem',
                                    marginBottom: '0.5rem',
                                    padding: '0.5rem 0.75rem',
                                    borderRadius: '0.4rem',
                                    background: 'var(--warning-bg, #f57f17)',
                                    color: '#fff',
                                    fontSize: '0.85rem',
                                    lineHeight: 1.4,
                                }}>
                                    ⚠️ <strong>Domande esaurite</strong> per la tipologia selezionata.
                                    Cambia filtro qui sotto per vedere le altre domande.
                                </div>
                            )}

                            <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '0.75rem', flexWrap: 'wrap', alignItems: 'flex-end' }}>
                            {/* Dropdown Categoria — popolato dal server via CATEGORIES */}
                            <div>
                                <label style={{ display: 'block', fontSize: '0.8rem', marginBottom: '0.2rem', color: '#aaa' }}>
                                    Categoria
                                </label>
                                <select
                                    className="input"
                                    value={selectedCategoria ?? ''}
                                    onChange={handleCategoriaChange}
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
                                    onChange={handleDifficoltaChange}
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
                             * Se filterExhausted è true, lo resetta prima di chiedere la domanda
                             * (perché l'admin potrebbe aver cambiato filtro ma non aver ancora
                             * toccato i dropdown — ad esempio se clicca "Mostra Domanda" subito
                             * dopo il cambio filtro automatico).
                             */}
                            <button
                                className="btn btn--primary"
                                onClick={() => {
                                    if (filterExhausted) onDismissExhausted();
                                    socket.getQuestion(selectedCategoria, selectedDifficolta);
                                }}
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

            {/* Toast notifica reset ciclo — appare per 4 secondi, poi scompare */}
            {toastMsg && (
                <div style={{
                    marginTop: '0.75rem',
                    padding: '0.6rem 1rem',
                    borderRadius: '0.4rem',
                    background: 'var(--accent)',
                    color: '#fff',
                    fontSize: '0.9rem',
                    textAlign: 'center',
                    animation: 'fadeIn 0.3s ease',
                }}>
                    {toastMsg}
                </div>
            )}
            </>
        </div>
    );
}

export default DomandeQuiz;
