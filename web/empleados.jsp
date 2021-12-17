<%-- 
    Document   : empleados
    Created on : 16-Dec-2021, 6:19:58 PM
    Author     : dcorb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administracion de Empleados</title>
    </head>
    <body>
        <h1>Alta Empleados!</h1>
        
        <form action="SvEmpleado" method="POST">
            <p><label>Nombre: </label><input type="text" name="nombre" required></p>
            <p><label>Apellido: </label><input type="text" name="apellido" required></p>
            <p><label>Direccion: </label><input type="text" name="direccion" required></p>
            <p><label>DNI: </label><input type="number" name="dni" required></p>
            <p><label>Fecha de nacimiento: </label><input type="date" name="fecha-nac" required></p>
            <p><label>Nacionalidad: </label><input type="text" name="nacionalidad" required></p>
            <p><label>Celular: </label><input type="number" name="celular" required></p>
            <p><label>Email: </label><input type="text" name="email" required></p>
            <p><label>Cargo: </label><input type="text" name="cargo" required></p>
            <p><label>Sueldo: </label><input type="number" step="0.01" min=0 name="sueldo" required></p>
            <p><label>Usuario: </label><input type="text" name="user" required></p>
            <p><label>Contraseña: </label><input type="password" name="pass" required></p>
                 
            <button type="submit">Guardar</button>
        </form>
    </body>
</html>
