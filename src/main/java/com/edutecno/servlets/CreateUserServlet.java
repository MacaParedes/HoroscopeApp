package com.edutecno.servlets;

import com.edutecno.dao.UsuarioDAO;
import com.edutecno.modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "CreateUserServlet", value = "/register")
public class CreateUserServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String password = request.getParameter("password");

        Usuario user = new Usuario();
        user.setNombre(nombre);
        user.setUsername(username);
        user.setEmail(email);
        user.setFechaNacimiento(java.sql.Date.valueOf(fechaNacimiento)); // Convert to SQL Date
        user.setPassword(password);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean isRegistered = usuarioDAO.createUser(user);

        if (isRegistered) {
            response.sendRedirect("login.jsp?success=1");
        } else {
            request.setAttribute("errorMessage", "Error al registrar el usuario.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }


}
