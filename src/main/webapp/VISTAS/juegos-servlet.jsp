<!DOCTYPE html>
<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<html lang="es">
<head>
<title>Rdy</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="RDY portal de videojuegos">
<meta name="keywords" content="rdy, juegos, creativo, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link src="VISTAS/ESTILOS/principal/img/palanca-de-mando.png"
	rel="shortcut icon" />

<!-- Google Fonts -->
<link
	href="VISTAS/https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/bootstrap.min2.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/font-awesome.min.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/owl.carousel.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/style.css" />
<link rel="stylesheet" href="VISTAS/ESTILOS/principal/css/animate.css" />

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
	 
	 
	/*  $(document).ready(function() {
			$('#descargar').click(function(event) {
				var nombreVar = $('#nombre').val();
				var apellidoVar = $('#apellido').val();
				var edadVar = $('#edad').val();
				// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
				$.post('ActionServlet', {
					nombre : nombreVar,
					apellido: apellidoVar,
					edad: edadVar
				}, function(responseText) {
					$('#tabla').html(responseText);
				});
			});
		}); */
	 
	 
	 function confirmarDescarga(nombre, id) {
		event.preventDefault();  //evitar recarga de pagina
		alertify.confirm("¿Estás seguro que quieres decargar "+nombre+" ?",
				  function() {
			 		event.preventDefault();
			 		
			 		//insertar en la tabla

			 		
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
					  
					  
					  document.formdescargar.submit();
					  					  
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


	<!-- Page info section -->
	<section class="page-info-section set-bg"
		data-setbg="VISTAS/ESTILOS/principal/img/mujeres-gamer.png">
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
	<section class="page-section community-page set-bg" style="background: #f5a00454;">
		<div class="community-warp spad" style="background: antiquewhite;">
		
		<div class="row" style="margin-right: 0px;">
			<div class="col-md-3" style="margin-bottom: 20px;">
				<div class="user-panel" >
					<input name="inicio" id="inicio" type="button" value="VER TODOS" onclick="filtroTodos();"
					style="cursor: pointer; margin-top: 5px; border: none; background: none; color: black; font-family: 'Roboto', sans-serif;">
				</div>
			</div>
		</div>

			<div class="container">
				<ul class="community-post-list">
					<li
						style="border: none; background: none; height: 220px; writing-mode: vertical-lr; margin-left: 20px;">
						<img src="VISTAS/ESTILOS/principal/img/logos/xbox-logo.png" alt="Xbox" onclick="filtroXbox();"
						style="cursor: pointer; width: 200px; height: 150px; margin-right: 50px; margin-left: 20px;">
						<img src="VISTAS/ESTILOS/principal/img/logos/play-logo.png" onclick="filtroPlay();"
						alt="PlayStation"
						style="cursor: pointer; width: 200px;margin-right: 50px;margin-top: 70px;"> <img
						src="VISTAS/ESTILOS/principal/img/logos/nintendo-logo.png" alt="Nintendo" onclick="filtroNintendo();"
						style="cursor: pointer; width: 200px;margin-right: 50px;margin-top: 70px;"> <img
						src="VISTAS/ESTILOS/principal/img/logos/pc-logo.png" alt="PC" onclick="filtroPC();"
						style="cursor: pointer; width: 200px; height: 150px;">
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
					rs = smt.executeQuery("select * from juegos order by id DESC");
					OutputStream oImage;
					while (rs.next()) {
						
						byte[] imgData = rs.getBytes("foto_portada"); // blob field 
			            request.setAttribute("rvi", "Ravinath");
			            rs.getString("nombre");

			            String encode = Base64.getEncoder().encodeToString(imgData);
			            request.setAttribute("imgBase", encode);
						
					%>
					<li style="background: white;margin-bottom: 50px; ">
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
										<div class="rgi-content" style=" height: 105px; width: 596px; border: none;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p style="text-align: justify;"><%=rs.getString("caracteristicas")%></p>
											</div>
											<div style="position: absolute;height: 50px;width: 545px; text-align: -webkit-right;">
											
											<a href="VISTAS/pagina-juego-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px;width: 80px;">Editar</a>
                                			<a href="VISTAS/pagina-juego-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; width: 80px;">Eliminar</a>
                                            <a href="VISTAS/pagina-juego-ver.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320;  width: 80px;">Ver</a>
                                
											<form name="formdescargar" style="bottom: 0px;left: 549px;top: 0px; position: absolute;">
											<a id="descargar" href="" onclick="javascript:confirmarDescarga('<%= rs.getString("nombre")%>', <%= rs.getInt("id")%>)" class="btn btn-primary" style=" background: yellow;border-color: yellow;color: black;margin-bottom: 30px;width: 96px; font-weight: 600;">Descargar</a>
											</form>
											</div>
											
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
					<li style="background: white;">
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
										<div class="rgi-content" style=" height: 105px; width: 596px; border: none;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p style="text-align: justify;"><%=rs.getString("caracteristicas")%></p>
											</div>
											<div style="position: absolute;height: 50px;width: 545px; text-align: -webkit-right;">
											
											<a href="VISTAS/pagina-juego-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px;width: 80px;">Editar</a>
                                			<a href="VISTAS/pagina-juego-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; width: 80px;">Eliminar</a>
                                            <a href="VISTAS/pagina-juego-ver.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320;  width: 80px;">Ver</a>
                                
											<form name="formdescargar" style="bottom: 0px;left: 549px;top: 0px; position: absolute;">
											<a id="descargar" href="" onclick="javascript:confirmarDescarga('<%= rs.getString("nombre")%>', <%= rs.getInt("id")%>)" class="btn btn-primary" style=" background: yellow;border-color: yellow;color: black;margin-bottom: 30px;width: 96px; font-weight: 600;">Descargar</a>
											</form>
											</div>
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
					<li style="background: white;">
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
										<div class="rgi-content" style=" height: 105px; width: 596px; border: none;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p style="text-align: justify;"><%=rs.getString("caracteristicas")%></p>
											</div>
											<div style="position: absolute;height: 50px;width: 545px; text-align: -webkit-right;">
											
											<a href="VISTAS/pagina-juego-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px;width: 80px;">Editar</a>
                                			<a href="VISTAS/pagina-juego-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; width: 80px;">Eliminar</a>
                                            <a href="VISTAS/pagina-juego-ver.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320;  width: 80px;">Ver</a>
                                
											<form name="formdescargar" style="bottom: 0px;left: 549px;top: 0px; position: absolute;">
											<a id="descargar" href="" onclick="javascript:confirmarDescarga('<%= rs.getString("nombre")%>', <%= rs.getInt("id")%>)" class="btn btn-primary" style=" background: yellow;border-color: yellow;color: black;margin-bottom: 30px;width: 96px; font-weight: 600;">Descargar</a>
											</form>
											</div>
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
					<li style="background: white;">
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
										<div class="rgi-content" style=" height: 105px; width: 596px; border: none;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p style="text-align: justify;"><%=rs.getString("caracteristicas")%></p>
											</div>
											
											<div style="position: absolute;height: 50px;width: 545px; text-align: -webkit-right;">
											
											<a href="VISTAS/pagina-juego-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px;width: 80px;">Editar</a>
                                			<a href="VISTAS/pagina-juego-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; width: 80px;">Eliminar</a>
                                            <a href="VISTAS/pagina-juego-ver.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320;  width: 80px;">Ver</a>
                                
											<form name="formdescargar" style="bottom: 0px;left: 549px;top: 0px; position: absolute;">
											<a id="descargar" href="" onclick="javascript:confirmarDescarga('<%= rs.getString("nombre")%>', <%= rs.getInt("id")%>)" class="btn btn-primary" style=" background: yellow;border-color: yellow;color: black;margin-bottom: 30px;width: 96px; font-weight: 600;">Descargar</a>
											</form>
											</div>
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
					<li style="background: white;">
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
										<div class="rgi-content" style=" height: 105px; width: 596px; border: none;">
												<h5 style="text-align: -webkit-center;"><%=rs.getString("nombre")%></h5>
											</div>
											<div class="rgi-thumb set-bg"
												style="width: 656px;height: auto;background: white;margin-top: 25px;">
												<p style="text-align: justify;"><%=rs.getString("caracteristicas")%></p>
											</div>
											
											<div style="position: absolute;height: 50px;width: 545px; text-align: -webkit-right;">
											
											<a href="VISTAS/pagina-juego-editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary" style=" margin-bottom: 30px;width: 80px;">Editar</a>
                                			<a href="VISTAS/pagina-juego-eliminar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger" style=" margin-bottom: 30px; width: 80px;">Eliminar</a>
                                            <a href="VISTAS/pagina-juego-ver.jsp?id=<%= rs.getInt("id")%>" class="btn" style="color: white; margin-bottom: 30px; background: #ffb320;  width: 80px;">Ver</a>
                                
											<form name="formdescargar" style="bottom: 0px;left: 549px;top: 0px; position: absolute;">
											<a id="descargar" href="" onclick="javascript:confirmarDescarga('<%= rs.getString("nombre")%>', <%= rs.getInt("id")%>)" class="btn btn-primary" style=" background: yellow;border-color: yellow;color: black;margin-bottom: 30px;width: 96px; font-weight: 600;">Descargar</a>
											</form>
											</div>
											
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