<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Editar Empleado</title>
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
        <div id="editEmployeeModal" class="form">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../SvEditarEmpleado" method="GET">
                        <div class="modal-header">
                            <h4 class="modal-title">Editar Empleado</h4>
                        </div>

                        <%
                            Empleado emp = (Empleado) sesion.getAttribute("empleado");
                            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                            {
                        %>

                        <div class="modal-body">
                            <label>Nombre</label>
                            <input class="form-control" type="text" name="nombre" required value="<%= emp.getNombre()%>">
                        </div>
                        <div class="modal-body">
                            <label>Apellido</label>
                            <input class="form-control" type="text" name="apellido" required value="<%= emp.getApellido()%>">
                        </div>
                        <div class="modal-body">
                            <label>Direccion</label>
                            <input class="form-control" type="text" name="direccion" required value="<%= emp.getDireccion()%>">
                        </div>
                        <div class="modal-body">
                            <label>DNI</label>
                            <input class="form-control" type="number" name="dni" required value="<%= emp.getDni()%>">
                        </div>
                        <div class="modal-body">
                            <label>Fecha de nacimiento</label>
                            <input class="form-control" type="date" name="fecha-nac" required value="<%= format.format(emp.getFechaNac())%>">
                        </div>
                        <div class="modal-body">
                            <label>Nacionalidad</label>
                            <input class="form-control" type="text" name="nacionalidad" required value="<%= emp.getNacionalidad()%>">
                        </div>
                        <div class="modal-body">
                            <label>Celular</label>
                            <input class="form-control" type="number" name="celular" required value="<%= emp.getCelular()%>">
                        </div>
                        <div class="modal-body">
                            <label>Email</label>
                            <input class="form-control" type="email" name="email" required value="<%= emp.getEmail()%>">
                        </div>
                        <div class="modal-body">
                            <label>Cargo</label>
                            <input class="form-control" type="text" name="cargo" required value="<%= emp.getCargo()%>">
                        </div>
                        <div class="modal-body">
                            <label>Sueldo</label>
                            <input class="form-control" type="number" step="0.01" min=0 name="sueldo" required value="<%= emp.getSueldo()%>">
                        </div>
                        <div class="modal-body">
                            <label>Usuario</label>
                            <input class="form-control" type="text" name="user" required value="<%= emp.getUser().getUser()%>">
                        </div>
                        <div class="modal-body">
                            <label>Contraseña</label>
                            <input class="form-control" type="password" name="pass" required value="<%= emp.getUser().getPass()%>">
                        </div>

                        <input type="hidden" name="id" required value="<%= emp.getId()%>">

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

