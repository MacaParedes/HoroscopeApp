package com.edutecno.servlets;

import com.edutecno.dao.UsuarioDAO;
import com.edutecno.dao.UsuarioDAOImpl;
import com.edutecno.modelo.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateUserServlet", value = "/modifyUser")
public class UpdateUserServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        usuarioDAO = new UsuarioDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            // Load the user for editing
            Usuario userToEdit = usuarioDAO.getUserById(id);
            request.setAttribute("userToEdit", userToEdit);
        }

        // Display all users
        List<Usuario> usuarios = usuarioDAO.getUsuarios();
        request.setAttribute("usuarios", usuarios);

        // Forward to the JSP
        request.getRequestDispatcher("updateUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("POST Request Received");
        System.out.println("id=" + request.getParameter("id"));
        System.out.println("nombre=" + request.getParameter("nombre"));
        System.out.println("username=" + request.getParameter("username"));
        System.out.println("email=" + request.getParameter("email"));
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        UsuarioDAO usuarioDAO = new UsuarioDAOImpl();

        Usuario user = new Usuario();
        user.setId(id);
        user.setNombre(nombre);
        user.setUsername(username);
        user.setEmail(email);

        boolean success = usuarioDAO.updateUser(user);

        if (success) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }



}
