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
										<label for="clave" class="sr-only">Contrase�a</label> <input
											type="password" name="clave" id="clave" class="form-control"
											placeholder="Contrase�a" maxlength="15" required>
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
												del uso de las cookies en sus p�ginas web. Las cookies son
												archivos que se pueden descargar en su equipo a trav�s de
												las p�ginas web. Son herramientas que tienen un papel
												esencial para la prestaci�n de numerosos servicios de la
												sociedad de la informaci�n. Entre otros, permiten a una
												p�gina web almacenar y recuperar informaci�n sobre los
												h�bitos de navegaci�n de un usuario o de su equipo y,
												dependiendo de la informaci�n obtenida, se pueden utilizar
												para reconocer al usuario y mejorar el servicio ofrecido.
												Visitar las p�ginas web de RDY con su navegador configurado
												para aceptar cookies nos indica su conformidad para hacer
												uso de nuestros servicios, as� como su consentimiento al uso
												de cookies por parte de RDY para poder darle un mejor
												servicio, con las finalidades descritas en este aviso y en
												nuestra Pol�tica de Privacidad.<br> 1. TIPOS DE COOKIES Seg�n
												quien sea la entidad que gestione el dominio desde donde se
												env�an las cookies y trate los datos que se obtengan se
												pueden distinguir dos tipos: cookies propias y cookies de
												terceros. Existe tambi�n una segunda clasificaci�n seg�n el
												plazo de tiempo que permanecen almacenadas en el navegador
												del cliente, pudiendo tratarse de cookies de sesi�n o
												cookies persistentes. Por �ltimo, existe otra clasificaci�n
												con cinco tipos de cookies seg�n la finalidad para la que se
												traten los datos obtenidos: cookies t�cnicas, cookies de
												personalizaci�n, cookies de an�lisis, cookies publicitarias
												y cookies de publicidad basada en comportamientos. Para m�s
												informaci�n a este respecto puede consultar la Gu�a sobre el
												uso de las cookies de la Agencia Espa�ola de Protecci�n de
												Datos. 2. COOKIES UTILIZADAS EN LA WEB A continuaci�n se
												identifican las cookies que est�n siendo utilizadas en este
												portal as� como su tipolog�a y funci�n: La p�gina web
												RDY.es utiliza herramientas de anal�tica web, servicios,
												que permiten la medici�n y an�lisis de la navegaci�n en las
												p�ginas web. En su navegador podr� observar 4 cookies de
												este servicio. Seg�n la tipolog�a anterior se trata de
												cookies propias, de sesi�n y de an�lisis. A trav�s de la
												anal�tica web se obtiene informaci�n relativa a la audiencia
												que accede a la web y su composici�n, dispositivos y
												navegadores utilizados, intereses y h�bitos de
												comportamiento, as� como informaci�n indicativa del
												rendimiento del sitio web que nos permite analizar y mejorar
												los servicios prestados por parte de este portal. Adem�s se
												descarga una cookie de tipo t�cnico que permite almacenar un
												identificador �nico por sesi�n a trav�s del que es posible
												vincular datos necesarios para posibilitar la navegaci�n en
												curso. Otra de las cookies que utilizamos es de las llamadas
												Persistentes, que nos permite identificar usuarios aunque
												estos no est�n logados, con el fin de recordar h�bitos de
												consumo y navegaci�n. Tambi�n almacenamos en cookies datos
												de preferencias de usuario, para recordar algunas de las
												preferencias, como por ejemplo visualizar los listados en un
												formato o recordar filtros de b�squeda entre las diferentes
												p�ginas. Por �ltimo, se descarga una cookie propia, de tipo
												t�cnico y de sesi�n. Gestiona el consentimiento del usuario
												para el uso de las cookies en la p�gina web, con el objeto
												de recordar aquellos usuarios que las han aceptado y
												aquellos que no, de modo que a los primeros no se les
												muestre informaci�n en la parte inferior de la p�gina al
												respecto. 3. AJUSTES DEL NAVEGADOR La mayor�a de navegadores
												indican en la funci�n ayuda c�mo configurar su navegador
												para que no acepte cookies, para ser notificado cada vez que
												reciba una nueva cookie o para desactivarlas completamente.
												Tambi�n puede eliminar, deshabilitar o revocar datos
												similares que son utilizados por las extensiones de su
												navegador (add-on), tales como las Flash Cookies. Para ello
												puede cambiar la configuraci�n de dichas extensiones o
												visitar el sitio web de su fabricante. 4. ACEPTACI�N DE LA
												POL�TICA DE COOKIES RDY asume que usted acepta el uso de
												cookies. No obstante, muestra informaci�n sobre su Pol�tica
												de cookies en la parte inferior de cualquier p�gina del
												portal y con cada inicio de sesi�n con el objeto de que
												usted sea consciente. Ante esta informaci�n es posible
												llevar a cabo las siguientes acciones: Cerrar la ventana
												supone aceptar la pol�tica de cookies. No se volver� a
												visualizar este aviso al acceder a cualquier p�gina del
												portal durante la presente sesi�n. Modificar su
												configuraci�n de su navegador para no permitir el uso de
												cookies, lo que no permitir� el uso de la web de RDY
												correctamente. Tenga en cuenta que eliminar las cookies
												puede afectar a su experiencia de navegaci�n y limitar
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

