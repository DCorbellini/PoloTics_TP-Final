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
import logica.Empleado;
import logica.Usuario;

@WebServlet(name = "SvEditarEmpleado", urlPatterns = {"/SvEditarEmpleado"})
public class SvEditarEmpleado extends HttpServlet {

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
        
        // este try-catch esta para el parseo de la fecha
        // no va a fallar nunca porque el front fuerza que la fecha tenga el formato correcto
        // pero el compilador me lo pide
        try {
            
            PrintWriter out = response.getWriter();
            
            SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNac;
            Double sueldo;
            int id = Integer.parseInt(request.getParameter("id"));
            fechaNac = parser.parse(request.getParameter("fecha-nac"));
            sueldo = Double.parseDouble(request.getParameter("sueldo"));
            
            Usuario user = new Usuario(request.getParameter("user"), request.getParameter("pass"));
            Empleado emp = new Empleado(
                    request.getParameter("cargo"),
                    sueldo,
                    user,
                    id,
                    request.getParameter("nombre"),
                    request.getParameter("apellido"),
                    request.getParameter("direccion"),
                    request.getParameter("dni"),
                    fechaNac,
                    request.getParameter("nacionalidad"),
                    request.getParameter("celular"),
                    request.getParameter("email")
                    
            );
            
            // guardo el estado actual del empleado para que no haya que volver a modificar los datos en caso de fallo
            HttpSession sesion = request.getSession();
            sesion.setAttribute("empleado", emp);
            
            try {
                control.editarEmpleado(emp);

                List <Empleado> empleados = control.traerEmpleados();
                sesion.setAttribute("empleados", empleados);
                
                response.sendRedirect("empleados/");
            } catch (Exception ex) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + ex.getMessage() + "');");
                out.println("location='empleados.jsp';");
                out.println("</script>");
                
                response.sendRedirect("empleados/editar.jsp");
            }
            
        } catch (ParseException ex) {
            Logger.getLogger(SvEditarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
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
        Empleado emp = control.traerEmpleado(Integer.parseInt(request.getParameter("id")));
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("empleado", emp);
        
        response.sendRedirect("empleados/editar.jsp");
        
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
