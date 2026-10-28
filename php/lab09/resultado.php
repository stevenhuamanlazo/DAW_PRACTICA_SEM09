<?php
require_once __DIR__ . '/config.php';

if (empty($_SESSION['usuario'])) {
    header('Location: index.html', true, 302);
    exit;
}
$u = $_SESSION['usuario'];
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Resultado PHP</title>
</head>
<body>
  <h1>Datos recibidos correctamente</h1>
  <p><strong>Nombre:</strong> <?= e($u['nombre']) ?></p>
  <p><strong>Email:</strong> <?= e($u['email']) ?></p>
  <p><strong>Edad:</strong> <?= e((string) $u['edad']) ?></p>
  <a href="index.html">Nuevo registro</a>
</body>
</html>