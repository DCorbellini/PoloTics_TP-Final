package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Empleado;
import logica.Usuario;

@WebServlet(name = "SvCrearEmpleado", urlPatterns = {"/SvCrearEmpleado"})
public class SvCrearEmpleado extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        Boolean paseEspecial = (Boolean) sesion.getAttribute("pase especial");

        SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNac = new Date(0, 0, 0);
        Double sueldo;
        

        Usuario user = new Usuario(
                request.getParameter("user"),
                request.getParameter("pass")
        );
                
        Empleado emp = new Empleado(
                request.getParameter("cargo"),
                0.0,
                user,
                0,
                request.getParameter("nombre"),
                request.getParameter("apellido"),
                request.getParameter("direccion"),
                request.getParameter("dni"),
                fechaNac,
                request.getParameter("nacionalidad"),
                request.getParameter("celular"),
                request.getParameter("email")
        );
        // teoricamente esto nunca va a fallar, pero...
        try {
            fechaNac = parser.parse(request.getParameter("fecha-nac"));
            emp.setFechaNac(fechaNac);
        } catch (ParseException ex) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + ex.getMessage() + "');");
            out.println("location='empleados.jsp';");
            out.println("</script>");
            
            response.sendRedirect("empleados/nuevo.jsp");
        }
        try {
            sueldo = Double.parseDouble(request.getParameter("sueldo"));
            emp.setSueldo(sueldo);
        } catch (NumberFormatException ex) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + ex.getMessage() + "');");
            out.println("location='empleados.jsp';");
            out.println("</script>");
            
            response.sendRedirect("empleados/nuevo.jsp");
        }
        
        try {
            control.crearEmpleado(emp);

            List<Empleado> empleados = control.traerEmpleados();
            sesion.setAttribute("empleados", empleados);

        } catch (Exception e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + e.getMessage() + "');");
            out.println("location='empleados.jsp';");
            out.println("</script>");
        }
        
        // si es un pase especial se setea el usuario como el empleado
        // que se acaba se agregar a la tabla, se saca el pase especial
        // y se va al inicio
        if (paseEspecial == true) {
            sesion.setAttribute("usuario", emp);
            sesion.setAttribute("pase especial", false);
            response.sendRedirect(".");
        } else {
            response.sendRedirect("empleados/nuevo.jsp");
        }
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
