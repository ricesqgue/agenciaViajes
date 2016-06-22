<?php 
	require_once "nusoap.php";
	//WebService Hotel
	
	$clienteHotel = new nusoap_client("http://localhost/computoDistribuido/holaMundoServer.php");

	$errorHotel = $clienteHotel->getError();
	if($errorHotel){
		//echo "<h2>Error<h2><pre>" . $errorHotel . "</pre>";
	}
	$params = array("nombre" => 'Ricardo');
	$resultadoHotel = $clienteHotel->call("holaMundo",$params);
	 if ($clienteHotel->fault) {
        //echo "<h2>Fault</h2><pre>";
        //print_r($resultadoHotel);
        //echo "</pre>";
    }
    else {
        $errorHotel = $clienteHotel->getError();
        if ($errorHotel) {
        //    echo "<h2>Error</h2><pre>" . $errorHotel . "</pre>";
        }
        else {
          //  echo "<h2>resultado: </h2><pre>";
        	$json = array();
        	$json['mensaje'] = $resultadoHotel;
            echo json_encode($json);
            //echo "</pre>";
        }
    }



?>