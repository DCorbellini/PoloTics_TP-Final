<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href='assets/css/main.css'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Nuevo Empleado</title>
    </head>

    <body>
        <div id="loginModal" class="form">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="SvLogin" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Iniciar Sesión</h4>
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
                            <button type="submit" class="btn btn-primary">login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
