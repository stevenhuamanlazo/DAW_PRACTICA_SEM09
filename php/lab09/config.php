<?php
declare(strict_types=1);

// Solo en desarrollo: mostrar errores
ini_set('display_errors', '1');
error_reporting(E_ALL);

// Sesión con cookie protegida
session_start([
    'cookie_httponly' => true,
    'cookie_samesite' => 'Strict',
]);

// Escapa la salida para evitar XSS
function e(string $valor): string {
    return htmlspecialchars($valor, ENT_QUOTES, 'UTF-8');
}