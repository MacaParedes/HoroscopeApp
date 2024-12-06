package com.edutecno.servlets;

import com.edutecno.dao.UsuarioDAO;
import com.edutecno.dao.UsuarioDAOImpl;
import com.edutecno.modelo.Usuario;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "CreateUserServlet", value = "/register")
public class CreateUserServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;


    @Override
    public void init(ServletConfig config) throws ServletException {
        usuarioDAO = new UsuarioDAOImpl();
    }

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
        user.setFechaNacimiento(java.sql.Date.valueOf(fechaNacimiento));
        user.setPassword(password);

        boolean isRegistered = usuarioDAO.createUser(user);

        if (isRegistered) {
            response.sendRedirect("login.jsp?success=1");
        } else {
            request.setAttribute("errorMessage", "Error al registrar el usuario.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }


}
