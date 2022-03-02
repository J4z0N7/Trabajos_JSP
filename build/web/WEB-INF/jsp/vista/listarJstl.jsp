<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabecera.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap5.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.11.4/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <script>$(document).ready(function() {
            $('#tabla1').DataTable({
               "info": true,
               "paging": true,
               "buttons": true,
               "lengthMenu": [[5, 10, 25, 50, -1],[5, 10, 25, 50, "All"]],
               "language":{
                   "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"},
               "searching": true,
               "paginate": true
               });
        } );
        </script>
        <title>Listado de Datos</title>
    </head>
    <body>
        <div <a button="regresar" href="formJstl.htm" class="btn-warning" width="50px">Regresar al formulario</a></div>
        <div style="text-align:center;"><h1>Información recogida</h1></div>
        <div class="container">
        <table id="tabla1" class="table table-striped">
        
            
            <thead>
            <th>Id</th>    
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Teléfono</th>
                </thead>
            
                <tbody>
                <c:forEach items="${persona}" var="p">
                    <tr>
                        <td><c:out value="${p.id_cliente}"/></td>
                        <td><c:out value="${p.nombre}"/></td>
                        <td><c:out value="${p.direccion}"/></td>
                        <td><c:out value="${p.telefono}"/></td>
                        <td><c:out value="${p.ciudad}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            <br>
            <br>
            <a href="updateCliente.htm?cliente=${p.id_cliente}" class=" btn btn-info">Actualizar</a>
            <br>
            <br>
            <a href="deleteCliente.htm?cliente=${p.id_cliente}" class=" btn btn-warning">Borrar</a>
        </table>
         
        </div>
    </body>
</html>
