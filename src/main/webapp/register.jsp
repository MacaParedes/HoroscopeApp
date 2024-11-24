<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Regístrate - Horóscopo Chino</title>
  <link rel="stylesheet" type="text/css" href="css/styles.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
        <a class="nav-link" href="login.jsp">Iniciar sesión</a>
      </li>
    </ul>
  </div>
</nav>

<!-- Contenido principal -->
<main class="main-container">
  <div class="card">
    <div class="card-body">
      <h3 class="text-center">Regístrate</h3>
      <form action="register" method="post">
        <div class="form-group row">
          <label for="nombre" class="col-sm-4 col-form-label">Nombre:</label>
          <div class="col-sm-8">
            <input type="text" id="nombre" name="nombre" class="form-control" required>
          </div>
        </div>
        <div class="form-group row">
          <label for="username" class="col-sm-4 col-form-label">Nombre de usuario:</label>
          <div class="col-sm-8">
            <input type="text" id="username" name="username" class="form-control" required>
          </div>
        </div>
        <div class="form-group row">
          <label for="email" class="col-sm-4 col-form-label">Correo electrónico:</label>
          <div class="col-sm-8">
            <input type="email" id="email" name="email" class="form-control" required>
          </div>
        </div>
        <div class="form-group row">
          <label for="fechaNacimiento" class="col-sm-4 col-form-label">Fecha de nacimiento:</label>
          <div class="col-sm-8">
            <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control" required>
          </div>
        </div>
        <div class="form-group row">
          <label for="password" class="col-sm-4 col-form-label">Contraseña:</label>
          <div class="col-sm-8">
            <input type="password" id="password" name="password" class="form-control" required>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-sm-8 offset-sm-4">
            <button type="submit" class="btn btn-custom bg-info text-white">Registrar</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</main>

<!-- Pie de página -->
<footer>
  <p>&copy; 2024 Horóscopo Chino. Todos los derechos reservados.</p>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
