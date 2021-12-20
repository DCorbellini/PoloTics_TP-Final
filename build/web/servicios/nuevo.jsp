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
        <title>Nuevo Servicio</title>
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
        <div class="form">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../SvCrearServicio" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Nuevo Servicio</h4>
                        </div>

                        <div class="modal-body">
                            <label>Nombre</label>
                            <input class="form-control" type="text" name="nombre" required>
                        </div>
                        <div class="modal-body">
                            <label>Descipcion</label>
                            <textarea class="form-control" name="descripcion" required></textarea>
                        </div>
                        <div class="modal-body">
                            <label>Destino</label>
                            <input class="form-control" type="text" name="destino" required>
                        </div>
                        <div class="modal-body">
                            <label>Fecha</label>
                            <input class="form-control" type="date" name="fecha" required>
                        </div>
                        <div class="modal-body">
                            <label>Precio</label>
                            <input class="form-control" type="number" step="0.01" min=0 name="precio" required>
                        </div>
                        <div class="modal-body">
                            <label>Tipo</label>
                            <select class="form-select" name="tipo" required>
                                <option selected disabled hidden value="">Seleccione un tipo</option>
                                <option value="Hotel por noche/s">Hotel por noche/s</option>
                                <option value="Alquiler de auto">Alquiler de auto</option>
                                <option value="Pasajes de colectivo">Pasajes de colectivo</option>
                                <option value="Pasajes de avión">Pasajes de avión</option>
                                <option value="Pasajes de tren">Pasajes de tren</option>
                                <option value="Excursiones">Excursiones</option>
                                <option value="Entradas a Eventos">Entradas a Eventos</option>
                            </select>
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