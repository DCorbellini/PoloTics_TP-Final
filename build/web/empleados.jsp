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
            <p><label>Nombre: </label><input type="text" name="nombre"></p>
            <p><label>Apellido: </label><input type="text" name="apellido"></p>
            <p><label>Direccion: </label><input type="text" name="direccion"></p>
            <p><label>DNI: </label><input type="number" name="dni"></p>
            <p><label>Fecha de nacimiento: </label><input type="date" name="fecha-nac"></p>
            <p><label>Nacionalidad: </label><input type="text" name="nacionalidad"></p>
            <p><label>Celular: </label><input type="number" name="celular"></p>
            <p><label>Email: </label><input type="text" name="email"></p>
            <p><label>Cargo: </label><input type="text" name="cargo"></p>
            <p><label>Sueldo: </label><input type="number" step="0.01" min=0 name="sueldo"></p>
            <p><label>Usuario: </label><input type="text" name="user"></p>
            <p><label>Contraseña: </label><input type="password" name="pass"></p>
                 
            <button type="submit">Guardar</button>
        </form>
    </body>
</html>
