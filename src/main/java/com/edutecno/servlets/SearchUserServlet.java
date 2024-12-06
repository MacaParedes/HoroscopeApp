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

@WebServlet(name = "SearchUserServlet", value = "/searchUser")
public class SearchUserServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        usuarioDAO = new UsuarioDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String criterio = request.getParameter("criterio");

        // Fetch users matching the search criteria
        List<Usuario> usuarios = usuarioDAO.buscarUsuarios(criterio);

        // Pass the results to the JSP
        request.setAttribute("usuarios", usuarios);
        request.setAttribute("criterio", criterio);
        request.getRequestDispatcher("searchUser.jsp").forward(request, response);
    }

}
