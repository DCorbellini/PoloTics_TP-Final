/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Servicio;

/**
 *
 * @author dcorb
 */
@WebServlet(name = "SvEditarServicio", urlPatterns = {"/SvEditarServicio"})
public class SvEditarServicio extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // este try-catch esta para el parseo de la fecha
        // no va a fallar nunca porque el front fuerza que la fecha tenga el formato correcto
        // pero el compilador me lo pide
        try {
            
            PrintWriter out = response.getWriter();
            
            SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha;
            Double precio = Double.parseDouble(request.getParameter("precio"));
            int id = Integer.parseInt(request.getParameter("id"));
            fecha = parser.parse(request.getParameter("fecha"));
            
            Servicio ser = new Servicio(
                    id,
                    request.getParameter("nombre"),
                    request.getParameter("descripcion"),
                    request.getParameter("destino"),
                    precio,
                    request.getParameter("tipo"),
                    fecha
            );
            
            // guardo el estado actual del servicio para que no haya que volver a modificar los datos en caso de fallo
            HttpSession sesion = request.getSession();
            sesion.setAttribute("servicio", ser);
            
            // servicio no falla pero un sistema de manejo de excepciones nunca esta de más
            try {
                control.editarServicio(ser);

                List <Servicio> servicios = control.traerServicios();
                sesion.setAttribute("servicios", servicios);
                
                response.sendRedirect("servicios/");
            } catch (Exception ex) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + ex.getMessage() + "');");
                out.println("location='servicios/editar.jsp';");
                out.println("</script>");
                
                response.sendRedirect("servicios/editar.jsp");
            }
            
        } catch (ParseException ex) {
            Logger.getLogger(SvEditarServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Servicio ser = control.traerServicio(Integer.parseInt(request.getParameter("id")));
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("servicio", ser);
        
        response.sendRedirect("servicios/editar.jsp");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
