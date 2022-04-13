<!DOCTYPE html>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<html lang="es">
<head>
<title>Rdy</title>
<meta charset="UTF-8">
<meta name="description" content="RDY portal de videojuegos">
<meta name="keywords" content="rdy, juegos, creativo, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="ESTILOS/principal/img/palanca-de-mando.png"
	rel="shortcut icon" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="ESTILOS/principal/css/bootstrap.min.css" />
<link rel="stylesheet" href="ESTILOS/principal/css/font-awesome.min.css" />
<link rel="stylesheet" href="ESTILOS/principal/css/owl.carousel.css" />
<link rel="stylesheet" href="ESTILOS/principal/css/style.css" />
<link rel="stylesheet" href="ESTILOS/principal/css/animate.css" />

<link
	href="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/alertify.min.css"
	rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js"></script>


<script type="text/javascript">

 function aceptarCambios() {
	 
	 event.preventDefault();
	 var imgVal = $('#foto_portada').val(); 
     if(imgVal=='') 
     { 
         alertify.error('¡Por favor seleccione una imágen de portada!');
         return false; 
     }else{

		event.preventDefault();
		alertify.confirm("¿Está seguro que quiere insertar este juego?",
				  function() {
			 		event.preventDefault();
			 		$('#formInsertar').submit();
	  					  
				  },
				  function() {
					  event.preventDefault();
					  alertify.error('¡Cancelado!');
				  }
				);
     }
 }
     
</script>


</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<header class="header-section">
		<div class="container">
			<!-- logo -->
			<a class="site-logo" href="#"> <img
				src="ESTILOS/login/images/logo1blancosmall.png" alt="logo RDY">
			</a>
			<div class="user-panel" style="text-align: center;">
				Hola, ${usuario.usuario}
				<div>
					<a href="perfil.jsp" style="font-size: 17px;">Acceder a mi
						cuenta</a>
				</div>
			</div>
			<!-- responsive -->
			<div class="nav-switch">
				<i class="fa fa-bars"></i>
			</div>
			<!-- site menu -->
			<nav class="main-menu" style="margin-top: 50px;">
				<ul>
					<li><a href="">
							<form action="../rdyController?action=inicio" method="post">
								<input name="inicio" id="inicio" type="submit" value="INICIO"
									onMouseover="this.style.color='#ffb320'"
									onMouseout="this.style.color='white'"
									style="border: none; background: none; color: white; padding: 10px 5px; font-family: 'Roboto', sans-serif; font-size: 16px; font-weight: bolder;">
							</form>
					</a></li>
					<li><a href="juegos.jsp">JUEGOS</a></li>
					<li><a href="noticias.jsp">NOTICIAS</a></li>
					<li><a href="contacto.jsp">CONTACTO</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- Header section end -->


	<!-- Latest news section -->
	<div class="latest-news-section">
		<div class="ln-title">¡ÚLTIMAS NOTICIAS!</div>
		<div class="news-ticker">
			<div class="news-ticker-contant">
				<div class="nt-item">
					<span class="new">Noticias</span>Qué queda por comprar en la
					industria del videojuego: así está el panorama tras la ola de
					adquisiciones.
				</div>
				<div class="nt-item">
					<span class="strategy">Estrategia</span>Gwent, el juego de cartas
					de The Witcher, recibirá a finales de 2022 una nueva entrega
					independiente para un solo jugador.
				</div>
				<div class="nt-item">
					<span class="racing">Racing</span>Playstation mantiene la esperanza
					de Gran Turismo 7, ¿necesitaré dar el salto a la nueva generación?
				</div>
			</div>
		</div>
	</div>
	<!-- Latest news section end -->

	<!-- Page section -->
	<section class="page-section single-blog-page spad">
		<div class="container">
		<form action="../rdyController?action=insertarJuego" method="post" class="form-control" id="formInsertar" enctype='multipart/form-data'
				style="border: 0px; width: 1026px; height: 1300px;"
				style="width: 500px; height: 400px">
			
				<div class="row">
					<div class="col-lg-8">
						<h2 style="margin-bottom: 50px;">INSERTAR JUEGO</h2>
						<div class="blog-content">
							Título: <input
								type="text" name="nombre" maxlength="50" class="form-control"
								style="margin-bottom: 20px;height: 40px;"
								required /> 
							Año:		<br>						
								<input type="text" class="form-control"  id="anio" name="anio" style="width: 64px;height: 40px;" autocomplete="off"/>
								<script type="text/javascript">
								 $("#anio").datepicker({
							    	    format: "yyyy",
							    	    viewMode: "years", 
							    	    minViewMode: "years",
							    	    autoclose:true //to close picker once year is selected
							    	});</script>
  								<br>
								
								
							Plataforma: <br>
								 <select name="plataforma_id" id="plataforma_id" required style="height: 37px; width: 202px; margin-bottom: 20px;margin-top: 5px;">
				                    <option value="1"> XBOX</option>
				                    <option value="2"> PLAYSTATION</option>
				                    <option value="3"> NINTENDO</option>
				                    <option value="4"> PC</option>
				                </select> <br>
							Exclusivo:<br>
								 <select name="exclusivo" id="exclusivo" required style="height: 37px; width: 202px; margin-bottom: 20px;margin-top: 5px;">
				                    <option value="0">NO</option>
				                    <option value="1">SÍ</option>
				                </select> <br>
							Características:
							<textarea class="form-control" maxlength="1000" minlength="50"
								name="caracteristicas"
								style="overflow: hidden; height: 260px; resize: none" required></textarea>

							<h3 style="margin-bottom: 20px; margin-top: 50px;">Imágenes
								del juego</h3>
							
							<p style="margin-bottom: 5px;margin-top: 20px; font-family: 'Roboto';font-size: initial;">Imágen de portada:</p>
							<input type="file" id="foto_portada" name="foto_portada" style="height: 50px;"/>
							<br>
							<p style="margin-bottom: 5px;margin-top: 20px; font-family: 'Roboto';font-size: initial;">Imágen juego 1:</p>
							<input type="file" id="foto_juego1" name="foto_juego1" style="height: 50px;"/>
							<br>
							<p style="margin-bottom: 5px;margin-top: 20px; font-family: 'Roboto';font-size: initial;">Imágen juego 2:</p>
							<input type="file" style="margin-bottom: 50px; height: 50px;" id="foto_juego2" name="foto_juego2"/>

						</div>

							
			</div>
			
			</div>
			<div class="col-lg-8">

							<input type="button" onclick="aceptarCambios()" value="Guardar" style="margin-top: 20px;" class="btn btn-primary btn-lg" /> 
							<a href="juegos.jsp" class="btn btn-primary btn-lg"
								style="margin-top: 20px; margin-left: 10px; background: red; border-color: red; width: 105px;">
							Volver</a>

						</div>	
		</form>
		</div>
	</section>
	<!-- Page section end -->


	<!-- Footer top section -->
	<section class="footer-top-section">
		<div class="container">
			<div class="footer-top-bg">
				<img src="ESTILOS/principal/img/footer-top-bg.png" alt="">
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="footer-logo text-white">
						<img src="ESTILOS/login/images/logo1blancosmall.png"
							alt="logo RDY">
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="footer-widget mb-5 mb-md-0">
						<h4 class="fw-title">Últimos Posts</h4>
						<div class="latest-blog">
							<div class="lb-item">
								<div class="lb-thumb set-bg"
									data-setbg="ESTILOS/principal/img/latest-blog/1.jpg"></div>
								<div class="lb-content">
									<div class="lb-date">June 21, 2018</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing
										ipsum</p>
									<a href="#" class="lb-author">By Admin</a>
								</div>
							</div>
							<div class="lb-item">
								<div class="lb-thumb set-bg"
									data-setbg="ESTILOS/principal/img/latest-blog/2.jpg"></div>
								<div class="lb-content">
									<div class="lb-date">June 21, 2018</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing
										ipsum</p>
									<a href="#" class="lb-author">By Admin</a>
								</div>
							</div>
							<div class="lb-item">
								<div class="lb-thumb set-bg"
									data-setbg="ESTILOS/principal/img/latest-blog/3.jpg"></div>
								<div class="lb-content">
									<div class="lb-date">June 21, 2018</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing
										ipsum</p>
									<a href="#" class="lb-author">By Admin</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="footer-widget">
						<h4 class="fw-title">Top Comentarios</h4>
						<div class="top-comment">
							<div class="tc-item">
								<div class="tc-thumb set-bg"
									data-setbg="ESTILOS/principal/img/authors/1.jpg"></div>
								<div class="tc-content">
									<p>
										<a href="#">James Smith</a> <span>dice: </span> Todo perfecto,
										muy recomendable
									</p>
									<div class="tc-date">Octubre 23, 2021</div>
								</div>
							</div>
							<div class="tc-item">
								<div class="tc-thumb set-bg"
									data-setbg="ESTILOS/principal/img/authors/2.jpg"></div>
								<div class="tc-content">
									<p>
										<a href="#">Valentin Martinez</a> <span>dice: </span> Todos
										las novedades están aquí!!
									</p>
									<div class="tc-date">Enero 7, 2020</div>
								</div>
							</div>
							<div class="tc-item">
								<div class="tc-thumb set-bg"
									data-setbg="ESTILOS/principal/img/authors/3.jpg"></div>
								<div class="tc-content">
									<p>
										<a href="#">Jose Fernandez</a> <span>dice: </span> Sin duda
										una de mis paginas favv
									</p>
									<div class="tc-date">Junio 15, 2021</div>
								</div>
							</div>
							<div class="tc-item">
								<div class="tc-thumb set-bg"
									data-setbg="ESTILOS/principal/img/authors/4.jpg"></div>
								<div class="tc-content">
									<p>
										<a href="#">Julián Gonzalez</a> <span>dice: </span> Todos mis
										amigos descargamos los juegos de aqui!
									</p>
									<div class="tc-date">Febrero 21, 2021</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer top section end -->


	<!-- Footer section -->
	<footer class="footer-section">
		<div class="container">
			<ul class="footer-menu">
				<p class="copyright">
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					Todos los derechos reservados| Hecho con <i class="fa fa-heart-o"
						aria-hidden="true"></i> by Nuria
				</p>
		</div>
	</footer>
	<!-- Footer section end -->


	<!--== Javascripts & Jquery ==-->
	<script src="ESTILOS/principal/js/jquery-3.2.1.min.js"></script>
	<script src="ESTILOS/principal/js/bootstrap.min.js"></script>
	<script src="ESTILOS/principal/js/owl.carousel.min.js"></script>
	<script src="ESTILOS/principal/js/jquery.marquee.min.js"></script>
	<script src="ESTILOS/principal/js/main.js"></script>
</body>
</html>