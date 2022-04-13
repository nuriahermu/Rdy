<!DOCTYPE html>
<%@page import="java.util.Base64"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.JFrame"%>
<%@page import="java.sql.*"%>
<html lang="es">
<head>
<title>Rdy</title>
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
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/bootstrap.min.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/font-awesome.min.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/owl.carousel.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/style.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/animate.css" />
<link href="VISTAS/ESTILOS/principal/css/popup.css" rel="stylesheet" type="text/css" />     

<link
	href="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/alertify.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js"></script>
   
<script type="text/javascript">

	$(document).ready(function () {
		if($("#id_comentario").val() == undefined){
			$("#noHay").show();
		}else{
			$("#noHay").hide();
		}
	});
	
	function aceptarCambios() {
		event.preventDefault();
		alertify.confirm("¿Estás seguro que quiere realizar estos cambios?",
				function() {
					event.preventDefault();
					$('#formEditar').submit();

				}, function() {
					event.preventDefault();
					alertify.error('¡Cancelado!');
				});
	}
	
	function eliminarComentario(autor, id) {
		event.preventDefault();
		alertify.confirm("¿Estás seguro que quiere eliminar el comentario de "+autor+"?",
				function() {
					event.preventDefault();
					$("#id_comentario").val(id);	
					$('#formEliminarComentario').submit();

				}, function() {
					event.preventDefault();
					alertify.error('¡Cancelado!');
				});
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
				src="VISTAS/ESTILOS/login/images/logo1blancosmall.png" alt="logo RDY">
			</a>
			<div class="user-panel" style="text-align: center;">
				Hola,
				${usuario.usuario}
				<div>
					<a href="VISTAS/perfil.jsp" style="font-size: 17px;">Acceder a mi cuenta</a>
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
					<form action="rdyController?action=inicio" method="post">
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

	<!-- Page section -->
	<section class="page-section single-blog-page spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
				<h2 style="margin-bottom: 50px;">EDICIÓN DE NOTICIA</h2>
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
						ps = con.prepareStatement("select * from blog where id=" + id);
						rs = ps.executeQuery();
						while (rs.next()) {
							byte[] imgData = rs.getBytes("imagen"); 
				            rs.getString("titulo");

				            String encode = Base64.getEncoder().encodeToString(imgData);
				            request.setAttribute("imgBase", encode);
						%>
						<form action="rdyController?action=editarBlog" method="post" class="form-control" style="border:0px; width: 1026px;height: auto;"
							style="width: 500px; height: 400px" enctype='multipart/form-data' id="formEditar">
					<img src="data:image/jpeg;base64,${imgBase}" alt="<%=rs.getString("titulo")%>" />
					<br><br><br>

					 ID: 
					 <input type="text" name="id" readonly style="margin-bottom: 20px;width: 76px;" class="form-control" value="<%= rs.getInt("id")%>" required/>
                 	Título:	
                 	<input type="text" name="titulo" maxlength="50" class="form-control" style="margin-bottom: 20px;" value="<%= rs.getString("titulo")%>" required/>
                 	URL Youtube:
                 	<input type="text" name="youtube" class="form-control" style="margin-bottom: 20px;" value="<%= rs.getString("youtube")%>" required/>
                 	Descripción:	
                 	<textarea class="form-control" maxlength="1000" name="descripcion" style="overflow: hidden; height: 260px; resize: none" required>
                 	<%= rs.getString("descripcion")%>
                 	</textarea>
                 	<br>
					Cambiar imágen de la noticia:
					<br>
					<input type="file" id="imagen_mod" name="imagen_mod"
								style="height: 50px;" /> <br>
                 	
                 		
                 	
                 	 <input type="button" onclick="aceptarCambios()" value="Guardar" style="margin-top: 20px;" class="btn btn-primary btn-lg"/>					
                 	 <a href="VISTAS/noticias.jsp" class="btn btn-primary btn-lg" style="margin-top: 20px;margin-left: 10px; background: red;border-color: red; width: 105px;">Volver</a>

						</form>
						<%
						}
						
						rs.close();
						ps.close();
						%>

					</div>
				</div>
			</div>
		</div>
	</section>
	<section style="padding-left: 370px; margin-top: auto;">
	<form enctype='multipart/form-data' id="formEliminarComentario" action="rdyController?action=eliminarComentarioBlog" method="post">
		<div class="col-lg-12">
			<!-- COMENTARIOS -->
			<div class="comment-form-warp">
				<h4 class="widget-title" style="margin-bottom: 20px;">Comentarios
					asociados</h4>
				<p id="noHay">No hay comentarios</p>
				<%
				PreparedStatement ps2;
				ResultSet rs2;
				ps2 = con.prepareStatement("select * from blog_comentario where id_blog=" + id);
				rs2 = ps2.executeQuery();

				while (rs2.next()) {
				%>
				<div class="latest-blog">
					<div class="row">
						<div class="col-md-2">

							<div class="lb-item">
								<div class="lb-thumb set-bg" style="width: 63px; height: 63px;"
									data-setbg="VISTAS/ESTILOS/principal/img/latest-blog/avatarAnonimo.jpg"></div>
								<div class="lb-content">
									<input hidden="id_comentario" name="id_comentario" id="id_comentario" value='<%=rs2.getInt("id")%>'/>
									<input hidden="id_blog" name="id_blog" id="id_blog" value='<%=rs2.getInt("id_blog")%>'/>
									<p style="color: black;"><%=rs2.getString("mensaje")%></p>
									<a href="#" class="lb-author" style="color: black;">Por: <%=rs2.getString("nombre")%></a>
								</div>
							</div>

						</div>
						<div class="col-md-3">
							<div class="lb-content">
								<button type="button"
									onclick="javascript:eliminarComentario('<%=rs2.getString("nombre")%>', '<%=rs2.getString("id")%>')"
									style="cursor: pointer; background-image: url(VISTAS/ESTILOS/principal/img/borrarComentario.png); border: none; background-repeat: no-repeat; width: 50px; height: 48px; background-size: contain; mix-blend-mode: hard-light;"></button>
							</div>

						</div>
					</div>
				</div>
				<%
				}
				rs2.close();
				ps2.close();
				%>
			</div>
		</div>
		</form>
	</section>
	<!-- Page section end -->


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
		</div>
	</footer>
	<!-- Footer section end -->


	<!--== Javascripts & Jquery ==-->
	<script src="VISTAS/ESTILOS/principal/js/jquery-3.2.1.min.js"></script>
	<script src="VISTAS/ESTILOS/principal/js/bootstrap.min.js"></script>
	<script src="VISTAS/ESTILOS/principal/js/owl.carousel.min.js"></script>
	<script src="VISTAS/ESTILOS/principal/js/jquery.marquee.min.js"></script>
	<script src="VISTAS/ESTILOS/principal/js/main.js"></script>	

</body>
</html>

