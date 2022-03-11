<!DOCTYPE html>
<html lang="zxx">
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
			<a class="site-logo" href="index.html"> <img
				src="VISTAS/ESTILOS/login/images/logo1blancosmall.png"
				alt="logo RDY">
			</a>
			<div class="user-panel">
				Bienvenido de vuelta,
				<%=request.getParameter("usuario")%></div>
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
							The Best <span>Games</span> Out There
						</h2>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
							malesuada <br> lorem maximus mauris scelerisque, at rutrum
							nulla dictum. Ut ac ligula sapien. <br>Suspendisse cursus
							faucibus finibus.
						</p>
						<a href="#" class="site-btn">Read More</a>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg"
				data-setbg="VISTAS/ESTILOS/principal/img/supermario.jpg">
				<div class="hs-text">
					<div class="container">
						<h2>
							The Best <span>Games</span> Out There
						</h2>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
							malesuada <br> lorem maximus mauris scelerisque, at rutrum
							nulla dictum. Ut ac ligula sapien. <br>Suspendisse cursus
							faucibus finibus.
						</p>
						<a href="#" class="site-btn">Read More</a>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg"
				data-setbg="VISTAS/ESTILOS/principal/img/slider-2.jpg">
				<div class="hs-text">
					<div class="container">
						<h2>
							The Best <span>Games</span> Out There
						</h2>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
							malesuada <br> lorem maximus mauris scelerisque, at rutrum
							nulla dictum. Ut ac ligula sapien. <br>Suspendisse cursus
							faucibus finibus.
						</p>
						<a href="#" class="site-btn">Read More</a>
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


	<!-- Feature section -->
	<section class="feature-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg"
						data-setbg="VISTAS/ESTILOS/principal/img/features/1.jpg">
						<span class="cata new">new</span>
						<div class="fi-content text-white">
							<h5>
								<a href="#">Suspendisse ut justo tem por, rutrum</a>
							</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg"
						data-setbg="VISTAS/ESTILOS/principal/img/features/2.jpg">
						<span class="cata strategy">strategy</span>
						<div class="fi-content text-white">
							<h5>
								<a href="#">Justo tempor, rutrum erat id, molestie</a>
							</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg"
						data-setbg="VISTAS/ESTILOS/principal/img/features/3.jpg">
						<span class="cata new">new</span>
						<div class="fi-content text-white">
							<h5>
								<a href="#">Nullam lacinia ex eleifend orci porttitor</a>
							</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg"
						data-setbg="VISTAS/ESTILOS/principal/img/features/4.jpg">
						<span class="cata racing">racing</span>
						<div class="fi-content text-white">
							<h5>
								<a href="#">Lacinia ex eleifend orci suscipit</a>
							</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Feature section end -->


	<!-- Recent game section  -->
	<section class="recent-game-section spad set-bg"
		data-setbg="VISTAS/ESTILOS/principal/img/recent-game-bg.png">
		<div class="container">
			<div class="section-title">
				<div class="cata new">new</div>
				<h2>Recent Games</h2>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="recent-game-item">
						<div class="rgi-thumb set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/recent-game/1.jpg">
							<div class="cata new">new</div>
						</div>
						<div class="rgi-content">
							<h5>Suspendisse ut justo tem por, rutrum</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum
								dolor sit amet, consectetur elit.</p>
							<a href="#" class="comment">3 Comments</a>
							<div class="rgi-extra">
								<div class="rgi-star">
									<img src="VISTAS/ESTILOS/principal/img/icons/star.png" alt="">
								</div>
								<div class="rgi-heart">
									<img src="VISTAS/ESTILOS/principal/img/icons/heart.png" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="recent-game-item">
						<div class="rgi-thumb set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/recent-game/2.jpg">
							<div class="cata racing">racing</div>
						</div>
						<div class="rgi-content">
							<h5>Susce pulvinar metus nulla, vel facilisis sem</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum
								dolor sit amet, consectetur elit.</p>
							<a href="#" class="comment">3 Comments</a>
							<div class="rgi-extra">
								<div class="rgi-star">
									<img src="VISTAS/ESTILOS/principal/img/icons/star.png" alt="">
								</div>
								<div class="rgi-heart">
									<img src="VISTAS/ESTILOS/principal/img/icons/heart.png" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="recent-game-item">
						<div class="rgi-thumb set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/recent-game/3.jpg">
							<div class="cata adventure">Adventure</div>
						</div>
						<div class="rgi-content">
							<h5>Suspendisse ut justo tem por, rutrum</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum
								dolor sit amet, consectetur elit.</p>
							<a href="#" class="comment">3 Comments</a>
							<div class="rgi-extra">
								<div class="rgi-star">
									<img src="VISTAS/ESTILOS/principal/img/icons/star.png" alt="">
								</div>
								<div class="rgi-heart">
									<img src="VISTAS/ESTILOS/principal/img/icons/heart.png" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Recent game section end -->


	<!-- Tournaments section -->
	<section class="tournaments-section spad">
		<div class="container">
			<div class="tournament-title">Tournaments</div>
			<div class="row">
				<div class="col-md-6">
					<div class="tournament-item mb-4 mb-lg-0">
						<div class="ti-notic">Premium Tournament</div>
						<div class="ti-content">
							<div class="ti-thumb set-bg"
								data-setbg="VISTAS/ESTILOS/principal/img/tournament/1.jpg"></div>
							<div class="ti-text">
								<h4>World Of WarCraft</h4>
								<ul>
									<li><span>Tournament Beggins:</span> June 20, 2018</li>
									<li><span>Tounament Ends:</span> July 01, 2018</li>
									<li><span>Participants:</span> 10 teams</li>
									<li><span>Tournament Author:</span> Admin</li>
								</ul>
								<p>
									<span>Prizes:</span> 1st place $2000, 2nd place: $1000, 3rd
									place: $500
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="tournament-item">
						<div class="ti-notic">Premium Tournament</div>
						<div class="ti-content">
							<div class="ti-thumb set-bg"
								data-setbg="VISTAS/ESTILOS/principal/img/tournament/2.jpg"></div>
							<div class="ti-text">
								<h4>DOOM</h4>
								<ul>
									<li><span>Tournament Beggins:</span> June 20, 2018</li>
									<li><span>Tounament Ends:</span> July 01, 2018</li>
									<li><span>Participants:</span> 10 teams</li>
									<li><span>Tournament Author:</span> Admin</li>
								</ul>
								<p>
									<span>Prizes:</span> 1st place $2000, 2nd place: $1000, 3rd
									place: $500
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Tournaments section bg -->


	<!-- Review section -->
	<section class="review-section spad set-bg"
		data-setbg="VISTAS/ESTILOS/principal/img/review-bg.png">
		<div class="container">
			<div class="section-title">
				<div class="cata new">new</div>
				<h2>Recent Reviews</h2>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div class="review-cover set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/review/1.jpg">
							<div class="score yellow">9.3</div>
						</div>
						<div class="review-text">
							<h5>Assasin’’s Creed</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum
								dolor sit ame.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div class="review-cover set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/review/2.jpg">
							<div class="score purple">9.5</div>
						</div>
						<div class="review-text">
							<h5>Doom</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum
								dolor sit ame.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div class="review-cover set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/review/3.jpg">
							<div class="score green">9.1</div>
						</div>
						<div class="review-text">
							<h5>Overwatch</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum
								dolor sit ame.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div class="review-cover set-bg"
							data-setbg="VISTAS/ESTILOS/principal/img/review/4.jpg">
							<div class="score pink">9.7</div>
						</div>
						<div class="review-text">
							<h5>GTA</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum
								dolor sit ame.</p>
						</div>
					</div>
				</div>
			</div>
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