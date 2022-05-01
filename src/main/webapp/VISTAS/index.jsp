<!DOCTYPE html>
<%@page import="javax.sql.rowset.serial.SerialBlob"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html lang="es">
<head>
<title>RDY</title>
<meta charset="UTF-8">
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
<link rel="stylesheet"
	href="VISTAS/ESTILOS/principal/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="VISTAS/ESTILOS/principal/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="VISTAS/ESTILOS/principal/css/owl.carousel.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/style.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/animate.css" />

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
				src="VISTAS/ESTILOS/login/images/logo1blancosmall.png"
				alt="logo RDY">
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
			<nav class="main-menu" style="margin-right: 350px;">
				<ul>
					<li><a href="VISTAS/juegos.jsp">JUEGOS</a></li>
					<li><a href="VISTAS/noticias.jsp">NOTICIAS</a></li>
					<li style="margin-right: 120px;"><a href="VISTAS/contacto.jsp">CONTACTO</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- Header section end -->


	<!-- Hero section -->
	<section class="hero-section">
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg"
				data-setbg="VISTAS/ESTILOS/principal/img/fornite.jpg">
				<div class="hs-text">
					<div class="container">
						<h2>
							La mejor plataforma de juegos
						</h2>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
							malesuada <br> lorem maximus mauris scelerisque, at rutrum
							nulla dictum. Ut ac ligula sapien. <br>Suspendisse cursus
							faucibus finibus.
						</p>
						<a href="VISTAS/juegos.jsp" class="site-btn">Ver</a>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg"
				data-setbg="VISTAS/ESTILOS/principal/img/supermario.jpg">
				<div class="hs-text">
					<div class="container">
						<h2>
							Enterate de todas las noticias antes que nadie
						</h2>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
							malesuada <br> lorem maximus mauris scelerisque, at rutrum
							nulla dictum. Ut ac ligula sapien. <br>Suspendisse cursus
							faucibus finibus.
						</p>
						<a href="VISTAS/noticias.jsp" class="site-btn">Ver</a>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg"
				data-setbg="VISTAS/ESTILOS/principal/img/slider-2.jpg">
				<div class="hs-text">
					<div class="container">
						<h2>
							&iquest;Tienes alguna duda?
						</h2>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
							malesuada <br> lorem maximus mauris scelerisque, at rutrum
							nulla dictum. Ut ac ligula sapien. <br>Suspendisse cursus
							faucibus finibus.
						</p>
						<a href="VISTAS/contacto.jsp" class="site-btn">Ver</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero section end -->


	<!-- Latest news section -->
	<div class="latest-news-section">
		<div class="ln-title">Latest News</div>
		<div class="news-ticker">
			<div class="news-ticker-contant">
				<div class="nt-item">
					<span class="new">new</span>Lorem ipsum dolor sit amet, consectetur
					adipiscing elit.
				</div>
				<div class="nt-item">
					<span class="strategy">strategy</span>Isum dolor sit amet,
					consectetur adipiscing elit.
				</div>
				<div class="nt-item">
					<span class="racing">racing</span>Isum dolor sit amet, consectetur
					adipiscing elit.
				</div>
			</div>
		</div>
	</div>
	<!-- Latest news section end -->


	<!-- Recent game section  -->
	<section class="recent-game-section spad set-bg"
		data-setbg="VISTAS/ESTILOS/principal/img/recent-game-bg.png">
		
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
					OutputStream outs;
					smt = con.createStatement();
					rs = smt.executeQuery("select * from juegos order by id desc");
					
					ArrayList<String> ids = new ArrayList<String>();
					ArrayList<String> titulos = new ArrayList<String>();
					ArrayList<String> descripciones = new ArrayList<String>();
					

					while (rs.next()) { 
						ids.add(rs.getString(1));
						titulos.add(rs.getString(2));
						descripciones.add(rs.getString(6));
					}
					
					String[] idsArr = new String[ids.size()];
					idsArr = ids.toArray(idsArr);
					
					String[] titulosArr = new String[titulos.size()];
					titulosArr = titulos.toArray(titulosArr);
					
					String[] descripcionesArr = new String[descripciones.size()];
					descripcionesArr = descripciones.toArray(descripcionesArr);					
						
				%>
		<div class="container">
			<div class="section-title">
				<h2 style="font-family: cursive;"><b></B>&Uacute;LTIMOS JUEGOS</b></h2>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="recent-game-item">
						<div class="rgi-thumb set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/novedad.png" style="height: 250px;">
						</div>
						
						<div class="rgi-content">
							<h5><%= titulosArr[0] %></h5>
							<p><%= descripcionesArr[0].substring(0, 20) %>...</p>
							<div class="rgi-extra">
								<div >
									<a href="VISTAS/pagina-juego-ver.jsp?id=<%= idsArr[0] %>" style="cursor: pointer;" class="rgi-star">
										<img src="VISTAS/ESTILOS/principal/img/icons/ver.png" alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="recent-game-item">
						<div class="rgi-thumb set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/novedad.png" style="height: 250px;">
						</div>
						<div class="rgi-content">
							<h5><%= titulosArr[1] %></h5>
							<p><%= descripcionesArr[1].substring(0, 20) %>...</p>
							<div class="rgi-extra">
								<div >
									<a href="VISTAS/pagina-juego-ver.jsp?id=<%= idsArr[1] %>" style="cursor: pointer;" class="rgi-star">
										<img src="VISTAS/ESTILOS/principal/img/icons/ver.png" alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="recent-game-item">
						<div class="rgi-thumb set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/novedad.png" style="height: 250px;">
						</div>
						<div class="rgi-content">
							<h5><%= titulosArr[2] %></h5>
							<p><%= descripcionesArr[2].substring(0, 20) %>...</p>
							<div class="rgi-extra">
								<div >
									<a href="VISTAS/pagina-juego-ver.jsp?id=<%= idsArr[2] %>" style="cursor: pointer;" class="rgi-star">
										<img src="VISTAS/ESTILOS/principal/img/icons/ver.png" alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- Recent game section end -->

	<!-- Review section -->
	<section class="review-section spad set-bg"
		data-setbg="VISTAS/ESTILOS/principal/img/review-bg.png">
		<div class="container">
			<div class="section-title">
				<h2 style="font-family: cursive;">&Uacute;LTIMAS NOTICIAS</h2>
			</div>
			<%
					smt = con.createStatement();
					rs = smt.executeQuery("select * from blog order by id desc");
					
					ArrayList<String> idsNoticias = new ArrayList<String>();
					ArrayList<String> titulosNoticias = new ArrayList<String>();
					ArrayList<String> descripcionesNoticias = new ArrayList<String>();
					

					while (rs.next()) { 
						idsNoticias.add(rs.getString(1));
						titulosNoticias.add(rs.getString(2));
						descripcionesNoticias.add(rs.getString(3));
					}
					
					String[] idsArrNoticias = new String[idsNoticias.size()];
					idsArrNoticias = idsNoticias.toArray(idsArrNoticias);
					
					String[] titulosArrNoticias = new String[titulosNoticias.size()];
					titulosArrNoticias = titulosNoticias.toArray(titulosArrNoticias);
					
					String[] descripcionesArrNoticias = new String[descripcionesNoticias.size()];
					descripcionesArrNoticias = descripcionesNoticias.toArray(descripcionesArrNoticias);					
						
				%>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div class="review-cover set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/review/1.jpg">
						</div>
						<div class="review-text">
							<h5><%= titulosArrNoticias[0] %></h5>
							<p><%= descripcionesArrNoticias[0].trim().substring(0, 50) %>...</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div class="review-cover set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/review/2.jpg">
						</div>
						<div class="review-text">
							<h5><%= titulosArrNoticias[1] %></h5>
							<p><%=  descripcionesArrNoticias[1].trim().substring(0, 50) %>...</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div class="review-cover set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/review/3.jpg">
						</div>
						<div class="review-text">
							<h5><%= titulosArrNoticias[2] %></h5>
							<p><%= descripcionesArrNoticias[2].trim().substring(0, 50) %>...</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6" style="background-color: white;">
					
						<div class="review-text">
							<h5><%= titulosArrNoticias[3] %></h5>
							<p><%= descripcionesArrNoticias[3].trim().substring(0, 50) %>...</p>
						</div>
					</div>
				</div>
			</div>
			<%
				rs.close();
			%>
		</div>
	</section>
	<!-- Review section end -->


	<!-- Footer top section -->
	<section class="footer-top-section">
		<div class="container">
			<div class="footer-top-bg">
				<img src="VISTAS/ESTILOS/principal/img/footer-top-bg.png" alt="">
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="footer-logo text-white">
						<img src="VISTAS/ESTILOS/login/images/logo1blancosmall.png"
							alt="logo RDY">
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="footer-widget mb-5 mb-md-0">
						<h4 class="fw-title">Últimos Posts</h4>
						<div class="latest-blog">
							<div class="lb-item">
								<div class="lb-thumb set-bg"
									data-setbg="VISTAS/ESTILOS/principal/img/latest-blog/1.jpg"></div>
								<div class="lb-content">
									<div class="lb-date">June 21, 2018</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing
										ipsum</p>
									<a href="#" class="lb-author">By Admin</a>
								</div>
							</div>
							<div class="lb-item">
								<div class="lb-thumb set-bg"
									data-setbg="VISTAS/ESTILOS/principal/img/latest-blog/2.jpg"></div>
								<div class="lb-content">
									<div class="lb-date">June 21, 2018</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing
										ipsum</p>
									<a href="#" class="lb-author">By Admin</a>
								</div>
							</div>
							<div class="lb-item">
								<div class="lb-thumb set-bg"
									data-setbg="VISTAS/ESTILOS/principal/img/latest-blog/3.jpg"></div>
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
									data-setbg="VISTAS/ESTILOS/principal/img/authors/1.jpg"></div>
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
									data-setbg="VISTAS/ESTILOS/principal/img/authors/2.jpg"></div>
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
									data-setbg="VISTAS/ESTILOS/principal/img/authors/3.jpg"></div>
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
									data-setbg="VISTAS/ESTILOS/principal/img/authors/4.jpg"></div>
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