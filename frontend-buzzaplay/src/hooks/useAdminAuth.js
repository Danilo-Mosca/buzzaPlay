import { useState, useRef } from 'react';

const PASSWORD_KEY = 'quiz_admin_password';

export function useAdminAuth() {
    const [isAdmin, setIsAdmin] = useState(
        !!localStorage.getItem(PASSWORD_KEY)
    );
    const [loginError, setLoginError] = useState(null);
    const sendLoginRef = useRef(null);

    function attachSendAdminLogin(sendFn) {
        sendLoginRef.current = sendFn;
    }

    function login(password) {
        setLoginError(null);
        localStorage.setItem(PASSWORD_KEY, password);
        setIsAdmin(true);
        if (sendLoginRef.current) {
            sendLoginRef.current(password);
        }
    }

    function handleAdminOk() {
        setLoginError(null);
    }

    function handleAdminDenied() {
        localStorage.removeItem(PASSWORD_KEY);
        setIsAdmin(false);
        setLoginError('Password errata');
    }

    function logout() {
        localStorage.removeItem(PASSWORD_KEY);
        setIsAdmin(false);
        setLoginError(null);
    }

    return { isAdmin, loginError, login, logout, attachSendAdminLogin, handleAdminOk, handleAdminDenied };
}
