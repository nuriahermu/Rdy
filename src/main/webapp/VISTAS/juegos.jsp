<!DOCTYPE html>
<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<html lang="en">
<head>
<title>Rdy</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

<link href="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/alertify.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>




<script type="text/javascript">

	$(document).ready(function () {
		$('#todos_xbox').hide();
		$('#todos_play').hide();
		$('#todos_nintendo').hide();
		$('#todos_pc').hide();
	});

	function filtroTodos() {
		 document.getElementById("todos_xbox").style.display = "none";
		 document.getElementById("todos_play").style.display = "none";
		 document.getElementById("todos_nintendo").style.display = "none";
		 document.getElementById("todos_pc").style.display = "none";
		 $('#todos').show();
	}
	 function filtroXbox(){
		 document.getElementById("todos").style.display = "none";
		 document.getElementById("todos_play").style.display = "none";
		 document.getElementById("todos_nintendo").style.display = "none";
		 document.getElementById("todos_pc").style.display = "none";
		 $('#todos_xbox').show();
	 }
	 
	 function filtroPlay(){
		 document.getElementById("todos").style.display = "none";
		 document.getElementById("todos_xbox").style.display = "none";
		 document.getElementById("todos_nintendo").style.display = "none";
		 document.getElementById("todos_pc").style.display = "none";
		 $('#todos_play').show();
	 }
	
	 function filtroNintendo(){
		 document.getElementById("todos").style.display = "none";
		 document.getElementById("todos_xbox").style.display = "none";
		 document.getElementById("todos_play").style.display = "none";
		 document.getElementById("todos_pc").style.display = "none";
		 $('#todos_nintendo').show();
	 }
	 
	 function filtroPC(){
		 document.getElementById("todos").style.display = "none";
		 document.getElementById("todos_xbox").style.display = "none";
		 document.getElementById("todos_play").style.display = "none";
		 document.getElementById("todos_nintendo").style.display = "none";
		 $('#todos_pc').show();
	 }
	 
	 function confirmarDescarga(nombre) {
		event.preventDefault();  //evitar recarga de pagina
		alertify.confirm("¿Estás seguro que quieres decargar "+nombre+" ?",
				  function() {
			 		event.preventDefault();
				    alertify.success('¡Gracias por descargar!');
					 var texto = "Gracias por descargar "+nombre+". ¡Disfrutalo! Rdy";
				     var nombreArchivo = nombre+".txt";
					 var element = document.createElement('a');
					 element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(texto));
					 element.setAttribute('download', nombreArchivo);

					  element.style.display = 'none';
					  document.body.appendChild(element);

					  element.click();

					  document.body.removeChild(element);
				  },
				  function() {
					  event.preventDefault();
					  alertify.error('¡Sigue buscando!');
				  }
				);
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
			<a class="site-logo" href="index.html"> <img
				src="ESTILOS/login/images/logo1blancosmall.png" alt="logo RDY">
			</a>
			<div class="user-panel-index"
				style="width: 80px; height: 50px; top: 65px; left: 400px;">
				<div>
					<form action="../rdyController?action=inicio" method="post">
						<input name="inicio" id="inicio" type="submit" value="INICIO"
							style="margin-top: 12px; margin-left: 10px; border: none; background: none; color: black; font-family: 'Roboto', sans-serif;">
					</form>
				</div>
			</div>
			<div class="user-panel">
				Bienvenido de vuelta,
				${usuario.usuario}</div>
			<div class="user-panel" style="position: absolute; top: 75px; left: 1060px; background: yellow; border-style: inset;">
				<a href="perfil.jsp" style="font-size: 17px;">Mi cuenta</a>
			</div>
			<!-- responsive -->
			<div class="nav-switch">
				<i class="fa fa-bars"></i>
			</div>
			<!-- site menu -->
			<nav class="main-menu" style="margin-top: 50px;">
				<ul>
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


	<!-- Page info section -->
	<section class="page-info-section set-bg"
		data-setbg="ESTILOS/principal/img/mujeres-gamer.png">
		<div class="pi-content">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-6 text-white">
						<h2>Sumérgete de lleno en un mundo nuevo</h2>
						<p>¿PlayStation o Xbox? ¿Nintendo o PC? <br> No importa, los tenemos todos.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page info section -->


	<!-- Page section -->
	<section class="page-section community-page set-bg"
		data-setbg="ESTILOS/principal/img/fondo.jpg">
		<div class="community-warp spad">
		
		
		<div class="user-panel" style="width: 146px;height: 46px; position: absolute; left: 1100px; top: 760px;">
		<input name="inicio" id="inicio" type="button" value="VER TODOS" onclick="filtroTodos();"
		style="margin-top: 5px; border: none; background: none; color: black; font-family: 'Roboto', sans-serif;">
							
		</div>
		
		
		
			<div class="container">
				<ul class="community-post-list">
					<li
						style="background: white; height: 220px; writing-mode: vertical-lr; margin-left: 20px;">
						<img src="ESTILOS/principal/img/logos/Xbox-Logo.jpg" alt="Xbox" onclick="filtroXbox();"
						style="width: 200px; height: 150px; margin-right: 50px; margin-left: 20px;">
						<img src="ESTILOS/principal/img/logos/play-logo.jpg" onclick="filtroPlay();"
						alt="PlayStation"
						style="width: 200px; height: 150px; margin-right: 50px;"> <img
						src="ESTILOS/principal/img/logos/nintengo-logo.jpg" alt="Nintendo" onclick="filtroNintendo();"
						style="width: 200px; height: 200px; margin-right: 50px;"> <img
						src="ESTILOS/principal/img/logos/pc-logo.png" alt="PC" onclick="filtroPC();"
						style="width: 200px; height: 150px;">
					</li>
				
					<div id="todos">
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
					rs = smt.executeQuery("select * from juegos");
					OutputStream oImage;
					while (rs.next()) {
						
						byte[] imgData = rs.getBytes("foto_portada"); // blob field 
			            request.setAttribute("rvi", "Ravinath");
			            rs.getString("nombre");

			            String encode = Base64.getEncoder().encodeToString(imgData);
			            request.setAttribute("imgBase", encode);
						
					%>
					<li style="background: #f9eeee7a;">
						<div class="community-post">
							<div class="container">
								<div class="row">
									<div class="col-lg-4 col-md-6">
										<div class="recent-game-item">
											<div class="rgi-thumb set-bg">
											
											<div class="cata new"><%=rs.getInt("anio")%></div>
											<br>
											<img src="data:image/jpeg;base64,${imgBase}" alt="<%=rs.getString("nombre")%>" style="margin-top: 50px; height: 190px;"/>
												
											</div>
											<div>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-2">
										<div class="recent-game-item">
										<div class="rgi-content" style=" height: 105px; width: 596px; border: dashed; border-radius: 60px;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p><%=rs.getString("caracteristicas")%></p>
											</div>
											
											<a href="" onclick="confirmarDescarga('<%= rs.getString("nombre")%>')" class="btn btn-primary" style=" background: yellow;border-color: yellow;color: black;margin-bottom: 30px;position: absolute;margin-top: 20px;margin-left: 200px;width: 96px; font-weight: 600;">Descargar</a>
											<a href="pagina-blog-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;margin-left: 310px;width: 80px;">Editar</a>
                                			<a href="pagina-blog-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;left: 420px; width: 80px;">Eliminar</a>
                                            <a href="pagina-blog.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320; position: absolute; margin-left: 500px;margin-top: 20px; width: 80px;">Ver</a>
                                
											<!-- <div>											
												<div class="rgi-extra" style="position: relative;top: 30px;left: 550px;">
													<button>1</button>
													<button>2</button>
													<div class="rgi-star">
														<img src="ESTILOS/principal/img/icons/star.png" alt="">
													</div>
													<div class="rgi-heart">
														<img src="ESTILOS/principal/img/icons/heart.png" alt="">
													</div>
												</div>
											</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						</li>
						<%
						}%>
					</div>		
					
					<div id="todos_xbox">
						<%
					rs = smt.executeQuery("select * from juegos where plataforma_id = 1");
					while (rs.next()) {
						
						byte[] imgData = rs.getBytes("foto_portada"); // blob field 
			            request.setAttribute("rvi", "Ravinath");
			            rs.getString("nombre");

			            String encode = Base64.getEncoder().encodeToString(imgData);
			            request.setAttribute("imgBase", encode);
						
					%>
					<li style="background: #f9eeee7a;">
						<div class="community-post">
							<div class="container">
								<div class="row">
									<div class="col-lg-4 col-md-6">
										<div class="recent-game-item">
											<div class="rgi-thumb set-bg">
											
											<div class="cata new"><%=rs.getInt("anio")%></div>
											<br>
											<img src="data:image/jpeg;base64,${imgBase}" alt="<%=rs.getString("nombre")%>" style="margin-top: 50px; height: 190px;"/>
												
											</div>
											<div>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-2">
										<div class="recent-game-item">
										<div class="rgi-content" style=" height: 105px; width: 596px; border: dashed; border-radius: 60px;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p><%=rs.getString("caracteristicas")%></p>
											</div>
											
											<a href="pagina-blog-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;margin-left: 310px;width: 80px;">Editar</a>
                                			<a href="pagina-blog-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;left: 420px; width: 80px;">Eliminar</a>
                                            <a href="pagina-blog.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320; position: absolute; margin-left: 500px;margin-top: 20px; width: 80px;">Ver</a>
                                
											<!-- <div>											
												<div class="rgi-extra" style="position: relative;top: 30px;left: 550px;">
													<button>1</button>
													<button>2</button>
													<div class="rgi-star">
														<img src="ESTILOS/principal/img/icons/star.png" alt="">
													</div>
													<div class="rgi-heart">
														<img src="ESTILOS/principal/img/icons/heart.png" alt="">
													</div>
												</div>
											</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						</li>
						<%
						}%>
					</div>			
					
					<div id="todos_play">
						<%
					rs = smt.executeQuery("select * from juegos where plataforma_id = 2");
					while (rs.next()) {
						
						byte[] imgData = rs.getBytes("foto_portada"); // blob field 
			            request.setAttribute("rvi", "Ravinath");
			            rs.getString("nombre");

			            String encode = Base64.getEncoder().encodeToString(imgData);
			            request.setAttribute("imgBase", encode);
						
					%>
					<li style="background: #f9eeee7a;">
						<div class="community-post">
							<div class="container">
								<div class="row">
									<div class="col-lg-4 col-md-6">
										<div class="recent-game-item">
											<div class="rgi-thumb set-bg">
											
											<div class="cata new"><%=rs.getInt("anio")%></div>
											<br>
											<img src="data:image/jpeg;base64,${imgBase}" alt="<%=rs.getString("nombre")%>" style="margin-top: 50px; height: 190px;"/>
												
											</div>
											<div>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-2">
										<div class="recent-game-item">
										<div class="rgi-content" style=" height: 105px; width: 596px; border: dashed; border-radius: 60px;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p><%=rs.getString("caracteristicas")%></p>
											</div>
											
											<a href="pagina-blog-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;margin-left: 310px;width: 80px;">Editar</a>
                                			<a href="pagina-blog-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;left: 420px; width: 80px;">Eliminar</a>
                                            <a href="pagina-blog.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320; position: absolute; margin-left: 500px;margin-top: 20px; width: 80px;">Ver</a>
                                
											<!-- <div>											
												<div class="rgi-extra" style="position: relative;top: 30px;left: 550px;">
													<button>1</button>
													<button>2</button>
													<div class="rgi-star">
														<img src="ESTILOS/principal/img/icons/star.png" alt="">
													</div>
													<div class="rgi-heart">
														<img src="ESTILOS/principal/img/icons/heart.png" alt="">
													</div>
												</div>
											</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						</li>
						<%
						}%>
					</div>		
					
					<div id="todos_nintendo">
						<%
					rs = smt.executeQuery("select * from juegos where plataforma_id = 3");
					while (rs.next()) {
						
						byte[] imgData = rs.getBytes("foto_portada"); // blob field 
			            request.setAttribute("rvi", "Ravinath");
			            rs.getString("nombre");

			            String encode = Base64.getEncoder().encodeToString(imgData);
			            request.setAttribute("imgBase", encode);
						
					%>
					<li style="background: #f9eeee7a;">
						<div class="community-post">
							<div class="container">
								<div class="row">
									<div class="col-lg-4 col-md-6">
										<div class="recent-game-item">
											<div class="rgi-thumb set-bg">
											
											<div class="cata new"><%=rs.getInt("anio")%></div>
											<br>
											<img src="data:image/jpeg;base64,${imgBase}" alt="<%=rs.getString("nombre")%>" style="margin-top: 50px; height: 190px;"/>
												
											</div>
											<div>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-2">
										<div class="recent-game-item">
										<div class="rgi-content" style=" height: 105px; width: 596px; border: dashed; border-radius: 60px;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p><%=rs.getString("caracteristicas")%></p>
											</div>
											
											<a href="pagina-blog-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;margin-left: 310px;width: 80px;">Editar</a>
                                			<a href="pagina-blog-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;left: 420px; width: 80px;">Eliminar</a>
                                            <a href="pagina-blog.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320; position: absolute; margin-left: 500px;margin-top: 20px; width: 80px;">Ver</a>
                                
											<!-- <div>											
												<div class="rgi-extra" style="position: relative;top: 30px;left: 550px;">
													<button>1</button>
													<button>2</button>
													<div class="rgi-star">
														<img src="ESTILOS/principal/img/icons/star.png" alt="">
													</div>
													<div class="rgi-heart">
														<img src="ESTILOS/principal/img/icons/heart.png" alt="">
													</div>
												</div>
											</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						</li>
						<%
						}%>
					</div>				
					
					<div id="todos_pc">
						<%
					rs = smt.executeQuery("select * from juegos where plataforma_id = 4");
					while (rs.next()) {
						
						byte[] imgData = rs.getBytes("foto_portada"); // blob field 
			            request.setAttribute("rvi", "Ravinath");
			            rs.getString("nombre");

			            String encode = Base64.getEncoder().encodeToString(imgData);
			            request.setAttribute("imgBase", encode);
						
					%>
					<li style="background: #f9eeee7a;">
						<div class="community-post">
							<div class="container">
								<div class="row">
									<div class="col-lg-4 col-md-6">
										<div class="recent-game-item">
											<div class="rgi-thumb set-bg">
											
											<div class="cata new"><%=rs.getInt("anio")%></div>
											<br>
											<img src="data:image/jpeg;base64,${imgBase}" alt="<%=rs.getString("nombre")%>" style="margin-top: 50px; height: 190px;"/>
												
											</div>
											<div>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-2">
										<div class="recent-game-item">
										<div class="rgi-content" style=" height: 105px; width: 596px; border: dashed; border-radius: 60px;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p><%=rs.getString("caracteristicas")%></p>
											</div>
											
											<a href="pagina-blog-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;margin-left: 310px;width: 80px;">Editar</a>
                                			<a href="pagina-blog-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; position: absolute; margin-top: 20px;left: 420px; width: 80px;">Eliminar</a>
                                            <a href="pagina-blog.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320; position: absolute; margin-left: 500px;margin-top: 20px; width: 80px;">Ver</a>
                                
											<!-- <div>											
												<div class="rgi-extra" style="position: relative;top: 30px;left: 550px;">
													<button>1</button>
													<button>2</button>
													<div class="rgi-star">
														<img src="ESTILOS/principal/img/icons/star.png" alt="">
													</div>
													<div class="rgi-heart">
														<img src="ESTILOS/principal/img/icons/heart.png" alt="">
													</div>
												</div>
											</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						</li>
						<%
						}%>
					</div>			
								
				</ul>
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