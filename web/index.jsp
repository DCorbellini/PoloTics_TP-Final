<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Empleado usuario = (Empleado) sesion.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
        %>

        <h1>Hello World!</h1>
        <h2>This is my first loop!</h2>
        <% for (int i = 0; i < 10; ++i) { %>

        <p>This embeded java is very similar to embeded ruby</p>            

        <% } %>


        <form action="SvEmpleado" method="GET">
            <button type="submit">Empleados</button>
        </form>

        <form action="SvCliente" method="GET">
            <button type="submit">Clientes</button>
        </form>

        <form action="SvServicio" method="GET">
            <button type="submit">Servicios</button>
        </form>


        <% }%>
    </body>
</html>
