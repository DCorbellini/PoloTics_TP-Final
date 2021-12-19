<%@page import="logica.Empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Clientes</title>
        <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
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
                                <h2>Gestionar <b>Clientes</b></h2>
                            </div>
                            <div class="col-xs-6">
                                <a href="nuevo.jsp" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Agregar Cliente</span></a>				
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>DNI</th>
                                <th>Nombre</th>
                                <th>Direccion</th>
                                <th>Nacionalidad</th>
                                <th>Celular</th>
                                <th>email</th>
                                <th>Fecha de Nacimiento</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Cliente> clientes = (List) sesion.getAttribute("clientes");
                                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                                for (Cliente cli : clientes) {
                            %>
                            <tr>
                                <td><%= cli.getDni()%></td>
                                <td><%= cli.getNombre() + " " + cli.getApellido()%></td>
                                <td><%= cli.getDireccion()%></td>
                                <td><%= cli.getNacionalidad()%></td>
                                <td><%= cli.getCelular()%></td>
                                <td><%= cli.getEmail()%></td>
                                <td><%= format.format(cli.getFechaNac())%></td>
                                <td>
                                    <form action="../SvEditarCliente" method="POST">
                                        <input type="hidden" name="id" value="<%= cli.getId()%>">
                                        <button type="submit" class="edit"><i class="material-icons" data-toggle="tooltip" title="Editar">&#xE254;</i></button>
                                    </form>
                                </td>
                                <td>
                                    <form action="../SvEliminarCliente" method="POST">
                                        <input type="hidden" name="id" value="<%= cli.getId()%>">
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