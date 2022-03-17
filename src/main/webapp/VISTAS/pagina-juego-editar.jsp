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
<script
	src="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>


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
			<a class="site-logo" href="index.html"> <img
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
		<div class="ln-title">��LTIMAS NOTICIAS!</div>
		<div class="news-ticker">
			<div class="news-ticker-contant">
				<div class="nt-item">
					<span class="new">Noticias</span>Qu� queda por comprar en la
					industria del videojuego: as� est� el panorama tras la ola de
					adquisiciones.
				</div>
				<div class="nt-item">
					<span class="strategy">Estrategia</span>Gwent, el juego de cartas
					de The Witcher, recibir� a finales de 2022 una nueva entrega
					independiente para un solo jugador.
				</div>
				<div class="nt-item">
					<span class="racing">Racing</span>Playstation mantiene la esperanza
					de Gran Turismo 7, �necesitar� dar el salto a la nueva generaci�n?
				</div>
			</div>
		</div>
	</div>
	<!-- Latest news section end -->

	<!-- Page section -->
	<section class="page-section single-blog-page spad">
		<div class="container">
		<form action="" method="post" class="form-control"
				style="border: 0px; width: 1026px; height: 1300px;"
				style="width: 500px; height: 400px">
			
				<div class="row">
					<div class="col-lg-8">
						<h2 style="margin-bottom: 50px;">EDICI�N DE JUEGO</h2>
						<div class="blog-content">
						
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
							int id = Integer.parseInt(request.getParameter("id"));
							ps = con.prepareStatement("select * from juegos where id=" + id);
							rs = ps.executeQuery();
							while (rs.next()) {
								byte[] imgData = rs.getBytes("foto_portada");
								byte[] imgData2 = rs.getBytes("foto_juego1");
								byte[] imgData3 = rs.getBytes("foto_juego2");
								rs.getString("nombre");

								String encode = Base64.getEncoder().encodeToString(imgData);
								request.setAttribute("imgBase", encode);
							%>



							ID: <input type="text" name="id" readonly
								style="margin-bottom: 20px; width: 76px;" class="form-control"
								value="<%=rs.getInt("id")%>" required /> 
							T�tulo: <input
								type="text" name="nombre" maxlength="50" class="form-control"
								style="margin-bottom: 20px;"
								value="<%=rs.getString("nombre")%>" required /> 
							A�o: <input
								type="text" name="anio" maxlength="50" class="form-control"
								style="margin-bottom: 20px;" value="<%=rs.getInt("anio")%>"
								required /> 
							Plataforma: <input type="text" name="plataforma_id"
								maxlength="50" class="form-control" style="margin-bottom: 20px;"
								value="<%=rs.getInt("plataforma_id")%>" required /> 
							Exclusivo:
							<input type="text" name="exclusivo" maxlength="50"
								class="form-control" style="margin-bottom: 20px;"
								value="<%=rs.getInt("exclusivo")%>" required />


							Caracter�sticas:
							<textarea class="form-control" maxlength="1000"
								name="caracteristicas"
								style="overflow: hidden; height: 260px; resize: none" required>
	                 		<%=rs.getString("caracteristicas")%>
	                 	</textarea>

							<%
							if (imgData2 != null || imgData3 != null) {
							%>
							<h3 style="margin-bottom: 20px; margin-top: 50px;">Im�genes
								del juego</h3>
							<%
							if (imgData2 != null) {
								String encode2 = Base64.getEncoder().encodeToString(imgData2);
								request.setAttribute("imgBase2", encode2);
							%>
							<img src="data:image/jpeg;base64,${imgBase2}"
								alt="<%=rs.getString("nombre")%>"
								style="width: 300px; height: 250px; margin-bottom: 60px;" />
							<%
							}
							if (imgData3 != null) {
							String encode3 = Base64.getEncoder().encodeToString(imgData3);
							request.setAttribute("imgBase3", encode3);
							%>
							<img src="data:image/jpeg;base64,${imgBase3}"
								alt="<%=rs.getString("nombre")%>"
								style="width: 300px; height: 250px; margin-bottom: 60px;" />
							<%
							}
							
							}
							%>
						</div>

						<div class="col-lg-8">

							<input type="submit" value="Guardar" style="margin-top: 20px;"
								class="btn btn-primary btn-lg" /> <a href="juegos.jsp"
								class="btn btn-primary btn-lg"
								style="margin-top: 20px; margin-left: 10px; background: red; border-color: red; width: 105px;">Volver</a>


						</div>
						
						<%
						}
						%>
					
			
		</div>
		</div>
		</form>
		</div>
	</section>
	<section style="padding-left: 100px;">
		<div class="col-lg-8">
			<!-- COMENTARIOS -->
			<div class="comment-form-warp">
				<h4 class="widget-title" style="margin-bottom: 20px;">Comentarios asociados</h4>
				<%
				PreparedStatement ps2;
				ResultSet rs2;
				ps2 = con.prepareStatement("select * from juego_comentario where id_juego=" + id);
				rs2 = ps2.executeQuery();

				if (rs2.next() == false) {
				%>
				<p>No hay comentarios</p>
				<%
				}
				while (rs2.next()) {
				%>
				<div class="latest-blog">
					<div class="lb-item">
						<div class="lb-thumb set-bg" style="width: 63px; height: 63px;"
							data-setbg="ESTILOS/principal/img/latest-blog/avatarAnonimo.jpg"></div>
						<div class="lb-content">
							<p style="color: black;"><%=rs2.getString("mensaje")%></p>
							<a href="#" class="lb-author" style="color: black;">Por: <%=rs2.getString("nombre")%></a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
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
						<h4 class="fw-title">�ltimos Posts</h4>
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
										las novedades est�n aqu�!!
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
										<a href="#">Juli�n Gonzalez</a> <span>dice: </span> Todos mis
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

<%
Connection con2;
String url2 = "jdbc:mysql://localhost:3306/rdy";
String Driver2 = "com.mysql.cj.jdbc.Driver";
String user2 = "root";
String clave2 = "";
Class.forName(Driver2);
con2 = DriverManager.getConnection(url2, user2, clave2);

	String titulo, anio, caracteristicas, plataforma, exclusivo;
	titulo = request.getParameter("nombre");
	anio = request.getParameter("anio");
	caracteristicas = request.getParameter("caracteristicas");
	plataforma = request.getParameter("plataforma_id");
	exclusivo = request.getParameter("exclusivo");
	
	if (titulo != null && anio != null && caracteristicas != null && plataforma != null && exclusivo != null) {
		ps2 = con2.prepareStatement("update juegos set nombre='" + titulo + "', anio=" + anio + ", caracteristicas='"
		+ caracteristicas + "', plataforma_id=" + plataforma + ", exclusivo=" + exclusivo + " where id=" + id);
		 response.flushBuffer();
		ps2.executeUpdate();
		response.sendRedirect("/juegos.jsp");
	}
%>