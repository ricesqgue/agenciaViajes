<?php 
	session_start();
	include 'conexionMysql.php';

	$json = array();

	$query = "insert into reservacionvuelo values (default,".$_SESSION['idUsuario'].",".$_POST['idVueloIda'].",".$_POST['idVueloRegreso'].",".$_POST['precioVuelo'].");";

	if ($conn->query($query) === TRUE) {
	    $idReservacionVuelo = $conn->insert_id;
	}

	list($mes,$dia,$ano) = explode('/',$_POST['fechaIda']);
	$fechaIda = $ano ."-".$mes ."-" . $dia;
	list($mes1,$dia2,$ano3) = explode('/',$_POST['fechaRegreso']);
	$fechaRegreso = $ano3 ."-".$mes1 ."-" . $dia2;
	

	

	$query = "insert into reservacionhotel values (default,".$_POST['idHotel'].",".$_SESSION['idUsuario'].",".$_POST['idHabitacion'].",'".$fechaIda."','".$fechaRegreso."',".$_POST['precioHotel'].");";
	
	
	
	if ($conn->query($query) === TRUE) {
	    $idReservacionHotel = $conn->insert_id;
	}

	

	$query = "insert into reservacionactividad values (default,".$_POST['idActividad'].",".$_SESSION['idUsuario'].",".$_POST['precioActividad'].");";


	if ($conn->query($query) === TRUE) {
	    $idReservacionActividad = $conn->insert_id;
	}
	
	
	

	$precioTotal = floatval($_POST['precioVuelo']) + floatval($_POST['precioHotel']) + floatval($_POST['precioActividad']);



	$query = "insert into reservaciontotal values (default,".$idReservacionHotel.",".$idReservacionVuelo.",".$idReservacionActividad.",".$precioTotal.",".$_POST['numPersonas'].");";
	
	if ($conn->query($query) === TRUE) {
		$json['ok'] = 'ok';
	} else {
    	$json['error'] = 'error';
	}

	$conn->close();

	echo json_encode($json);


 ?>