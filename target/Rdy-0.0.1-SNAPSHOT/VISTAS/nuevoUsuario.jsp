<%-- 
    Document   : nuevoUsuario
    Created on : 11 nov. 2021, 21:36:19
    Author     : Nuria
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <title>Rdy</title>
          <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
          <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
          <link rel="stylesheet" href="ESTILOS/login/css/login.css">          
          
    </head>
    <body>        
        
         <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-5">
            <img src="ESTILOS/login/images/nuevoUsuario.jpg" alt="login" class="login-card-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
              <div class="brand-wrapper">
                <img src="ESTILOS/login/images/logo1.svg" alt="logo" class="logo" style=" width: 500px; height: 200px;">
              </div>
                <div style=" padding-left: 100px;"> 
                    
              <p class="login-card-description">Nuevo usuario</p>
              <div id="error"></div>
              <form action="../rdyController?action=register" method="post">               
                  <div class="form-group">
                    <label for="usuario" class="sr-only">Usuario</label>
                    <input type="text" name="usuario" id="usuario" class="form-control" placeholder="Usuario" maxlength="15">
                  </div>
                  <div class="form-group mb-4">
                    <label for="clave" class="sr-only">Contraseña</label>
                    <input type="password" name="clave" id="clave" class="form-control" placeholder="Contraseña" maxlength="15">
                  </div>
                  <div class="form-group mb-4">
                  	<input type="checkbox" id="terminos" class="" >
                    <label for="" class=""> Acepto los <a href="#!">términos de uso</a> </label>
                  </div>
                  <input hidden="rol" name="rol" id="rol" value="cliente"/>
                  <input hidden="memoria" name="memoria" id="memoria" value="1000000"/>
                  <input name="nuevoUsuario" id="nuevoUsuario" class="btn btn-block login-btn mb-4" type="submit" value="Aceptar">
                  <a href="../index.jsp" ><input name="cancelar" id="cancelar" class="btn btn-block login-btn mb-4" type="button" value="Cancelar"></a>
                </form>
             
            </div>
                </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </body>
</html>

