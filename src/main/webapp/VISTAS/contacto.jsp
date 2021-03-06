<!DOCTYPE html>
<html lang="es">
<head>
<title>RDY</title>
<meta charset="UTF-8">
<meta name="description" content="RDY portal de videojuegos">
<meta name="keywords" content="rdy, juegos, creativo, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="ESTILOS/principal/img/palanca-de-mando.png" rel="shortcut icon"/>

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

<link href="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/alertify.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>



<script type="text/javascript">
	function enviarMensaje() {
		event.preventDefault();
		
		if($("#nombre").val() == "" || $("#email").val() == "" || $("#asunto").val() == "" || $("#mensaje").val() == ""){
			event.preventDefault();
			alertify.error('Rellene todos los campos para enviar la consulta');
		}else{
			event.preventDefault();
			alertify.notify('?Mensaje enviado! Gracias', 'success', 5, function(){ });
		    document.getElementById('formularioMensaje').reset();
		    event.preventDefault();
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
			<a class="site-logo"> <img
				src="ESTILOS/login/images/logo1blancosmall.png" alt="logo RDY">
			</a>
			<div class="user-panel" style="text-align: center;">
				Hola,
				${usuario.usuario}
				<div>
					<a href="perfil.jsp?idUsuario=${usuario.id}" style="font-size: 17px;">Acceder a mi cuenta</a>
				</div>
			</div>
			<!-- responsive -->
			<div class="nav-switch">
				<i class="fa fa-bars"></i>
			</div>
			<!-- site menu -->
			<nav class="main-menu" style="margin-top: 50px;">
				<ul>
				<li>
				<a href="">
					<form action="../rdyController?action=inicio" method="post">
						<input name="inicio" id="inicio" type="submit" value="INICIO" onMouseover="this.style.color='#ffb320'" onMouseout="this.style.color='white'" style="border: none;background: none;color: white;padding: 10px 5px;font-family: 'Roboto', sans-serif;font-size: 16px;font-weight: bolder;">
					</form>
				</a>
				</li>
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
		<div class="ln-title">??LTIMAS NOTICIAS!</div>
		<div class="news-ticker">
			<div class="news-ticker-contant">
				<div class="nt-item">
					<span class="new">Noticias</span>Qu? queda por comprar en la
					industria del videojuego: as? est? el panorama tras la ola de
					adquisiciones.
				</div>
				<div class="nt-item">
					<span class="strategy">Estrategia</span>Gwent, el juego de cartas
					de The Witcher, recibir? a finales de 2022 una nueva entrega
					independiente para un solo jugador.
				</div>
				<div class="nt-item">
					<span class="racing">Racing</span>Playstation mantiene la esperanza
					de Gran Turismo 7, ?necesitar? dar el salto a la nueva generaci?n?
				</div>
			</div>
		</div>
	</div>
	<!-- Latest news section end -->


	<!-- Page info section -->
	<section class="page-info-section set-bg"
		data-setbg="ESTILOS/principal/img/page-top-bg/5.jpg">
		<div class="pi-content">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-6 text-white">
						<h2>Cont?ctanos</h2>
						<p>Si tiene alguna duda con alg?n producto, novedad, o
							requiere informaci?n de alguno de nuestros juegos no dude en
							ponerse en contacto con nosotros. ?Estaremos encantados de
							atenderle!</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page info section -->


	<!-- Page section -->
	<section class="page-section spad contact-page">
		<div class="container">

			<div>
				<h4>?Ven a conocernos, tambi?n disponemos de tienda f?sica!</h4>
			</div>
			<hr>
			<hr>
			<div class="row">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2987.536836034782!2d-5.746481185198511!3d41.51431079608124!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd391e3e7a69e769%3A0xa7df7f3d5c72cf99!2sGAME!5e0!3m2!1ses!2ses!4v1640716307382!5m2!1ses!2ses"
					width="600" height="450" style="border: 0;" allowfullscreen=""
					loading="lazy"></iframe>
			</div>
		</div>

		<div class="row"  style="margin-right: 0px;">
			<div class="col-lg-1 mb-5 mb-lg-0"></div>
			<div class="col-lg-4 mb-5 mb-lg-0" style="margin-top: 50px;">
				<div class="row">
					<div class="col-md-9">
						<ul class="contact-info-list">
							<li><div class="cf-left">Direcci?n</div>
								<div class="cf-right">Av. del Cardenal Cisneros, s/n,
									49023 Zamora</div></li>
							<li><div class="cf-left">Tel?fono</div>
								<div class="cf-right">+34 624 521 478</div></li>
							<li><div class="cf-left">E-mail</div>
								<div class="cf-right">hola@rdy.com</div></li>
						</ul>
					</div>
				</div>
				<div class="social-links">
					<a href="#"><i class="fa fa-pinterest"></i></a> <a href="#"><i
						class="fa fa-facebook"></i></a> <a href="#"><i
						class="fa fa-twitter"></i></a> <a href="#"><i
						class="fa fa-dribbble"></i></a> <a href="#"><i
						class="fa fa-behance"></i></a> <a href="#"><i
						class="fa fa-linkedin"></i></a>
				</div>
			</div>
			<div class="col-lg-5" style="margin-top: 50px;">
				<div class="contact-form-warp">
					<h4 class="comment-title">Env?anos un mensaje</h4>
					<form class="comment-form" id="formularioMensaje" method="" >
						<div class="row">
							<div class="col-md-6">
								<input type="text" id="nombre" placeholder="Nombre" required="required">
							</div>
							<div class="col-md-6">
								<input type="email" id="email" placeholder="Email" required="required">
							</div>
							<div class="col-lg-12">
								<input type="text" id="asunto" placeholder="Asunto" required="required">
								<textarea placeholder="Tu mensaje" id="mensaje" required="required"></textarea>
								<button class="site-btn btn-sm" onclick="enviarMensaje()">Enviar</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Page section end -->


	<!-- Footer section -->
	<footer class="footer-section">
		<div class="container">
		<img src="ESTILOS/login/images/logo1blancosmall.png"
							alt="logo RDY">
			<ul class="footer-menu">
				<p class="copyright" style="font-variant-caps: all-small-caps;margin-top: 50px;">
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					Todos los derechos reservados| Hecho con <i class="fa fa-heart-o"
						aria-hidden="true"></i> by Nuria
				</p>
			</ul>
		</div>
	</footer>
	<!-- Footer section end -->



	<!--====== Javascripts & Jquery ======-->
	<script src="ESTILOS/principal/js/jquery-3.2.1.min.js"></script>
	<script src="ESTILOS/principal/js/bootstrap.min.js"></script>
	<script src="ESTILOS/principal/js/owl.carousel.min.js"></script>
	<script src="ESTILOS/principal/js/jquery.marquee.min.js"></script>
	<script src="ESTILOS/principal/js/main.js"></script>


</body>
</html>