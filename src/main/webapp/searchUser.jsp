<%--
  Created by IntelliJ IDEA.
  User: macarenaparedes
  Date: 04-12-24
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <title>Title</title>
</head>
<body>
<!-- Search Section -->
<div class="container mt-4">
    <h1 class="text-center">Buscar Usuarios</h1>
    <form action="searchUser" method="post" class="form-inline justify-content-center mt-3">
        <input type="text" name="criterio" class="form-control mr-2" placeholder="Buscar por username, email o ID" required>
        <button type="submit" class="btn btn-info">Buscar</button>
    </form>
</div>

<!-- Results Section -->
<div class="container mt-4">
    <h2 class="text-center">Resultados</h2>
    <p>Usuarios List: ${usuarios}</p>
    <c:if test="${empty usuarios}">
        <p class="text-center">No se encontraron usuarios.</p>
    </c:if>
    <c:if test="${not empty usuarios}">
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Username</th>
                <th>Email</th>
                <th>Fecha de Nacimiento</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="usuario" items="${usuarios}">
                <tr>
                    <td>${usuario.id}</td>
                    <td>${usuario.nombre}</td>
                    <td>${usuario.username}</td>
                    <td>${usuario.email}</td>
                    <td>${usuario.fechaNacimiento}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<footer class="text-center mt-4">
    <p>&copy; 2024 Horóscopo Chino. Todos los derechos reservados.</p>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
