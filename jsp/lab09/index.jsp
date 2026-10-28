<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
  // Ciclo de vida: se ejecuta UNA sola vez cuando Tomcat crea el servlet
  public void jspInit()    { getServletContext().log("[lab09] jspInit index.jsp"); }
  public void jspDestroy() { getServletContext().log("[lab09] jspDestroy index.jsp"); }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Lab 09 - JSP</title>
  <link rel="stylesheet" href="estilos.css">
</head>
<body class="jsp">
  <main class="tarjeta">
    <header class="cabecera">
      <span class="etiqueta">JSP · Tomcat</span>
      <h1>Registro de estudiante</h1>
      <p class="subtitulo">Completa tus datos y envíalos al servidor.</p>
    </header>

    <section class="contenido">
      <form action="procesar.jsp" method="POST" novalidate>
        <div class="campo">
          <label for="nombre">Nombre completo</label>
          <input type="text" id="nombre" name="nombre" maxlength="60" placeholder="Ej. Steven Luis">
        </div>
        <div class="campo">
          <label for="email">Correo electrónico</label>
          <input type="email" id="email" name="email" placeholder="nombre@correo.com">
        </div>
        <div class="campo">
          <label for="edad">Edad</label>
          <input type="number" id="edad" name="edad" placeholder="Entre 1 y 120">
        </div>
        <button type="submit" class="boton">Enviar datos</button>
      </form>
    </section>

    <footer class="pie">Lab 09 · IS093A · Servidor Tomcat en localhost:8080</footer>
  </main>
</body>
</html>