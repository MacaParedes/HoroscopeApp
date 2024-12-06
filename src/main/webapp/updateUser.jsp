<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Update Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<!-- Barra de navegación -->
<nav class="navbar navbar-expand-lg navbar-dark bg-info">
    <a class="navbar-brand" href="#">Horóscopo Chino</a>
    <div>Tu Horóscopo chino</div>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="register.jsp">Regístrate</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Iniciar sesión</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <h1 class="text-center">Actualizar cuenta</h1>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Username</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${usuarios}">
            <tr id="row-${user.id}">
                <td>${user.id}</td>
                <td>
                    <input type="text" name="nombre-${user.id}" value="${user.nombre}" class="form-control" disabled>
                </td>
                <td>
                    <input type="text" name="username-${user.id}" value="${user.username}" class="form-control" disabled>
                </td>
                <td>
                    <input type="email" name="email-${user.id}" value="${user.email}" class="form-control" disabled>
                </td>
                <td>
                    <button type="button" class="btn btn-primary btn-sm" onclick="enableEditing(${user.id})">✏️ Edit</button>
                    <button type="button" class="btn btn-success btn-sm" onclick="saveUser(${user.id})" style="display: none;">💾 Save</button>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="cancelEditing(${user.id})" style="display: none;">✖️ Cancel</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="text-center mt-4">
        <a href="menu.jsp" class="btn btn-info">Volver al Menú</a>
    </div>
</div>

<!-- Pie de página -->
<footer class="text-center mt-4">
    <p>&copy; 2024 Horóscopo Chino. Todos los derechos reservados.</p>
</footer>

<!-- Include external JavaScript -->
<script src="js/updateUsers.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

