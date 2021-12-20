package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

@WebServlet(name = "SvEditarPaquete", urlPatterns = {"/SvEditarPaquete"})
public class SvEditarPaquete extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String[] ids = request.getParameterValues("checkbox-servicios");
        List<Servicio> servicios = new ArrayList();
        Servicio ser;

        for (String id : ids) {
            ser = control.traerServicio(Integer.parseInt(id));
            servicios.add(ser);
        }

        Paquete paquete = new Paquete(
                Integer.parseInt(request.getParameter("id")),
                servicios
        );

        try {
            control.editarPaquete(paquete);

            List<Paquete> paquetes = control.traerPaquetes();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("paquetes", paquetes);
            
            response.sendRedirect("paquetes/");

        } catch (Exception e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + e.getMessage() + "');");
            out.println("location='paquetes/nuevo.jsp';");
            out.println("</script>");
            
            response.sendRedirect("paquetes/editar.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();

        List<Servicio> servicios = control.traerServicios();
        sesion.setAttribute("servicios", servicios);

        Paquete paq = control.traerPaquete(Integer.parseInt(request.getParameter("id")));
        sesion.setAttribute("paquete", paq);

        response.sendRedirect("paquetes/editar.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
