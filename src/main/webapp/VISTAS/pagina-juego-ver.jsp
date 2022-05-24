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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(function () {
		if($("#id_comentario").val() == undefined){
			$("#noHay").show();
		}else{
			$("#noHay").hide();
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
			<div class="row">
				<div class="col-lg-8">
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
						<h2 style="margin-bottom: 50px;"><%=rs.getString("nombre")%></h2>
						<img src="data:image/jpeg;base64,${imgBase}" alt="<%=rs.getString("nombre")%>"  style="WIDTH: 550PX;"/>
						<textarea
							style="overflow: hidden; margin-top: 50px; height: 320px; width: 750px; border: none; display: block; resize: none; background-color: white;"
							disabled><%=rs.getString("caracteristicas")%></textarea>
						
							<%
							if(imgData2 != null && imgData3 != null){
							%>	
							<h3 style="margin-bottom: 20px;">Capturas del juego</h3>
								<%
								if(imgData2.length > 0){
					           	 	String encode2 = Base64.getEncoder().encodeToString(imgData2);
					            	request.setAttribute("imgBase2", encode2);
					         
								%>
									<img src="data:image/jpeg;base64,${imgBase2}" alt="<%=rs.getString("nombre")%>" style="width: 300px;height: 250px;margin-bottom: 60px;"/>
								<%
								}else
								 if(imgData3.length > 0){
						           	 	String encode3 = Base64.getEncoder().encodeToString(imgData3);
						            	request.setAttribute("imgBase3", encode3);
						           
								%>
								<img src="data:image/jpeg;base64,${imgBase3}" alt="<%=rs.getString("nombre")%>" style="width: 300px;height: 250px;margin-bottom: 60px;"/>
								<%}else{
								%>
								<p>No hay imagenes</p>
								<%}
								%>
							<%
							}
							%>
						<%
						}
						%>
					</div>
					<form class="comment-form"
						action="../rdyController?action=comentarioJuego" method="post">
						<div class="comment-form-warp">
							<h4 class="comment-title">Esribe un comentario</h4>
							<input name="id_juego" value=<%=id%> hidden="true">
							<div class="row">
								<div class="col-md-6">
									<input type="text" name="nombre" placeholder="Nombre"
										class="form-control" maxlength="15" required>
								</div>
								<div class="col-lg-12">
									<textarea placeholder="Mensaje" name="mensaje"
										class="form-control" maxlength="350" required></textarea>
									<button class="site-btn btn-sm" type="submit">Publicar</button>
									<input type="button" class="site-btn btn-sm" style="background: yellow;" value="Volver" onClick="history.go(-1);">
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- sidebar -->
				<div class="col-lg-4 col-md-7 sidebar pt-5 pt-lg-0">
					<!-- widget -->
					<div class="widget-item">
					<h4 class="widget-title">Últimos comentarios</h4>
					<p id="noHay">No hay comentarios</p>
						<%
							ps = con.prepareStatement("select * from juego_comentario where id_juego=" + id);
							rs = ps.executeQuery();
							while (rs.next()) {
						%>
						
						<div class="latest-blog">
							<div class="lb-item">
								<div class="lb-thumb set-bg" style="width: 63px; height: 63px;"
									data-setbg="ESTILOS/principal/img/latest-blog/avatarAnonimo.jpg"></div>
								<div class="lb-content">
									<input hidden="id_comentario" name="id_comentario" id="id_comentario" value='<%=rs.getInt("id")%>'/>
									<input hidden="id_juego" name="id_juego" id="id_juego" value='<%=rs.getInt("id_juego")%>'/>
									<p><%=rs.getString("mensaje")%></p>
									<a href="#" class="lb-author">Por: <%=rs.getString("nombre")%></a>
								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>
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


	<!--== Javascripts & Jquery ==-->
	<script src="ESTILOS/principal/js/jquery-3.2.1.min.js"></script>
	<script src="ESTILOS/principal/js/bootstrap.min.js"></script>
	<script src="ESTILOS/principal/js/owl.carousel.min.js"></script>
	<script src="ESTILOS/principal/js/jquery.marquee.min.js"></script>
	<script src="ESTILOS/principal/js/main.js"></script>
</body>
</html>