<%-- 
    Document   : index
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
<link rel="stylesheet" href="VISTAS/ESTILOS/login/css/login.css">

<!-- Favicon -->
<link href="VISTAS/ESTILOS/principal/img/palanca-de-mando.png"
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
						<img src="VISTAS/ESTILOS/login/images/login2.jpg" alt="login"
							class="login-card-img">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<div class="brand-wrapper">
								<img src="VISTAS/ESTILOS/login/images/logo1.svg" alt="logo"
									class="logo" style="width: 500px; height: 200px;">
							</div>
							<div style="padding-left: 100px;">

								<p class="login-card-description">Iniciar sesi&oacute;n en
									su cuenta</p>
								<div id="error"
									style="margin-bottom: 15px; color: red; font-family: monospace;"></div>
								<form action="rdyController?action=index" method="post"
									id="formlogin">

									<div class="form-group">
										<label for="usuario" class="sr-only">Usuario</label> <input
											type="text" name="usuario" id="usuario" class="form-control"
											placeholder="Usuario" value="admin">
									</div>
									<div class="form-group mb-4">
										<label for="clave" class="sr-only">Clave</label> <input
											type="password" name="clave" id="clave" class="form-control"
											placeholder="Clave" value="123">
									</div>
									<input name="login" id="login"
										class="btn btn-block login-btn mb-4" type="submit"
										value="Acceder">
								</form>
								<p class="login-card-footer-text">
									&iquest;No tienes cuenta? <a href="VISTAS/nuevoUsuario.jsp"
										class="text-reset">Registrate aqu&#237;</a>
								</p>
								<nav class="login-card-footer-nav">
									<a href="javascript:verTerminos()">T&eacute;rminos de Uso.
										Pol&iacute;tica de privacidad</a>
								</nav>


								<div class="modal fade" id="mostrarmodal" tabindex="-1"
									role="dialog"
									style="height: 532px; display: block; padding-left: 17px; margin-top: 150px;"
									aria-labelledby="basicModal" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-body" style="overflow-y: scroll;">
												<h4>T&eacute;rminos de Uso. Pol&iacute;tica de
													privacidad</h4>
												1. INFORMACI&Oacute;N GENERAL Los presentes T&eacute;rminos
												y condiciones de uso y la Pol&iacute;tica de privacidad
												rigen el uso del sitio web espana.edp.com, propiedad de EDP
												- Energias de Portugal, S.A. (en adelante EDP). Si desea
												ponerse en contacto con EDP para tratar temas relacionados
												con este sitio web, puede hacerlo mediante el formulario
												disponible en
												https://www.edp.com/es/contactos-globales#contactos-generales.
												El acceso y el uso de este sitio web es responsabilidad
												total del usuario, que est&aacute; sujeto a la aceptación de
												los presentes t&eacute;rminos y condiciones de uso, de la
												pol&iacute;tica de privacidad y el uso de los datos
												aqu&iacute; transcritos. El uso de este sitio web y las
												relaciones entre EDP y los usuarios se rigen por la
												legislación portuguesa aplicable. EDP se reserva el derecho
												de cambiar los presentes t&eacute;rminos y condiciones de
												uso o revisar la pol&iacute;tica de privacidad y uso de
												datos en los presentes identificados siempre que lo
												considere oportuno, en cualquier momento, con o sin previo
												aviso. Para consultar su versión actual, haga clic en los
												"T&eacute;rminos y condiciones de uso" que se encuentran en
												el sitio web de EDP. La versión m&aacute;s actual de los
												T&eacute;rminos y condiciones de uso sustituye todas las
												versiones anteriores. Si no est&aacute; de acuerdo con estos
												T&eacute;rminos y condiciones de uso, no utilice el sitio
												web. Estos T&eacute;rminos y condiciones de uso y la
												Pol&iacute;tica de privacidad constituyen un contrato entre
												el usuario y EDP, y se aplican en el uso del sitio web. Es
												responsabilidad del usuario leer y revisar los mismos cada
												vez que accede al sitio web, con el fin de conocer cualquier
												cambio realizado, ya que los mismos afectan a sus derechos.	<br> 


												2. DERECHOS DE PROPIEDAD INTELECTUAL Los contenidos que
												aparecen en el sitio web, incluyendo, sin limitación,
												im&aacute;genes, textos, software, fotograf&iacute;as,
												sonido, música, v&iacute;deos, elementos interactivos y
												afines ("Contenido"), marcas y logotipos ("Marcas"), o
												cualquier otro derecho de propiedad industrial o intelectual
												que aparecen en el mismo, son propiedad de EDP y queda
												expresamente prohibido su uso por terceros no autorizados.
												El contenido del sitio web solo est&aacute; disponible para
												información y uso personal y no puede ser utilizado,
												copiado, reproducido, distribuido, transmitido, difundido,
												vendido, licenciado o, de cualquier otra forma, explotado
												para cualquier otro fin sin el consentimiento previo y por
												escrito de sus respectivos propietarios. El usuario acepta
												no utilizar, desactivar o interferir con los recursos
												relacionados con la seguridad del sitio web y de la
												aplicación. Sin embargo, el usuario podr&aacute; imprimir el
												material contenido en este sitio web, siempre que el mismo
												no se modifique, sea para uso personal y no comercial, y
												mantenga la indicación de la fuente y de los derechos de
												autor, y siempre que no se elimine ninguna otra indicación
												de propiedad. Nada en este sitio web deber&aacute;
												interpretarse como una concesión de cualquier tipo de
												licencia u otra autorización de uso a sus usuarios. El sitio
												web puede contener im&aacute;genes u otros materiales cuyos
												derechos de autor pertenecen a terceros, tal como
												proveedores u otras entidades que contribuyan a su creación
												o mantenimiento (como por ejemplo, fotos de banco de
												im&aacute;genes). A pesar de que los datos personales
												proporcionados a EDP est&aacute;n protegidos de acuerdo a lo
												definido en la Pol&iacute;tica de privacidad y uso de datos
												que aparecen en los presentes T&eacute;rminos y condiciones
												de uso, cualquier información u otro contenido que el
												usuario transmita a trav&eacute;s de este sitio web, ya sea
												mediante correo electrónico, env&iacute;o de archivos o de
												algún otro modo, se considerar&aacute; como no confidencial
												y no reservado.<br>  3. CONTENIDOS Y GARANTIAS El usuario acepta
												que el uso del sitio web debe hacerse bajo su propia cuenta
												y riesgo. En la medida en que lo permita la ley, EDP,
												est&aacute; exenta de cualquier garant&iacute;a, expresa o
												impl&iacute;cita, con respecto al uso del sitio web. EDP no
												garantiza la veracidad o exactitud de los contenidos
												disponibles en sus sitios web y no asume ninguna
												responsabilidad u obligación por cualquier (i) error o
												contenido poco preciso, (ii) daño personal o daño a la
												propiedad de cualquier naturaleza que resulte del acceso y
												uso de las p&aacute;ginas de este sitio web y su
												aplicaci&oacute;n, (iii) acceso no autorizado o uso de
												nuestros servidores seguros o de informaci&oacute;n personal
												o financiera almacenada en ellos, (iv) interrupci&oacute;n o
												cese de la transmisi&oacute;n desde o hacia nuestro sitio
												web (iv) error, virus, troyano o similar que pueda ser
												transmitido hacia o a trav&eacute;s del sitio web, o (v)
												error u omisi&oacute;n en el contenido o cualquier
												p&eacute;rdida o daño que se haya producido como resultado
												del uso de contenidos publicados, enviados, transmitidos o
												puestos a disposici&oacute;n a trav&eacute;s del sitio web,
												(vi) la no disponibilidad o cualquier dificultad o
												incapacidad de descargar o acceder al contenido o cualquier
												otra falla en el sistema de comunicaci&oacute;n que pueda
												resultar en la no disponibilidad del sitio web. EDP no
												ser&aacute; responsable de cualquier asistencia o
												mantenimiento del sitio web. EDP se reserva el derecho de
												realizar cambios y correcciones, modificar el nombre y
												suspender o cerrar el sitio web espana.edp.com cuando lo
												considere apropiado y sin necesidad de avisar previamente a
												los usuarios. EDP no asume responsabilidad u
												obligaci&oacute;n por el contenido transmitido entre los
												usuarios o entre estos y cualquier tercero fuera de este
												sitio web.<br>  4. RESPONSABILIDAD, USO Y RIESGO En la medida en
												que sea permitido por la ley, EDP y todos sus representantes
												legales, directores, empleados u otros que por cualquier
												forma actúen en nombre y representaci&oacute;n de EDP,
												as&iacute; como cualquier otra parte involucrada en la
												creaci&oacute;n, producci&oacute;n, mantenimiento o
												implementaci&oacute;n de este sitio web, no ser&aacute;n
												responsables ante cualquier usuario del sitio web, por
												cualquier posible daño, perjuicio o lesi&oacute;n
												(incluyendo cualquier p&eacute;rdida de lucro cesante y
												daños morales, cualquier p&eacute;rdida indirecta,
												accidental o consecuencial) que se deriven del uso correcto
												o incorrecto de este sitio web y su contenido, del acceso al
												ordenador, tel&eacute;fono inteligente, tableta o sistema
												inform&aacute;tico del usuario por terceros, o de cualquier
												virus, entre otros. Este sitio web contiene enlaces a sitios
												web de terceros. Estos enlaces se proporcionan únicamente
												para la comodidad y el acceso m&aacute;s f&aacute;cil al
												usuario. La existencia de dichos enlaces no significa que
												EDP tenga derecho alguno sobre los contenidos de los sitios
												referidos. EDP no comprueba su contenido y no es responsable
												por el contenido de cualquiera de estos sitios o por
												cualquier hecho derivado de su uso o visualizaci&oacute;n,
												sin verificar que los mismos est&eacute;n libres de
												cualquier tipo de virus u otros elementos que puedan causar
												daños al usuario. El acceso y la visita a cualquiera de
												estos sitios de terceros se realizan bajo riesgo total del
												usuario, siendo el usuario el responsable de cualquier uso o
												de las consecuencias de all&iacute; resultantes. Queda
												expresamente prohibido el uso del sitio web para fines
												ilegales o cualesquiera otros fines que puedan ser
												considerados indignos de la imagen de EDP. La
												usurpaci&oacute;n, contrafacci&oacute;n, aprovechamiento del
												contenido usurpado o falsificaci&oacute;n, la
												identificaci&oacute;n ileg&iacute;tima y la competencia
												desleal son punibles criminalmente. El usuario
												tambi&eacute;n tiene prohibido crear o introducir en este
												sitio web cualquier tipo de virus o programa que lo dañe o
												contamine o aconseje a terceros a hacerlo. La
												pr&aacute;ctica de dicha infracci&oacute;n es punible en los
												t&eacute;rminos de la ley. El sitio web es controlado y
												ofrecido por EDP desde sus instalaciones en Portugal. EDP no
												garantiza que el sitio web est&eacute; disponible para su
												uso en otros lugares. Quienes accedan o utilicen el sitio
												web desde otras jurisdicciones lo hacen bajo su propia
												iniciativa y son responsables por el cumplimiento de las
												leyes locales.<br>  5. POLITICA DE PRIVACIDAD Y USO DE DATOS EDP
												es responsable por el uso de la informaci&oacute;n personal
												de los usuarios recogida directamente a trav&eacute;s de
												diversos medios. EDP se compromete a poner en
												pr&aacute;ctica las medidas t&eacute;cnicas y organizativas
												adecuadas para proteger los datos personales de sus usuarios
												contra su destrucci&oacute;n, accidental o il&iacute;cita,
												p&eacute;rdida accidental, modificaci&oacute;n,
												divulgaci&oacute;n o acceso no autorizado. Se considera la
												aplicaci&oacute;n de un nivel de seguridad acorde con los
												riesgos que implica el uso dada la naturaleza de los datos a
												proteger. Por tanto, EDP puede recoger y guardar
												informaci&oacute;n que le haya sido suministrada de manera
												voluntaria y con consentimiento, incluyendo, entre otros,
												informaci&oacute;n personal individualizada, como el nombre,
												direcci&oacute;n, direcci&oacute;n de correo
												electr&oacute;nico y el número de tel&eacute;fono. EDP antes
												del uso y recogida de los datos personales directamente de
												los respectivos titulares, proporcionar&aacute; toda la
												informaci&oacute;n necesaria relativa al uso y
												recoger&aacute; la autorizaci&oacute;n respectiva para tal
												fin. Los datos proporcionados por los usuarios ser&aacute;n
												utilizados por EDP de conformidad con los preceptos
												legalmente aplicables, en particular: a) Utilizados de forma
												l&iacute;cita y respetando el principio de buena fe; b)
												Recogidos con fines determinados, expl&iacute;citos y
												leg&iacute;timos, no pudiendo ser utilizados posteriormente;
												c) Exactos y, de ser necesario, actualizados, debiendo
												tomarse las medidas adecuadas para asegurar que sean
												eliminados o rectificados los datos inexactos o incompletos,
												teniendo en cuenta el fin para el que fueron recogidos o
												para los que son tratados posteriormente; d) Conservados
												para permitir la identificaci&oacute;n de sus titulares
												solamente durante el per&iacute;odo necesario para alcanzar
												los fines de recogida o uso posterior. Los datos solicitados
												en el sitio web no son considerados, a la luz de la
												legislaci&oacute;n aplicable, como datos sensibles y, por lo
												tanto, no se aplican las inherentes restricciones. Los datos
												personales del usuario son recogidos e introducidos por EDP
												en un archivo automatizado para llevar a cabo actividades
												incluidas en el &aacute;mbito de la iniciativa del sitio web
												espana.edp.com. Los datos recogidos podr&aacute;n
												transmitirse a otras sociedades del Grupo EDP, con sede en
												Portugal o en el extranjero, para llevar a cabo cualquier
												actividad incluida en la iniciativa del sitio web. La
												recogida y el uso de datos personales se llevar&aacute;n a
												cabo de acuerdo con la legislaci&oacute;n portuguesa,
												aplicable y vigente, y todas las autorizaciones que, a tal
												fin, resulten necesarias, se obtendr&aacute;n previamente
												ante la Comisi&oacute;n Nacional de Protecci&oacute;n de
												Datos. Según la ley, EDP adopt&oacute; las medidas
												necesarias para garantizar que los datos proporcionados
												est&eacute;n protegidos contra el acceso o uso no autorizado
												por parte de terceros no autorizados. Sin embargo, EDP
												alerta ante el riesgo residual de acceso no autorizado a
												trav&eacute;s de Internet. Hay otros tipos de datos, en este
												caso no personales y no individualizados, que se registran
												solo para ayudar a mantener el sitio web útil y para
												garantizar una buena experiencia de navegaci&oacute;n de
												quien lo visita. Se trata de las informaciones
												estad&iacute;sticas que, normalmente y por
												definici&oacute;n, son registradas a trav&eacute;s de la
												ventana de navegaci&oacute;n de Internet ("browser"), tales
												como: la direcci&oacute;n en Internet del sitio web que
												trajo al usuario directamente al sitio web de EDP, las
												p&aacute;ginas del sitio web m&aacute;s visitadas, el tipo
												de navegador y el sistema operativo, entre otros.<br>  6.
												CAPACIDAD PARA ACEPTAR LOS TÉRMINOS Y CONDICIONES DE USO El
												usuario confirma ser mayor de 18 años de edad o que cuenta
												con la autorizaci&oacute;n legal de sus padres o tutores y
												ser plenamente capaz de consentir y aceptar los
												t&eacute;rminos, condiciones, obligaciones, afirmaciones,
												representaciones y garant&iacute;as descritas en estos
												T&eacute;rminos y condiciones de uso, y respetar y cumplir
												los mismos. Si tiene menos de 18 años de edad y no posee una
												autorizaci&oacute;n legal de los padres o representantes
												legales, no utilice el sitio web. <br> 7. SEGURIDAD Y USO DE LA
												INFORMACI&Oacute;N EDP se compromete a garantizar la
												privacidad de los usuarios registrados. EDP no vende ni
												alquila a terceros cualquier dato personal enviado por los
												usuarios registrados. A pesar de los esfuerzos de EDP para
												proteger sus datos personales, una vez que estos son
												recogidos a trav&eacute;s de una red abierta como Internet,
												los mismos solamente podr&aacute;n circular en la red sin
												condiciones de seguridad, corriendo el riesgo de ser vistos
												y utilizados por terceros no autorizados.<br>  8.
												CONSERVACI&Oacute;N DE INFORMACI&Oacute;N PERSONAL

												Despu&eacute;s de recoger la informaci&oacute;n de datos
												personales e individuales, que voluntariamente le fue
												transmitida, EDP proceder&aacute; a su conservaci&oacute;n y
												mantenimiento hasta nuevo aviso o hasta que sea requerido
												por la ley. La conservación de esa información permite que
												EDP siga proporcionando servicios personalizados sin
												interrupción. 9. TRANSMISI&Oacute;N Estos T&eacute;rminos y
												condiciones de uso y cualquier derecho y licencia por el
												presente concedidos, no pueden ser transferidos o cedidos
												por el usuario, pudiendo, sin embargo, ser atribuidos por
												EDP a terceros sin restricción alguna. 10. LEY APLICABLE Los
												presentes T&eacute;rminos y condiciones de uso y la
												Pol&iacute;tica de privacidad se rigen por la legislación
												portuguesa y se interpretar&aacute;n de acuerdo a la misma.
												La versión en portugu&eacute;s de los presentes
												T&eacute;rminos y condiciones de uso y de la Pol&iacute;tica
												de privacidad, prevalecer&aacute;n sobre cualquier
												traducción a otros idiomas, si las hubiera. La nulidad de
												alguna de las disposiciones tendr&aacute; que ser eliminada,
												quedando las restantes disposiciones del mismo en vigor
												&iacute;ntegramente y produciendo sus efectos. En la falta
												de un acuerdo amigable entre las partes, los conflictos y
												disputas de cualquier naturaleza, relacionados con la
												formación, aplicación o interpretación del presente
												Contrato, ser&aacute;n regidos por la ley de Portugal y
												sujetos a la jurisdicción del Tribunal Judicial da Comarca
												de Lisboa, con renuncia expresa a cualquier otro.
											</div>
											<div class="modal-footer" style="display: block;">
												<br> <a href="#" data-dismiss="modal"
													class="btn btn-danger">Cerrar</a>
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

