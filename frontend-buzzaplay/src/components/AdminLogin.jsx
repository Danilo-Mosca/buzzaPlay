import { useState } from 'react';

function AdminLogin({ onLogin, error }) {
    const [password, setPassword] = useState('');

    function handleSubmit() {
        onLogin(password);
    }

    function handleKeyDown(e) {
        if (e.key === 'Enter') handleSubmit();
    }

    return (
        <div className="page">
            <div className="card">
                <div className="game-logo">Quizzettone</div>
                <p className="card__subtitle">🔐 Accesso amministratore</p>

                <input
                    className="input"
                    type="password"
                    placeholder="Password admin"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    onKeyDown={handleKeyDown}
                />

                <div style={{ marginTop: '0.75rem' }}>
                    <button
                        className="btn btn--primary btn--full"
                        disabled={!password}
                        onClick={handleSubmit}
                    >
                        Entra
                    </button>
                </div>

                {error && <div className="admin-login__error">{error}</div>}
            </div>
        </div>
    );
}

export default AdminLogin;
