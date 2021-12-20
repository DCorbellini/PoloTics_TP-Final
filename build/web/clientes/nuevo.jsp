<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Nuevo Cliente</title>
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
                <a class="nav-link" href="../servicios/">servicios</a>
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
        <div id="addEmployeeModal" class="form">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../SvCrearCliente" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Nuevo Cliente</h4>
                        </div>

                        <div class="modal-body">
                            <label>Nombre</label>
                            <input class="form-control" type="text" name="nombre" required>
                        </div>
                        <div class="modal-body">
                            <label>Apellido</label>
                            <input class="form-control" type="text" name="apellido" required>
                        </div>
                        <div class="modal-body">
                            <label>Direccion</label>
                            <input class="form-control" type="text" name="direccion" required>
                        </div>
                        <div class="modal-body">
                            <label>DNI</label>
                            <input class="form-control" type="number" name="dni" required>
                        </div>
                        <div class="modal-body">
                            <label>Fecha de nacimiento</label>
                            <input class="form-control" type="date" name="fecha-nac" required>
                        </div>
                        <div class="modal-body">
                            <label>Nacionalidad</label>
                            <input class="form-control" type="text" name="nacionalidad" required>
                        </div>
                        <div class="modal-body">
                            <label>Celular</label>
                            <input class="form-control" type="number" name="celular" required>
                        </div>
                        <div class="modal-body">
                            <label>Email</label>
                            <input class="form-control" type="email" name="email" required>
                        </div>

                        <div class="modal-footer">
                            <a href="."><button type="button" class="btn btn-default">Cancelar</button></a>
                            <button type="submit" class="btn btn-success">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% }%>
    </body>

</html>