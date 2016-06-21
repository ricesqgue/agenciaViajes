<?php 
	session_start();
	include 'conexionMysql.php';

	$correo = $_POST['email'];
	$password = $_POST['password'];

	$query = "select idUsuario, concat_ws(' ',nombre, apellidoPat, apellidoMat) as nombreCompleto, nombre  
				from usuario where email = '".$correo."' and password = md5('".$password."');";
	
	$consulta = $conn->query($query);
	
	$respuesta = array();

	if ($consulta->num_rows > 0) {
	    while($row = $consulta->fetch_assoc()) {
	       $respuesta['ok'] = "ok";
	       $_SESSION['idUsuario'] = $row['idUsuario'];
	       $_SESSION['nombre'] = $row['nombre'];
	       $_SESSION['nombreCompleto'] = $row['nombreCompleto'];
	       $_SESSION['correo'] = $correo;
	    }
	} else {
    	$respuesta['error'] = "Correo electrónico y/o contraseña incorrectos.";

	}
	$conn->close();

	echo json_encode($respuesta);

?>