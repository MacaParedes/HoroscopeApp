package com.edutecno.servlets;

import com.edutecno.dao.HoroscopoDAO;
import com.edutecno.dao.HoroscopoDAOImpl;
import com.edutecno.modelo.Horoscopo;
import com.edutecno.modelo.Usuario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HoroscopeServlet", value = "/horoscope")
public class HoroscopeServlet extends HttpServlet {

    private HoroscopoDAO horoscopoDAO;

    @Override
    public void init() throws ServletException {
        horoscopoDAO = new HoroscopoDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("user"); // Ensure user is logged in

        if (usuario != null) {
            try {
                // Fetch user's birth date
                java.sql.Date fechaNacimiento = usuario.getFechaNacimiento();

                // Fetch all zodiac signs
                List<Horoscopo> listaHoroscopo = horoscopoDAO.obtenerHoroscopos();

                // Determine the zodiac sign
                Horoscopo horoscopo = null;
                for (Horoscopo temp : listaHoroscopo) {
                    if ((fechaNacimiento.after(temp.getFechaInicio()) && fechaNacimiento.before(temp.getFechaFin()))
                            || fechaNacimiento.equals(temp.getFechaInicio())
                            || fechaNacimiento.equals(temp.getFechaFin())) {
                        horoscopo = temp;
                        break;
                    }
                }

                if (horoscopo != null) {
                    // Pass the result to the JSP
                    request.setAttribute("horoscopo", horoscopo);
                    request.getRequestDispatcher("horoscope.jsp").forward(request, response);
                } else {
                    // Handle case where no horoscope is found
                    request.setAttribute("errorMessage", "No horoscope found for your birth date.");
                    request.getRequestDispatcher("menu.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("An error occurred while processing your request.");
            }
        } else {
            // Redirect to login if user is not logged in
            response.sendRedirect("login.jsp");
        }
    }
}
