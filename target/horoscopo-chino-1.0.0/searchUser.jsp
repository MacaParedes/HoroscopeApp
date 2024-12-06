<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Usuarios - Horóscopo Chino</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Oxygen:wght@300;400;700&display=swap" rel="stylesheet">
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

<!-- Sección de búsqueda -->
<main class="main-container">
    <div class="card mt-4">
        <div class="card-body">
            <h3 class="text-center">Buscar Usuarios</h3>
            <form action="searchUser" method="post" class="form-inline justify-content-center mt-3">
                <div class="input-group">
                    <input type="text" name="criterio" class="form-control" placeholder="Buscar por username, email o ID" required>
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-info">Buscar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Sección de resultados -->
    <div class="mt-4">
        <h4 class="text-center">Resultados</h4>
        <c:if test="${empty usuarios}">
            <p class="text-center text-muted">No se encontraron usuarios.</p>
        </c:if>
        <c:if test="${not empty usuarios}">
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
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
            </div>
        </c:if>
    </div>
</main>
<div class="text-center mt-4">
    <a href="menu.jsp" class="btn btn-info">Volver al Menú</a>
</div>
<!-- Pie de página -->
<footer class="text-center mt-4">
    <p>&copy; 2024 Horóscopo Chino. Todos los derechos reservados.</p>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
