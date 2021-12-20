<%@page import="logica.Empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Servicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Editar Servicio</title>
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
                        <input class="nav-link" type="submit" value="ventas"/>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="../SvServicio" method="GET">
                        <input class="nav-link" type="submit" value="servicios"/>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="../SvPaquete" method="GET">
                        <input class="nav-link" type="submit" value="paquetes"/>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="../SvCliente" method="GET">
                        <input class="nav-link" type="submit" value="clientes"/>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="../SvEmpleado" method="GET">
                        <input class="nav-link" type="submit" value="empleados"/>
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
        <div id="addEmployeeModal" class="form">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../SvEditarServicio" method="GET">
                        <div class="modal-header">
                            <h4 class="modal-title">Editar Servicio</h4>
                        </div>

                        <%
                            Servicio ser = (Servicio) sesion.getAttribute("servicio");
                            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
                            {
                        %>

                        <div class="modal-body">
                            <label>Nombre</label>
                            <input class="form-control" type="text" name="nombre" required value="<%= ser.getNombre()%>">
                        </div>
                        <div class="modal-body">
                            <label>Descipcion</label>
                            <textarea class="form-control" name="descripcion" required><%= ser.getDescripcion()%></textarea>
                        </div>
                        <div class="modal-body">
                            <label>Destino</label>
                            <input class="form-control" type="text" name="destino" required value="<%= ser.getDestino()%>">
                        </div>
                        <div class="modal-body">
                            <label>Fecha</label>
                            <input class="form-control" type="date" name="fecha" required value="<%= formater.format(ser.getFecha())%>">
                        </div>
                        <div class="modal-body">
                            <label>Precio</label>
                            <input class="form-control" type="number" step="0.01" min=0 name="precio" required value="<%= ser.getPrecio()%>">
                        </div>
                        <div class="modal-body">
                            <label>Tipo</label>
                            <select id="selectTipo" class="form-select" name="tipo" required>
                                <%for (String tipo : ser.getTipos()) {%>
                                <option value="<%= tipo %>"><%= tipo %></option>
                                <% } %>
                            </select>
                            <!-- script para seleccionar el tipo de servicio --> 
                            <script type="text/javascript">
                                let elmnt = document.getElementById('selectTipo');
                                let value = '<%= ser.getTipo() %>'

                                for (let i = 0; i < elmnt.options.length; i++)
                                {
                                    if (elmnt.options[i].value === value) {
                                        elmnt.selectedIndex = i;
                                        break;
                                    }
                                }
                            </script>
                        </div>

                        <input type="hidden" name="id" required value="<%= ser.getId()%>">

                        <div class="modal-footer">
                            <a href="."><button type="button" class="btn btn-default">Cancelar</button></a>
                            <button type="submit" class="btn btn-success">Guardar</button>
                        </div>

                        <% } %>
                    </form>
                </div>
            </div>
        </div>
        <% }%> 
    </body>

</html>

