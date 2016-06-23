<?php 
	require_once "nusoap.php";

    $bandera = true;
    $json = array();
	
    //WebService Hotel
	
    	$clienteHotel = new nusoap_client("http://localhost/webServiceHotel/webService.php");

    	$errorHotel = $clienteHotel->getError();
    	if($errorHotel){
    		//echo "<h2>Error<h2><pre>" . $errorHotel . "</pre>";
    	}
        $params = array("destino" => $_POST["destino"], "numPersonas" => $_POST["numPersonas"]);
        
    	
        $resultadoHotel = $clienteHotel->call("checaHotel",$params);
    	 if ($clienteHotel->fault) {
            //echo "<h2>Fault</h2><pre>";
            //print_r($resultadoHotel);
            //echo "</pre>";
        }
        else {
            $errorHotel = $clienteHotel->getError();
            if ($errorHotel) {
               echo "<h2>Error</h2><pre>" . $errorHotel . "</pre>";
                $bandera = false;
            }
            else {
            	//Llego respuesta del web service
                $hotel = json_decode($resultadoHotel);

                if(count($hotel)>0){
                    $datetime1 = new DateTime($_POST["fechaIda"]);
                    $datetime2 = new DateTime($_POST["fechaRegreso"]);
                    $interval = $datetime1->diff($datetime2);
                    $noches = $interval->format('%a');
                    array_push($hotel, array("noches"=>$noches));
                    $json['hotel'] = $hotel;

                    
                }
                else{
                    $json["error"] = array("mensaje" => "No hay hoteles disponibles. Vuelve a consultar mas tarde.");
                    $bandera = false;
                }
    
                //echo $resultadoHotel;
                
              
            }
        }
    
    //Web service Vuelo    
        if($bandera){
            //Si hay vuelo se procede a checar vuelos
            $clienteVuelo = new nusoap_client("http://localhost/webServiceVuelo/webService.php");

            $errorVuelo = $clienteVuelo->getError();
            if($errorVuelo){
                //echo "<h2>Error<h2><pre>" . $errorHotel . "</pre>";
            }
            $params = array("destino" => $_POST["destino"],"origen" => $_POST["origen"]);
            

            $resultadoVuelo = $clienteVuelo->call("checaVuelo",$params);
             if ($clienteVuelo->fault) {
                //echo "<h2>Fault</h2><pre>";
                //print_r($resultadoHotel);
                //echo "</pre>";
            }
            else {
                $errorVuelo = $clienteVuelo->getError();
                if ($errorVuelo) {
                   $bandera = false;
                }
                else {
                    $vuelo = json_decode($resultadoVuelo);
                    if(count($vuelo)>0){
                        $json['vuelo'] = $vuelo;
                    }
                    else{
                        $json["error"] = array("mensaje" => "No hay vuelos disponibles. Vuelve a consultar mas tarde.");
                        $bandera = false;
                    }
                    
                    //echo $resultadoVuelo;
                    
                }
            }
        }

    //Web service actividad
        if($bandera){
            //Si hay vuelo y hotel se procede a checar actividades
            $clienteActividad = new nusoap_client("http://localhost/webServiceActividad/webService.php");

            $errorActividad = $clienteActividad->getError();
            if($errorActividad){
                //echo "<h2>Error<h2><pre>" . $errorHotel . "</pre>";
            }
            $params = array("destino" => $_POST["destino"]);
            

            $resultadoActividad = $clienteActividad->call("checaActividad",$params);
             if ($clienteActividad->fault) {
                //echo "<h2>Fault</h2><pre>";
                //print_r($resultadoHotel);
                //echo "</pre>";
            }
            else {
                $errorActividad = $clienteActividad->getError();
                if ($errorActividad) {
                   $bandera = false;
                }
                else {
                    $actividad = json_decode($resultadoActividad);
                    if(count($actividad)>0){
                        $json['actividad'] = $actividad;
                    }
                    else{
                        $json["error"] = array("mensaje" => "No hay actividades disponibles. Vuelve a consultar mas tarde.");
                        $bandera = false;
                    }
                    
                    //echo $resultadoVuelo;
                    
                }
            }
        }

        echo json_encode($json);



?>