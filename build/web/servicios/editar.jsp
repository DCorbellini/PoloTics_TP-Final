<%@page import="logica.Empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Servicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href='./assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Editar Servicio</title>
    </head>

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
                            <select id="selectTipo" class="form-select" name="tipo" required >
                                <option value="Hotel por noche/s">Hotel por noche/s</option>
                                <option value="Alquiler de auto">Alquiler de auto</option>
                                <option value="Pasajes de colectivo">Pasajes de colectivo</option>
                                <option value="Pasajes de avión">Pasajes de avión</option>
                                <option value="Pasajes de tren">Pasajes de tren</option>
                                <option value="Excursiones">Excursiones</option>
                                <option value="Entradas a Eventos">Entradas a Eventos</option>
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

