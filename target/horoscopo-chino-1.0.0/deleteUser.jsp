<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Delete Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h1 class="text-center">Manage Users</h1>

    <!-- Success/Error Messages -->
    <c:if test="${param.message != null}">
        <div class="alert alert-success text-center">${param.message}</div>
    </c:if>
    <c:if test="${param.errorMessage != null}">
        <div class="alert alert-danger text-center">${param.errorMessage}</div>
    </c:if>

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
            <tr>
                <td>${user.id}</td>
                <td>${user.nombre}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>
                    <form action="deleteUser" method="post" style="display:inline;">
                        <input type="hidden" name="userId" value="${user.id}">
                        <button type="submit" class="btn btn-danger btn-sm">
                            🗑 Delete
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<footer class="text-center mt-4">
    <p>&copy; 2024 Horóscopo Chino. Todos los derechos reservados.</p>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
