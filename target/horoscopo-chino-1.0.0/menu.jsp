<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicia sesión - Horóscopo Chino</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oxygen:wght@300;400;700&family=Playwrite+GB+S:ital,wght@0,100..400;1,100..400&display=swap" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-info">
    <a class="navbar-brand" href="#">Horóscopo Chino</a>
    <div> Tu Horóscopo chino</div>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Regístrate</a>
            </li>
        </ul>
    </div>
</nav>

<header class="text-center m-0"></header>
<main class="main-container m-2">
    que quieres hacer hoy admin
    <div class="row justify-content-center">
        <div class="col-auto">
            <form action="horoscope" method="post">
                <button type="submit" class="btn btn-info">Conoce tu animal</button>
            </form>
        </div>
        <div class="col-auto">
            <a href="searchUser.jsp" class="btn btn-info">Buscar usuarios</a>
        </div>
        <div class="col-auto">
            <a href="modifyUser" class="btn btn-custom bg-info text-white">Modificar datos</a>
        </div>
        <div class="col-auto">
            <a href="deleteUser" class="btn btn-custom bg-info text-white">Eliminar cuenta</a>
        </div>
    </div>
</main>



<footer>
    <p>&copy; 2024 Horóscopo Chino. Todos los derechos reservados.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
