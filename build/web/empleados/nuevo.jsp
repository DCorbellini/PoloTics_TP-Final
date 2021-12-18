<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Nuevo Empleado</title>
    </head>
  <body>
      <div id="addEmployeeModal" class="form">
        <div class="modal-dialog">
          <div class="modal-content">
              <form action="SvCrearEmpleado" method="POST">
              <div class="modal-header">						
                <h4 class="modal-title">Nuevo Empleado</h4>
                <form action="SvEmpleado" method="GET">
                  <a href="../SvEmpleado" class="close" aria-hidden="true"><i class="material-icons" style="color: red;">cancel</i></a>
                </form>
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
              <div class="modal-body">
                <label>Cargo</label>
                <input class="form-control" type="text" name="cargo" required>
              </div>
              <div class="modal-body">
                <label>Sueldo</label>
                <input class="form-control" type="number" step="0.01" min=0 name="sueldo" required>
              </div>
              <div class="modal-body">
                <label>Usuario</label>
                <input class="form-control" type="text" name="user" required>
              </div>
              <div class="modal-body">
                <label>Contraseña</label>
                <input class="form-control" type="password" name="pass" required>
              </div>

              <div class="modal-footer">
                <form action="SvEmpleado" method="GET" style="display: inline-block">
                  <a href="../SvEmpleado"><button type="button" class="btn btn-default">Cancelar</button></a>
                </form>
                <input type="submit" class="btn btn-success" value="Guardar">
              </div>
            </form>
          </div>
        </div>
      </div>
    </body>
</html>

