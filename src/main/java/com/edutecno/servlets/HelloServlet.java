package com.edutecno.servlets;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello Worl   deploy!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");

        response.setContentType("text/html");
        response.getWriter().println("<!DOCTYPE html");
        response.getWriter().println("<html>");
        response.getWriter().println("<head>");
        response.getWriter().println("<title> Formulario de Envío </title>");
        response.getWriter().println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">");
        response.getWriter().println("</head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<form action='RespuestaFormulario' method='GET'>");
        response.getWriter().println("<div class='form-group'>");
        response.getWriter().println("<label for='idNombre' class='form-label'>Nombre</label>");
        response.getWriter().println("<input type='text' class='form-control' id='idNombre'>");
        response.getWriter().println("</div><br>");
        response.getWriter().println("<button type='submit' class='btn btn-primary'>Enviar</button>");
        response.getWriter().println("</form></body></html>");

    }

    public void destroy() {
    }
}