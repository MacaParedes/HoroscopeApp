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


@WebServlet(name = "DeleteUserServlet", value = "/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() {
        usuarioDAO = new UsuarioDAOImpl();

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Usuario> users = usuarioDAO.getUsuarios();
        System.out.println(" USERS {}" + users);
        request.setAttribute("usuarios", users);

        request.getRequestDispatcher("deleteUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");

        boolean isDeleted = usuarioDAO.deleteUser(userId);

        if (isDeleted) {
            response.sendRedirect("menu.jsp?message=User deleted successfully");
        } else {
            request.setAttribute("errorMessage", "Error deleting user.");
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        }
    }



}
