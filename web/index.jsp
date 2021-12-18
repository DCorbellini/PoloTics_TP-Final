<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h2>This is my first loop!</h2>
        <% for (int i=0; i<10; ++i) { %>
            
            <p>This embeded java is very similar to embeded ruby</p>            
            
        <% } %>
        
        <form>
            <a id="aEmpleados" href="empleados.jsp">Empleado</a>
        </form>
        
    </body>
</html>
