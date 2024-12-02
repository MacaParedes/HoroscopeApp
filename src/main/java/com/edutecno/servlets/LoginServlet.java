package com.edutecno.servlets;

import com.edutecno.dao.UsuarioDAO;
import com.edutecno.dao.UsuarioDAOImpl;
import com.edutecno.modelo.Usuario;
import com.edutecno.procesaconexion.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(LoginServlet.class);

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        usuarioDAO = new UsuarioDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirige a la página de inicio de sesión cuando se accede a /login con GET
        request.getRequestDispatcher("login2.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Usuario user = usuarioDAO.validateUser(username, password);

        var usuarios =  usuarioDAO.getUsuarios();
        log.info("USUARIO {}" , user);
        if (user != null) {
            // User is authenticated, create session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("menu.jsp"); // Redirect to the menu page
        } else {
            // Invalid login, send back to login.jsp with an error message
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login2.jsp").forward(request, response);
        }
    }




}
