<%@page import="logica.Empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="logica.Servicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Servicios</title>
        <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="..">Turismo</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link" href=".."><b>Inicio</b></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../ventas/">ventas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="../servicios/" style="pointer-events: none">servicios</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../paquetes/">paquetes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../clientes/">clientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../empleados/">empleados</a>
            </li>
        </ul>

        <form action="../SvLogout" method="POST">
            <button class="btn btn-danger" type="submit"><i class="material-icons">logout</i></button>
        </form>
    </div>
</nav>

    <body>
        <%
            HttpSession sesion = request.getSession();
            Empleado usuario = (Empleado) sesion.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("../login.jsp");
            } else {
        %>
        <div class="container">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-xs-6">
                                <h2>Gestionar <b>Servicios</b></h2>
                            </div>
                            <div class="col-xs-6">
                                <a href="nuevo.jsp" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Agregar Servicio</span></a>				
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th colspan="5">Servicio</th>
                                <th>Destino</th>
                                <th>Tipo</th>
                                <th>Precio</th>
                                <th>Fecha</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Servicio> servicios = (List) sesion.getAttribute("servicios");
                                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                                for (Servicio ser : servicios) {
                            %>
                            <tr>
                                <td colspan="5">
                                    <div>
                                        <h4><b><%= ser.getNombre() %></b></h4>
                                        <p><%= ser.getDescripcion() %></p>
                                    </div>
                                </td>
                                <td><%=  ser.getDestino() %></td>
                                <td><%=  ser.getTipo() %></td>
                                <td><%=  ser.getPrecio() %></td>
                                <td><%= format.format(ser.getFecha()) %></td>
                                <td>
                                    <form action="../SvEditarServicio" method="POST">
                                        <input type="hidden" name="id" value="<%= ser.getId()%>">
                                        <button type="submit" class="edit"><i class="material-icons" data-toggle="tooltip" title="Editar">&#xE254;</i></button>
                                    </form>
                                </td>
                                <td>
                                    <form action="../SvEliminarServicio" method="POST">
                                        <input type="hidden" name="id" value="<%= ser.getId()%>">
                                        <button type="submit" class="delete"><i class="material-icons" data-toggle="tooltip" title="Eliminar">&#xE872;</i></button>
                                    </form>
                                </td>
                            </tr> 
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>        
        </div>
        <% }%>
    </body>
</html>