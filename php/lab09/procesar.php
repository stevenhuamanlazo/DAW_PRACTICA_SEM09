<?php
require_once __DIR__ . '/config.php';

// 1. Solo se acepta POST -> 405
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    header('Allow: POST');
    exit('405 - Método no permitido. Use el formulario.');
}

// 2. Leer datos con filter_input (nunca register_globals)
$nombre = trim((string) filter_input(INPUT_POST, 'nombre', FILTER_UNSAFE_RAW));
$email  = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
$edad   = filter_input(INPUT_POST, 'edad', FILTER_VALIDATE_INT,
            ['options' => ['min_range' => 1, 'max_range' => 120]]);

// 3. Validar
$errores = [];
if ($nombre === '' || strlen($nombre) > 60) $errores[] = 'El nombre es obligatorio (máx. 60 caracteres).';
if (!$email)                                $errores[] = 'El email no es válido.';
if ($edad === false || $edad === null)      $errores[] = 'La edad debe ser un número entre 1 y 120.';

// 4. Con errores -> 400
if ($errores) {
    http_response_code(400);
    echo '<h1>Errores de validación</h1><ul>';
    foreach ($errores as $err) {
        echo '<li>' . e($err) . '</li>';
    }
    echo '</ul><a href="index.html">Volver</a>';
    exit;
}

// 5. Datos válidos -> guardar en sesión y redirigir con 302 (patrón PRG)
$_SESSION['usuario'] = ['nombre' => $nombre, 'email' => $email, 'edad' => $edad];
header('Location: resultado.php', true, 302);
exit;