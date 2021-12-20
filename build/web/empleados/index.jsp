<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Empleados</title>
    <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/main.css'>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
                    <input class="nav-link" type="submit" disabled="disabled" value="empleados"/>
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


    <div class="table-wapper">
        <div class="table-title">
            <div class="row d-flex justify-content-between">
                <div class="col-xs-6">
                    <h4>Gestionar <b>Empleados</b></h4>
                </div>
                <div class="col-xs-6">
                    <a href="nuevo.jsp" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Agregar
                            Empleado</span></a>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">DNI</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Nacionalidad</th>
                    <th scope="col">Celular</th>
                    <th scope="col">email</th>
                    <th scope="col">Fecha de Nacimiento</th>
                    <th scope="col">Cargo</th>
                    <th scope="col">Sueldo</th>
                    <th scope="col">Usuario</th>
                    <th scope="col" colspan="2">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                        List<Empleado> empleados = (List) sesion.getAttribute("empleados");
                        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                        for (Empleado emp : empleados) {
                    %>
                <tr>
                    <td><%= emp.getDni()%></td>
                    <td><%= emp.getNombre() + " " + emp.getApellido()%></td>
                    <td><%= emp.getDireccion()%></td>
                    <td><%= emp.getNacionalidad()%></td>
                    <td><%= emp.getCelular()%></td>
                    <td><%= emp.getEmail()%></td>
                    <td><%= format.format(emp.getFechaNac())%></td>
                    <td><%= emp.getCargo()%></td>
                    <td><%= emp.getSueldo()%></td>
                    <td><%= emp.getUser().getUser()%></td>
                    <td>
                        <form action="../SvEditarEmpleado" method="POST">
                            <input type="hidden" name="id" value="<%= emp.getId()%>">
                            <button type="submit" class="edit"><i class="material-icons" data-toggle="tooltip"
                                    title="Editar">&#xE254;</i></button>
                        </form>
                    </td>
                    <td>
                        <form action="../SvEliminarEmpleado" method="POST">
                            <input type="hidden" name="id" value="<%= emp.getId()%>">
                            <button type="submit" class="delete"><i class="material-icons" data-toggle="tooltip"
                                    title="Eliminar">&#xE872;</i></button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <% }%>
</body>

</html>