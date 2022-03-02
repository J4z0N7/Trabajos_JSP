<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css" />
              
           
        <title>Listado de Datos</title>
    </head>
    <body>
        <h1>Información recogida</h1>
        <table class="table table-bordered table-striped table-hover"
               <thead>
            
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Teléfono</th>
                </thead>
                <tbody>
                
                    <tr>
                        <td><c:out value="${nombre}"/></td>
                        <td><c:out value="${apellido}"/></td>
                        <td><c:out value="${correo}"/></td>
                        <td><c:out value="${edad}"/></td>                        
                    </tr>
                
                </tbody>
             
        </table> 
            <ul>
            <a href="index.htm" class="btn btn-success"> Regresar </a>
            </ul>        
    </body>
</html>
