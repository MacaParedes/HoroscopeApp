<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Update Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h1 class="text-center">Manage Users</h1>
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
</div>

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

