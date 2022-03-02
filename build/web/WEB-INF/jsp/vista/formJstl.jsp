<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabecera.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
              <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"></link>
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
              <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0.min.js"></script>
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
              
        <title>Formulario</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-4">
                    <div class="row">
              
                        <h1>Formulario de registro</h1>
                    </div>
                    <form:form commandName="persona" cssClass="navbar-form">
                        <form:errors path="*" element="div" cssClass="alert alert-danger"/>
                            <div class="form-group">
                                <form:label path="nombre"> Nombre Usuario: </form:label>
                                <form:input path="nombre" placeholder="Digite su nombre"></form:input>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                            <form:label path="apellido"> Apellido Usuario: </form:label>
                            <form:input path="apellido" placeholder="Digite su apellido"></form:input>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                            <form:label path="edad"> Edad Usuario: </form:label>
                            <form:input path="edad" value ="" placeholder="Digite su edad"></form:input>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                            <form:label path="correo"> Correo Usuario: </form:label>
                            <form:input path="correo" placeholder="Digite su correo"></form:input>
                            </div>
                            <br>
                            <br>
                            <form:button name="Enviar" class="btn btn-info">Enviar</form:button>
                            <br>
                            <br>
                            <a href="index.htm" class="btn btn-warning"> Regresar </a>
                            <br>
                            <br>
                            <a href="listarJstl.htm" class="btn btn-info">Listar usuarios</a>
                            <br>
                            <br>
                            <a href="agregarCliente.htm" class="btn btn-info">Agregar usuarios</a>
                            

                        </form:form>
                    
                </div>
            </div>
        </div>
    </body>
</html>
