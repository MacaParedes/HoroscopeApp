package com.edutecno.servlets;

import com.edutecno.dao.HoroscopoDAO;
import com.edutecno.dao.HoroscopoDAOImpl;
import com.edutecno.modelo.Horoscopo;
import com.edutecno.modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "HoroscopeServlet", value = "/horoscope")
public class HoroscopeServlet extends HttpServlet {

    private HoroscopoDAO horoscopoDAO;

    @Override
    public void init() throws ServletException {
        horoscopoDAO = new HoroscopoDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario user = (Usuario) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get the user's horoscope based on birth date
        //Horoscopo horoscopo = horoscopoDAO.findHoroscopeByDate(user.getFechaNacimiento());
        //request.setAttribute("horoscopo", horoscopo);

        // Forward to a JSP to display the horoscope
        request.getRequestDispatcher("horoscope.jsp").forward(request, response);
    }
}
