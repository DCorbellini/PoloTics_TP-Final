<%@page import="java.util.List"%>
<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Empleados</title>
  <link rel='stylesheet' type='text/css' media='screen' href='assets/css/main.css'>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container">
  <div class="table-responsive">
    <div class="table-wrapper">
      <div class="table-title">
        <div class="row">
          <div class="col-xs-6">
            <h2>Gestionar <b>Empleados</b></h2>
          </div>
          <div class="col-xs-6">
            <a href="crear-empleado.jsp" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Agregar Empleado</span></a>				
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
            <th>Cargo</th>
            <th>Sueldo</th>
            <th>Usuario</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <% 
            HttpSession sesion = request.getSession();
            List<Empleado> empleados = (List) sesion.getAttribute("empleados");
            for (Empleado emp : empleados) {
          %>
            <tr>
              <td><%= emp.getDni() %></td>
              <td><%= emp.getNombre() + " " + emp.getApellido() %></td>
              <td><%= emp.getDireccion() %></td>
              <td><%= emp.getNacionalidad() %></td>
              <td><%= emp.getCelular() %></td>
              <td><%= emp.getEmail() %></td>
              <td><%= emp.getFechaNac() %></td>
              <td><%= emp.getCargo() %></td>
              <td><%= emp.getSueldo() %></td>
              <td><%= emp.getUser().getUser() %></td> 
              <td>
                <form action="SvEditarEmpleado" method="POST">
                  <input type="hidden" name="id" value="<%= emp.getId() %>">
                  <a href="editar-empleado.jsp" class="edit"><i class="material-icons" data-toggle="tooltip" title="Editar">&#xE254;</i></a>
                </form>
              </td>
              <td>
                <form action="SvEliminarEmpleado" method="POST">
                  <input type="hidden" name="id" value="<%= emp.getId() %>">
                  <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Eliminar">&#xE872;</i></a>
                </form>
              </td>
            </tr> 
          <% } %>
        </tbody>
      </table>
    </div>
  </div>        
  </div>
<!-- Delete Modal HTML -->
<!-- asumo que el usuario de este sistema tiene acceso eliminar un empleado --> 
<div id="deleteEmployeeModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <form>
        <div class="modal-header">						
          <h4 class="modal-title">Eliminar Empleado</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">					
          <p>Esta seguro que desea eliminar a <%--= TODO: emp.getNombnre()? --%>?</p>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
          <input type="submit" class="btn btn-danger" value="Eliminar">
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>