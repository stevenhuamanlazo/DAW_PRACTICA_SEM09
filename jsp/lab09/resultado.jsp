<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:if test="${empty sessionScope.usuario}">
  <c:redirect url="index.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Resultado - JSP</title>
  <link rel="stylesheet" href="estilos.css">
</head>
<body class="jsp">
  <main class="tarjeta">
    <header class="cabecera">
      <span class="etiqueta">JSP · HTTP 200</span>
      <h1>Registro exitoso</h1>
      <p class="subtitulo">Datos leídos desde la sesión con EL (sessionScope).</p>
    </header>

    <section class="contenido">
      <div class="alerta ok"><strong>Datos recibidos correctamente.</strong></div>
      <dl class="datos">
        <div><dt>Nombre</dt><dd><c:out value="${sessionScope.usuario.nombre}"/></dd></div>
        <div><dt>Email</dt><dd><c:out value="${sessionScope.usuario.email}"/></dd></div>
        <div><dt>Edad</dt><dd><c:out value="${sessionScope.usuario.edad}"/></dd></div>
      </dl>
      <a href="index.jsp" class="boton secundario">Nuevo registro</a>
    </section>

    <footer class="pie">Lab 09 · IS093A · Sesión JSESSIONID activa</footer>
  </main>
</body>
</html>