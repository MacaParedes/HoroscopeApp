package com.edutecno.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    // Ejemplo de usuario y contraseña (se puede reemplazar con validación de base de datos)
    private static final String USERNAME = "usuarioDemo";
    private static final String PASSWORD = "password123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirige a la página de inicio de sesión cuando se accede a /login con GET
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validar el usuario
        if (USERNAME.equals(username) && PASSWORD.equals(password)) {
            // Si es correcto, redirige a la página principal del horóscopo
            response.sendRedirect("horoscope.jsp");
        } else {
            // Si es incorrecto, redirige de vuelta a la página de login con un mensaje de error
            response.sendRedirect("login.jsp?error=true");
        }
    }




}
