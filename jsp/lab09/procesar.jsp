<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
  // 1. Solo POST -> 405
  if (!"POST".equalsIgnoreCase(request.getMethod())) {
      response.setHeader("Allow", "POST");
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
      return;
  }

  // 2. Leer parámetros
  String nombre  = request.getParameter("nombre");
  String email   = request.getParameter("email");
  String edadStr = request.getParameter("edad");
  nombre = (nombre == null) ? "" : nombre.trim();

  // 3. Validar
  List<String> errores = new ArrayList<>();
  if (nombre.isEmpty() || nombre.length() > 60) errores.add("El nombre es obligatorio (máx. 60 caracteres).");
  if (email == null || !email.matches("^[\\w.+-]+@[\\w-]+(\\.[\\w-]+)+$")) errores.add("El email no es válido.");
  int edad = 0;
  try {
      edad = Integer.parseInt(edadStr);
      if (edad < 1 || edad > 120) errores.add("La edad debe estar entre 1 y 120.");
  } catch (NumberFormatException ex) {
      errores.add("La edad debe ser un número entero.");
  }

  // 4. Datos válidos -> sesión + 302
  if (errores.isEmpty()) {
      Map<String, Object> usuario = new HashMap<>();
      usuario.put("nombre", nombre);
      usuario.put("email", email);
      usuario.put("edad", edad);
      session.setAttribute("usuario", usuario);
      response.sendRedirect("resultado.jsp");
      return;
  }

  // 5. Con errores -> 400
  response.setStatus(400);
  request.setAttribute("errores", errores);
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Errores - JSP</title>
  <link rel="stylesheet" href="estilos.css">
</head>
<body class="jsp">
  <main class="tarjeta">
    <header class="cabecera">
      <span class="etiqueta">JSP · HTTP 400</span>
      <h1>Revisa tus datos</h1>
      <p class="subtitulo">El servidor rechazó el formulario.</p>
    </header>

    <section class="contenido">
      <div class="alerta error">
        <strong>Se encontraron ${errores.size()} error(es):</strong>
        <ul>
          <c:forEach var="err" items="${errores}">
            <li><c:out value="${err}"/></li>
          </c:forEach>
        </ul>
      </div>
      <a href="index.jsp" class="boton">Volver al formulario</a>
    </section>

    <footer class="pie">Lab 09 · IS093A · Validación con request.getParameter() y JSTL</footer>
  </main>
</body>
</html>