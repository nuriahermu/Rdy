<?php
$usuario = $_POST['usuario'];
$clave = $_POST['clave'];

if( $usuario === '' && $clave === ''){
	echo json_encode('camposVacios');
}