/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Servicio;
import logica.Controladora;

/**
 *
 * @author dcorb
 */
@WebServlet(name = "SvCrearServicio", urlPatterns = {"/SvCrearServicio"})
public class SvCrearServicio extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvCrearServicio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvCrearServicio at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        
        Controladora control = new Controladora();
    
        PrintWriter out = response.getWriter();
        
        // los servicios no deberian dar ningun error pero me parecio que
        // tener un sistema a mano para mostrar errores no esta de m??s
        try {
            control.crearServicio(
                    request.getParameter("nombre"),
                    request.getParameter("descripcion"),
                    request.getParameter("destino"),
                    request.getParameter("fecha"),
                    request.getParameter("precio"),
                    request.getParameter("tipo")
            );
            
            
            List <Servicio> servicios = control.traerServicios();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("servicios", servicios);
            
        } catch (Exception e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + e.getMessage() + "');");
            out.println("location='servicios/nuevo.jsp';");
            out.println("</script>");
        }
        response.sendRedirect("servicios/nuevo.jsp");
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
