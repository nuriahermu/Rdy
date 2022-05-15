<%@page import="java.sql.*"%>
<%@page import="ModeloBBDD.BlogDAO"%>
<%@page import="Modelo.Blog"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<title>Rdy</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="RDY portal de videojuegos">
<meta name="keywords" content="rdy, juegos, creativo, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="VISTAS/ESTILOS/principal/img/palanca-de-mando.png" rel="shortcut icon"/>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/bootstrap.min.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/font-awesome.min.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/owl.carousel.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/style.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/animate.css" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/alertify.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>


<script type="text/javascript">
$(document).ready(function () {

	//ocultar las opciones para usuario con perfil cliente
	 if('${usuario.rol}' == 'cliente'){
		 $('#insertarNoticia').hide();
		 for (let el of document.querySelectorAll('.opcionAdmin')) el.style.display = 'none';
		 $('#editarNoticia').hide();
		 $('#eliminarNoticia').hide();
	} 
	
});
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
				src="VISTAS/ESTILOS/login/images/logo1blancosmall.png" alt="logo RDY">
			</a>
			<div class="user-panel" style="text-align: center;">
				Hola,
				${usuario.usuario}
				<div>
					<a href="VISTAS/perfil.jsp?idUsuario=${usuario.id}" style="font-size: 17px;">Acceder a mi cuenta</a>
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
					<li><a href="VISTAS/juegos.jsp">JUEGOS</a></li>
					<li><a href="VISTAS/noticias.jsp">NOTICIAS</a></li>
					<li><a href="VISTAS/contacto.jsp">CONTACTO</a></li>
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


	<!-- Page info section -->
	<section class="page-info-section set-bg"
		data-setbg="VISTAS/ESTILOS/principal/img/page-top-bg/1.jpg">
		<div class="pi-content">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-6 text-white">
						<h2>NOTICIAS</h2>
						<p>Enterate de las últimas noticias antes que nadie.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page info section -->


	<!-- Page section -->
	<section class="page-section recent-game-page spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
						<div class="col-md-12">
							<div class="row" style="margin-right: 0px;" name="insertarNoticia" id="insertarNoticia">
								<div class="col-md-4" style="margin-bottom: 20px;">
								 <a href="pagina-blog-insertar.jsp">
									<div class="user-panel" style="background: #4ecf0c;">
										<input type="button" value="INSERTAR NOTICIA"
										style="margin-top: 5px; border: none; background: none; color: black; font-family: 'Roboto', sans-serif;">
									</div>
								 <a/>
								</div>
							</div>
							<div class="recent-game-item">
								<div class="col-md-12">
									<div class="recent-game-item" style="width: 1100px;">
										<hr>
										<div class="rgi-content">
											<%
												//CONECTANOD A LA BASE DE DATOS:
									            Connection con;
									            String url = "jdbc:mysql://localhost:3306/rdy";
									            String Driver = "com.mysql.cj.jdbc.Driver";
									            String user = "root";
									            String clave = "";
									            Class.forName(Driver);
									            con = DriverManager.getConnection(url, user, clave);
									            PreparedStatement ps;
									            Statement smt;
									            ResultSet rs;
									            smt = con.createStatement();
									            rs = smt.executeQuery("select * from blog");
												
				                           		 while (rs.next()) {
				                        	%>

											<h5><%= rs.getString("titulo")%></h5>
											<p><%= rs.getString("descripcion")%></p>
											
											<span class="opcionAdmin">
											<a href="VISTAS/pagina-blog-editar.jsp?id=<%= rs.getInt("id")%>" id="editarNoticia" class="btn btn-primary" style=" margin-bottom: 30px;">Editar</a>
                                			<a href="VISTAS/pagina-blog-eliminar.jsp?id=<%= rs.getInt("id")%>" id="eliminarNoticia" class="btn btn-danger" style=" margin-bottom: 30px;">Eliminar</a>
                                            </span>
                                            <a href="VISTAS/pagina-blog.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320">Leer más</a>
                                
											
											<%} %>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page section end -->


	<!-- Footer section -->
	<footer class="footer-section">
		<div class="container">
		<img src="VISTAS/ESTILOS/login/images/logo1blancosmall.png"
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
	<script src="VISTAS/ESTILOS/principal/js/jquery-3.2.1.min.js"></script>
	<script src="VISTAS/ESTILOS/principal/js/bootstrap.min.js"></script>
	<script src="VISTAS/ESTILOS/principal/js/owl.carousel.min.js"></script>
	<script src="VISTAS/ESTILOS/principal/js/jquery.marquee.min.js"></script>
	<script src="VISTAS/ESTILOS/principal/js/main.js"></script>
</body>
</html>