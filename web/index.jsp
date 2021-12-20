<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href='./assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Turismo</title>
    </head>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="." style="pointer-events: none">Turismo</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                    <a class="nav-link" href="." style="pointer-events: none"><b>Inicio</b></a>
                </li>
                <li class="nav-item">
                    <form action="./SvVenta" method="GET">
                        <input class="nav-link" type="submit" value="ventas"/>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="./SvServicio" method="GET">
                        <input class="nav-link" type="submit" value="servicios"/>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="./SvPaquete" method="GET">
                        <input class="nav-link" type="submit" value="paquetes"/>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="./SvCliente" method="GET">
                        <input class="nav-link" type="submit" value="clientes"/>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="./SvEmpleado" method="GET">
                        <input class="nav-link" type="submit" value="empleados"/>
                    </form>
                </li>
            </ul>

            <form action="./SvLogout" method="POST">
                <button class="btn btn-danger" type="submit"><i class="material-icons">logout</i></button>
            </form>
        </div>
    </nav>

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
