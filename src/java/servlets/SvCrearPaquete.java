/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paquete;
import logica.Servicio;

/**
 *
 * @author dcorb
 */
@WebServlet(name = "SvCrearPaquete", urlPatterns = {"/SvCrearPaquete"})
public class SvCrearPaquete extends HttpServlet {
    
    
    Controladora control = new Controladora();

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
            out.println("<title>Servlet SvCrearPaquete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvCrearPaquete at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // uso el get para actualizar la lista de servicios
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List <Servicio> servicios = control.traerServicios();
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("servicios", servicios);
        
        response.sendRedirect("paquetes/nuevo.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        PrintWriter out = response.getWriter();
        
        try {
            String[] ids = request.getParameterValues("checkbox-servicios");
            List<Servicio> servicios = new ArrayList();
            Servicio ser;
            
            for (String id : ids) {
                ser = control.traerServicio(Integer.parseInt(id));
                servicios.add(ser);
            }
            
            control.crearPaquete(servicios);
            
            List <Paquete> paquetes = control.traerPaquetes();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("paquetes", paquetes);
            
        } catch (Exception e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + e.getMessage() + "');");
            out.println("location='paquetes/nuevo.jsp';");
            out.println("</script>");
        }
        response.sendRedirect("paquetes/nuevo.jsp");
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
