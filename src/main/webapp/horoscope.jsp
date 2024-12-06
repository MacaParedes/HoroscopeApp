<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu Horóscopo Chino</title>
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
                <a class="nav-link" href="menu.jsp">Menú Principal</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Contenido principal -->
<main class="main-container mt-4">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h3 class="text-center">Conoce a tu animal del Horóscopo Chino</h3>
                <p class="text-center mt-3">
                    Tu animal es <b class="text-primary">${horoscopo.animal}</b>
                </p>
                <p class="text-center"><b>Período:</b> ${horoscopo.fechaInicio} a ${horoscopo.fechaFin}</p>
                <div class="text-center mt-4">
                    <a href="menu.jsp" class="btn btn-info">Volver al Menú</a>
                </div>
            </div>
        </div>
    </div>
</main>

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
