/**
 * ⏱️ CountdownTimer — Componente timer visivo per l'asta
 * 
 * Mostra un countdown circolare animato che cambia colore in base
 * al tempo rimanente:
 * - Verde: > 5 secondi
 * - Giallo: 3-5 secondi  
 * - Rosso: < 3 secondi (con effetto pulsante)
 * 
 * Props:
 * @param {number} remaining - Secondi rimanenti
 * @param {number} max - Secondi totali (per calcolare la percentuale)
 * @param {'small'|'large'} size - Dimensione del timer
 */
export default function CountdownTimer({ remaining, max = 10, size = 'large' }) {
    // Calcola la percentuale di tempo trascorso per l'animazione circolare
    const progress = max > 0 ? remaining / max : 0;
    // Angolo dell'arco: 0 = tutto pieno, 1 = tutto vuoto
    const angle = progress * 360;

    // Raggio e dimensioni del cerchio SVG
    // NOTA: size='small' ha raggio 35 (non 40) per adattarsi meglio nelle card admin
    const radius = size === 'large' ? 80 : 35;
    const strokeWidth = size === 'large' ? 10 : 5;
    const normalizedRadius = radius - strokeWidth / 2;
    const circumference = normalizedRadius * 2 * Math.PI;
    const strokeDashoffset = circumference - (angle / 360) * circumference;

    // Determina il colore in base al tempo rimanente
    const getColor = () => {
        if (remaining > 5) return 'var(--color-success)';
        if (remaining > 3) return 'var(--color-warning)';
        return 'var(--color-error)';
    };

    const color = getColor();

    return (
        <div className={`countdown-timer countdown-timer--${size}`}>
            <div className="countdown-timer__svg-wrap">
                <svg
                    className="countdown-timer__svg"
                    viewBox={`0 0 ${radius * 2} ${radius * 2}`}
                >
                    {/* Cerchio di sfondo (grigio scuro) */}
                    <circle
                        className="countdown-timer__bg"
                        cx={radius}
                        cy={radius}
                        r={normalizedRadius}
                        fill="none"
                        stroke="rgba(255,255,255,0.1)"
                        strokeWidth={strokeWidth}
                    />
                    {/* Cerchio di progresso (si riempie/svuota) */}
                    <circle
                        className="countdown-timer__progress"
                        cx={radius}
                        cy={radius}
                        r={normalizedRadius}
                        fill="none"
                        stroke={color}
                        strokeWidth={strokeWidth}
                        strokeDasharray={circumference}
                        strokeDashoffset={strokeDashoffset}
                        strokeLinecap="round"
                        transform={`rotate(-90 ${radius} ${radius})`}
                        style={{
                            transition: 'stroke-dashoffset 0.3s ease, stroke 0.3s ease',
                        }}
                    />
                </svg>
            </div>
            <div
                className={`countdown-timer__number ${remaining <= 3 ? 'countdown-timer__number--danger' : ''}`}
                style={{ color }}
            >
                {remaining}
            </div>
        </div>
    );
}
