<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Vacunas"%>
<%@page import="com.emergentes.modelo.GestorVacunas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("agenda")==null){
    GestorVacunas objeto1=new GestorVacunas();  
     objeto1.insertVacuna(new Vacunas(1,"Brunito Diaz",25.0,1.40,"Si"));
    objeto1.insertVacuna(new Vacunas(2,"Juancito Pinto",30.0,1.52,"No"));   
    session.setAttribute("agenda", objeto1);
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vacunas</title>
    </head>
    <body>
        <br>
        <table border="1" cellspacing="0">
            <tr>
                 <th>PRIMER PARCIAL TEM-742 
                     <br>
                    Nombre: Antonio Torrez Mamani
                    <br>
                    Carnet: 9949828
                    </th>   
            </tr>
        </table>
        <h1 >Registro de vacunas</h1>
       <a href="Controller?op=nuevo" >Nuevo</a><br><br>
       <table border="1" cellspacing="0" >
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Peso</th>
                <th>Talla</th>
                <th>Vacuna</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.peso}</td>
                    <td>${item.talla}</td>
                    <td>${item.vacuna}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Editar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
