<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/alertify.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>

<script type="text/javascript">

	$(document).ready(function () {
		//ocultar las opciones para usuario con perfil cliente
		 if('${usuario.rol}' == 'cliente'){
			 $('#espacioBuscar').hide();
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
			<a class="site-logo"> <img
				src="ESTILOS/login/images/logo1blancosmall.png" alt="logo RDY">
			</a>
			<!-- <div class="user-panel-index" style="width: 80px;height: 50px;top: 65px;left: 400px;">
				<div>
					<form action="../rdyController?action=inicio" method="post">
						<input name="inicio" id="inicio" type="submit" value="INICIO"
						style="margin-top: 12px; margin-left: 10px; border: none; background: none; color: black; font-family: 'Roboto', sans-serif;">
					</form>
				</div>
			</div> -->
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
		data-setbg="ESTILOS/principal/img/fondoSocio.jpg">
		<div class="pi-content">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-6 text-black">
						<h2>Zona de socios</h2>
						<p>Tu informaci?n de socio <br> ?No recuerdas tu clave? M?rala y ap?ntala
						<br>?Has descargado alg?n juego? Aqu? tienes todo tu historial</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page info section -->


	<!-- Page section -->
	<section class="page-section spad contact-page" style="padding-top: 0px;">
		<div class="row"  style="margin-right: 0px;">
			<div class="col-lg-1 mb-5 mb-lg-0" style="margin-left: 150px;"></div>
			<div class="col-lg-4 mb-5 mb-lg-0" style="margin-top: 50px;">
				<div class="row">
					<div class="col-md-9">
					<h4 class="fw-title">Datos Personales</h4>
						<ul class="contact-info-list">
							<li><div class="cf-left">USUARIO</div>
								<div class="cf-right">${usuario.usuario}</div></li>
							<li><div class="cf-left">CLAVE</div>
								<div class="cf-right">${usuario.clave}</div></li>
							<li><div class="cf-left">ROL</div>
								<div class="cf-right">${usuario.rol}</div></li>
						</ul>
					</div>
				</div>
				
				
				<div class="widget-item" id="espacioBuscar">
						<%
							//CONECTANOD A LA BASE DE DATOS:
							Connection con5;
							String url5 = "jdbc:mysql://localhost:3306/rdy";
							String Driver5 = "com.mysql.cj.jdbc.Driver";
							String user5 = "root";
							String clave5 = "";
							Class.forName(Driver5);
							con5 = DriverManager.getConnection(url5, user5, clave5);
							PreparedStatement ps5;
							ResultSet rs5;
							String textoBuscado = request.getParameter("textoBuscar");
							
						 %>
								 <form class="search-widget" id="formBuscar">
									<input type="text" name="idUsuario" id="idUsuario" hidden="true" value="${usuario.id}"></input>
									<input type="text" placeholder="Buscar..." id="textoBuscar"  name="textoBuscar">
									<button type="submit"  >
										<i class="fa fa-search"></i>
									</button>
								</form>								
							<%
							
							if( textoBuscado != null){
																
								ps5 = con5.prepareStatement("select * from usuarios where usuario LIKE '%" +textoBuscado+"%'");
								rs5 = ps5.executeQuery();
								
								
									while (rs5.next()) {
										
										%>
										
										<p><%=rs5.getString("usuario")%> - <%=rs5.getString("clave")%> - <%=rs5.getString("rol")%> </p>
										
										<%
										
								}
										}
							
							%>
				</div>
				
				
			</div>		
	<!-- Page section end -->
					<div class="col-lg-4 col-md-7 sidebar pt-5 pt-lg-0" style="margin-top: 50px;">

					<!-- Seccion de las descargas -->
					<div class="widget-item">
						<h4 class="widget-title">Descargas realizadas</h4>
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
						ResultSet rs;
						ps = con.prepareStatement("select * from usuariosjuegos where id_usuario=" + request.getParameter("idUsuario"));
						rs = ps.executeQuery();
							while (rs.next()) {
						%>
						<div class="latest-blog">
							<div class="lb-item">
								<div class="lb-content" style="padding-left: 0px;">
									<div class="lb-date"><%=rs.getString("fecha")%></div>
									
									<%
										//CONECTANOD A LA BASE DE DATOS:
										Connection con2;
										String url2 = "jdbc:mysql://localhost:3306/rdy";
										String Driver2 = "com.mysql.cj.jdbc.Driver";
										String user2 = "root";
										String clave2 = "";
										Class.forName(Driver2);
										con2 = DriverManager.getConnection(url2, user2, clave2);
										PreparedStatement ps2;
										ResultSet rs2;
										ps2 = con2.prepareStatement("select * from juegos where id=" + rs.getInt("id_juego"));
										rs2= ps2.executeQuery();
											while (rs2.next()) {
									%>
									<%
											//CONECTANOD A LA BASE DE DATOS:
											Connection con3;
											String url3 = "jdbc:mysql://localhost:3306/rdy";
											String Driver3 = "com.mysql.cj.jdbc.Driver";
											String user3 = "root";
											String clave3 = "";
											Class.forName(Driver3);
											con3 = DriverManager.getConnection(url3, user3, clave3);
											PreparedStatement ps3;
											ResultSet rs3;
											ps3 = con3.prepareStatement("select * from plataformas where id=" + rs2.getInt("plataforma_id"));
											rs3= ps3.executeQuery();
												while (rs3.next()) {
									%>
										<p><%=rs2.getString("nombre")%> - <%=rs3.getString("nombre")%> </p>
									<%
										}
									}
									%>
								</div>
							</div>							
						</div>
						<%
						}
						%>
					</div>
					
					
				  </div>
			</div>
</section>
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