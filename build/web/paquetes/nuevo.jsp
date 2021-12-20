<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Nuevo Paquete</title>
    </head>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="..">Turismo</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                    <a class="nav-link" href=".."><b>Inicio</b></a>
                </li>
                <li class="nav-item">
                    <form action="../SvVenta" method="GET">
                        <input class="nav-link" type="submit" value="ventas" />
                    </form>
                </li>
                <li class="nav-item">
                    <form action="../SvServicio" method="GET">
                        <input class="nav-link" type="submit" value="servicios" />
                    </form>
                </li>
                <li class="nav-item">
                    <form action="../SvPaquete" method="GET">
                        <input class="nav-link" type="submit" disabled="disabled" value="paquetes" />
                    </form>
                </li>
                <li class="nav-item">
                    <form action="../SvCliente" method="GET">
                        <input class="nav-link" type="submit" value="clientes" />
                    </form>
                </li>
                <li class="nav-item">
                    <form action="../SvEmpleado" method="GET">
                        <input class="nav-link" type="submit" value="empleados" />
                    </form>
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


        <script type="text/javascript">
            // este script basicamente se fija si hay alguna checkbox checkeada
            // si hay, envia el formulario
            // sino, tira una alerta
            $(document).ready(function () {
                $('#btn-submit').click(function () {
                    checked = $("input[type=checkbox]:checked").length;

                    if (checked == 0) {
                        alert("Seleccione al menos un servicio.");
                    } else {
                        $('#form-crear-paquete').submit();
                    }
                });
            });
        </script>

        <div class="form">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="form-crear-paquete" action="../SvCrearPaquete" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Nuevo Paquete</h4>
                        </div>

                        <div class="modal-body">
                            <label><b>Servicios</b></label>
                            <%
                                sesion = request.getSession();
                                List<Servicio> servicios = (List) sesion.getAttribute("servicios");
                                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                                for (Servicio ser : servicios) {
                            %>

                            <div class="form-check">

                                <input class="form-check-input" type="checkbox" name="checkbox-servicios" value="<%= ser.getId() %>" id="<%= ser.getId()%>">
                                <div class="form-check-label" for="<%= ser.getId()%>">

                                    <div class="d-flex justify-content-between">
                                        <div><%= ser.getNombre()%></div>
                                        <div>$<%= ser.getPrecio()%></div>
                                    </div>
                                </div>
                            </div>

                            <% } %>
                        </div>

                        <div class="modal-footer">
                            <a href="."><button type="button" class="btn btn-default">Cancelar</button></a>
                            <button id="btn-submit" type="button" class="btn btn-success">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% }%>
    </body>

</html>