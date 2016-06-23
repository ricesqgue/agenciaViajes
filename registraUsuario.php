<?php 
	//Conexion para usuario
	$servername = "localhost";
    $username = "root";
    $password = "root";
	$database = "agenciadeviajes";
	  
	// Create connection
	$conn = new mysqli($servername, $username, $password, $database);
	if ($conn->connect_error) {
	   die("Connection failed: " . $conn->connect_error);
	}

	$correo = $_POST["emailReg"];
	$password = $_POST["passwordReg"];
	$nombre = $_POST["nombre"];
	$aPaterno = $_POST["aPaterno"];
	$aMaterno = $_POST["aMaterno"];

	$respuesta = array();

	if(!filter_var($correo,FILTER_VALIDATE_EMAIL)){
		$respuesta['error'] = "Correo electronico inválido.";
		//Todos los demás filtros.
	}
	else{
		$query = "insert into usuario values (default,'".$nombre."','".$aPaterno."','".$aMaterno."','".$correo."',md5('".$password."'));";
		if ($conn->query($query) === TRUE) {
			$respuesta['ok'] = "<strong>Usuario agregado con éxito.</strong> Ya puedes iniciar sesión.";
		} else {
    		$respuesta['error'] = "Ocurrió un error inesperado. Intente nuevamente.";
		}
	}
	$conn->close();

	echo json_encode($respuesta);
 ?>