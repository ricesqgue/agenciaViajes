<?php 
	session_start();
	
	//Conexion para usuarios.
	$servername = "localhost";
    $username = "root";
    $password = "root";
	$database = "agenciadeviajes";
	  
	// Create connection
	$conn = new mysqli($servername, $username, $password, $database);
	if ($conn->connect_error) {
	   die("Connection failed: " . $conn->connect_error);
	}

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