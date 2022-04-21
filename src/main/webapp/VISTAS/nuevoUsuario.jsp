<%-- 
    Document   : nuevoUsuario
    Created on : 11 nov. 2021, 21:36:19
    Author     : Nuria
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Rdy</title>
<link
	href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="ESTILOS/login/css/login.css">

<!--- Favicon --->
<link href="ESTILOS/principal/img/palanca-de-mando.png"
	rel="shortcut icon" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>

<script>
	function verTerminos() {
		$("#mostrarmodal").modal("show");
	}
</script>
</head>
<body>

	<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
		<div class="container">
			<div class="card login-card">
				<div class="row no-gutters">
					<div class="col-md-5">
						<img src="ESTILOS/login/images/nuevoUsuario.jpg" alt="login"
							class="login-card-img">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<div class="brand-wrapper">
								<img src="ESTILOS/login/images/logo1.svg" alt="logo"
									class="logo" style="width: 500px; height: 200px;">
							</div>
							<div style="padding-left: 100px;">

								<p class="login-card-description">Nuevo usuario</p>
								<div id="error"></div>
								<form action="../rdyController?action=register" method="post">
									<div class="form-group">
										<label for="usuario" class="sr-only">Usuario</label> <input
											type="text" name="usuario" id="usuario" class="form-control"
											placeholder="Usuario" maxlength="15" required>
									</div>
									<div class="form-group mb-4">
										<label for="clave" class="sr-only">Contraseña</label> <input
											type="password" name="clave" id="clave" class="form-control"
											placeholder="Contraseña" maxlength="15" required>
									</div>
									<div class="form-group mb-4">
										<input type="checkbox" id="terminos" class="" required>
										<label> <a href="javascript:verTerminos()">Acepto la
												pol&iacute;tica de cookies</a>
										</label>
									</div>
									<input hidden="rol" name="rol" id="rol" value="cliente" /> <input
										name="nuevoUsuario" id="nuevoUsuario"
										class="btn btn-block login-btn mb-4" type="submit"
										value="Aceptar"> <a href="../index.jsp"><input
										name="cancelar" id="cancelar"
										class="btn btn-block login-btn mb-4" type="button"
										value="Cancelar"></a>
								</form>

								<div class="modal fade" id="mostrarmodal" tabindex="-1"
									style="height: 532px;  padding-left: 17px; margin-top: 150px;"
									role="dialog" aria-labelledby="basicModal" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-body"  style="overflow-y: scroll;">
												<h4>Pol&iacute;tica de cookies</h4>
												RDY STORES IBERIA, S.L.U. (en adelante RDY) informa acerca
												del uso de las cookies en sus páginas web. Las cookies son
												archivos que se pueden descargar en su equipo a través de
												las páginas web. Son herramientas que tienen un papel
												esencial para la prestación de numerosos servicios de la
												sociedad de la información. Entre otros, permiten a una
												página web almacenar y recuperar información sobre los
												hábitos de navegación de un usuario o de su equipo y,
												dependiendo de la información obtenida, se pueden utilizar
												para reconocer al usuario y mejorar el servicio ofrecido.
												Visitar las páginas web de RDY con su navegador configurado
												para aceptar cookies nos indica su conformidad para hacer
												uso de nuestros servicios, así como su consentimiento al uso
												de cookies por parte de RDY para poder darle un mejor
												servicio, con las finalidades descritas en este aviso y en
												nuestra Política de Privacidad.<br> 1. TIPOS DE COOKIES Según
												quien sea la entidad que gestione el dominio desde donde se
												envían las cookies y trate los datos que se obtengan se
												pueden distinguir dos tipos: cookies propias y cookies de
												terceros. Existe también una segunda clasificación según el
												plazo de tiempo que permanecen almacenadas en el navegador
												del cliente, pudiendo tratarse de cookies de sesión o
												cookies persistentes. Por último, existe otra clasificación
												con cinco tipos de cookies según la finalidad para la que se
												traten los datos obtenidos: cookies técnicas, cookies de
												personalización, cookies de análisis, cookies publicitarias
												y cookies de publicidad basada en comportamientos. Para más
												información a este respecto puede consultar la Guía sobre el
												uso de las cookies de la Agencia Española de Protección de
												Datos. 2. COOKIES UTILIZADAS EN LA WEB A continuación se
												identifican las cookies que están siendo utilizadas en este
												portal así como su tipología y función: La página web
												RDY.es utiliza herramientas de analítica web, servicios,
												que permiten la medición y análisis de la navegación en las
												páginas web. En su navegador podrá observar 4 cookies de
												este servicio. Según la tipología anterior se trata de
												cookies propias, de sesión y de análisis. A través de la
												analítica web se obtiene información relativa a la audiencia
												que accede a la web y su composición, dispositivos y
												navegadores utilizados, intereses y hábitos de
												comportamiento, así como información indicativa del
												rendimiento del sitio web que nos permite analizar y mejorar
												los servicios prestados por parte de este portal. Además se
												descarga una cookie de tipo técnico que permite almacenar un
												identificador único por sesión a través del que es posible
												vincular datos necesarios para posibilitar la navegación en
												curso. Otra de las cookies que utilizamos es de las llamadas
												Persistentes, que nos permite identificar usuarios aunque
												estos no estén logados, con el fin de recordar hábitos de
												consumo y navegación. También almacenamos en cookies datos
												de preferencias de usuario, para recordar algunas de las
												preferencias, como por ejemplo visualizar los listados en un
												formato o recordar filtros de búsqueda entre las diferentes
												páginas. Por último, se descarga una cookie propia, de tipo
												técnico y de sesión. Gestiona el consentimiento del usuario
												para el uso de las cookies en la página web, con el objeto
												de recordar aquellos usuarios que las han aceptado y
												aquellos que no, de modo que a los primeros no se les
												muestre información en la parte inferior de la página al
												respecto. 3. AJUSTES DEL NAVEGADOR La mayoría de navegadores
												indican en la función ayuda cómo configurar su navegador
												para que no acepte cookies, para ser notificado cada vez que
												reciba una nueva cookie o para desactivarlas completamente.
												También puede eliminar, deshabilitar o revocar datos
												similares que son utilizados por las extensiones de su
												navegador (add-on), tales como las Flash Cookies. Para ello
												puede cambiar la configuración de dichas extensiones o
												visitar el sitio web de su fabricante. 4. ACEPTACIÓN DE LA
												POLÍTICA DE COOKIES RDY asume que usted acepta el uso de
												cookies. No obstante, muestra información sobre su Política
												de cookies en la parte inferior de cualquier página del
												portal y con cada inicio de sesión con el objeto de que
												usted sea consciente. Ante esta información es posible
												llevar a cabo las siguientes acciones: Cerrar la ventana
												supone aceptar la política de cookies. No se volverá a
												visualizar este aviso al acceder a cualquier página del
												portal durante la presente sesión. Modificar su
												configuración de su navegador para no permitir el uso de
												cookies, lo que no permitirá el uso de la web de RDY
												correctamente. Tenga en cuenta que eliminar las cookies
												puede afectar a su experiencia de navegación y limitar
												nuestra capacidad para mejorar nuestros servicios y
												mostrarle publicidad relacionada con sus preferencias.
											</div>
											<div class="modal-footer">
												<a href="#" data-dismiss="modal" class="btn btn-danger">Cerrar</a>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>

