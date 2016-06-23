//Funcion para el registro de usuarios.
 function registraUsuario(){

 	var barra = '<div class="progress"><div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"><span class="sr-only"></span></div></div>';
 	$("#mensajeRegistro").html(barra);

 	if($("#emailReg").val() === "" || $("#passwordReg").val() === "" || $("#nombre").val() === "" || $("#aPaterno").val() === "" || $("#aMaterno").val() === ""){
 		$("#mensajeRegistro").html("<div class='alert alert-danger'><strong>Error.</strong> Completa todos los campos.</div>");
 	}
 	else{
	 	$.post('registraUsuario.php', $("#formRegistroUsuario").serialize(), function(respuesta) {
	 		/*optional stuff to do after success */
	 		if(respuesta.error !== undefined){
	 			$("#mensajeRegistro").html("<div class='alert alert-danger'><strong>Error. </strong> "+respuesta.error+"</div>")
	 		}
	 		else if(respuesta.ok !== undefined){
				$('#mensajeRegistro').html('<div class="alert alert-success">'+respuesta.ok+'</div>');
				document.getElementById("formRegistroUsuario").reset();
	 		}
	 	},"json");
 	}

 }

//Funcion para el inicio de sesion.
function iniciaSesion(){
 	var barra = '<div class="progress"><div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"><span class="sr-only"></span></div></div>';
 	$("#mensajeInicioSesion").html(barra);

 	if($("#email").val() === "" || $("#password").val() === ""){
 		$("#mensajeInicioSesion").html("<div class='alert alert-danger'><strong>Error.</strong> Completa todos los campos.</div>");
 	}
 	else{
 		$.post('iniciaSesion.php',$("#formInicioSesion").serialize(), function(respuesta) {
 			/*optional stuff to do after success */
 			if(respuesta.error !== undefined){
	 			$("#mensajeInicioSesion").html("<div class='alert alert-danger'><strong>Error. </strong> "+respuesta.error+"</div>");
	 		}
	 		else if(respuesta.ok !== undefined){
	 			window.location.reload();
	 		}

 		},"json");	
 	}
}
//funcion que envia formulario para los webservices

	function llamaWebServices(){ 
	var barra = '<div class="progress"><div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"><span class="sr-only"></span></div></div>';
 	$("#mensajeBusqueda").html(barra);

	$.post('callsWebService.php', $("#fomularioPaquete").serialize(), function(respuesta){
		
		/*optional stuff to do after success */
		if(respuesta.error !== undefined){
			$("#mensajeBusqueda").html("<div class='alert alert-danger'><strong> :( </strong>" + respuesta.error.mensaje + "</div>");
		}else{
			$("#mensajeBusqueda").html("");
			$("#modal-formulario").modal('toggle');
			$("#contenedor").html("");

			var contenidoVuelos = "<div id='vuelos'><center><h1>Vuelos</h1></center>";
			for(var i = 0 ; i<respuesta.vuelo.length; i++){
				contenidoVuelos += "<div class='row'>"
				+"<div class='col-xs-12 col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-3 oferta'>"
					+"<h3 class='titulo'>"+respuesta.vuelo[i].aerolinea+"</h3>"
					+"<div class='row'>"
						+"<div class='col-xs-12 col-md-6'>"
							+"<center><h4>"+respuesta.vuelo[i].ciudad1+" <span class='icon-arrow-right2' style='color:green'></span> "+respuesta.vuelo[i].ciudad2+" <span style='color:#FCAF17'> $"+respuesta.vuelo[i].precioIda+"</span></h4></center>"
						+"</div>"
						+"<div class='col-xs-12 col-md-6'>"
							+"<center><h4>"+respuesta.vuelo[i].ciudad1+" <span class='icon-arrow-left2' style='color:green'></span> "+respuesta.vuelo[i].ciudad2+"<span style='color:#FCAF17'> $"+respuesta.vuelo[i].precioVuelta+"</span></h4></center>"
						+"</div>"
					+"</div>"
					+"<center><h3>Total <span style='color: green'>$"+(parseFloat(respuesta.vuelo[i].precioIda)+parseFloat(respuesta.vuelo[i].precioVuelta))+"</span></h3>"
					+"<span style='font-size:14pt;'>Elegir <input type='radio'  name='idVuelo' value='"+respuesta.vuelo[i].idVueloIda+"-"+respuesta.vuelo[i].idVueloRegreso+"-"+(parseFloat(respuesta.vuelo[i].precioIda)+parseFloat(respuesta.vuelo[i].precioVuelta))+"'></center>"
				+"</div>"
			+"</div><br>";
			}
			contenidoVuelos+="<br></div><hr>";
			
			var contenidoHoteles = "<div id='hoteles'> <center><h1>Hoteles</h1></center>";
			for(var i=0;i<respuesta.hotel.length-1;i++){
				contenidoHoteles += "<div class='row'>"
				+"<div class='col-xs-12 col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-3 oferta'>"
						+"<h3 class='titulo'>"+respuesta.hotel[i].nombre+"</h3>"
						+"<div class='row'>"
							+"<div class='col-xs-12 col-md-6'>"
								+"<center><h4>Categoría ";
								for(var c=0;c<respuesta.hotel[i].categoria;c++){
									contenidoHoteles += "<span class='icon-star-full'>"
								}
								contenidoHoteles += "</h4></center>"
							+"</div>"
							+"<div class='col-xs-12 col-md-6'>"
								+"<center><h4>Habitacion "+respuesta.hotel[i].tipoHabitacion +" <span style='color:#FCAF17'>$"+respuesta.hotel[i].precio +"</span></h4></center>"
							+"</div>"
						+"</div>"
						+"<center>"
							+"<h3 style='color: green'>Total por "+respuesta.hotel[respuesta.hotel.length-1].noches+" noches: $"+(parseFloat(respuesta.hotel[respuesta.hotel.length-1].noches)*parseFloat(respuesta.hotel[i].precio))+"</h3>"
							+"<span style='font-size:14pt;''>Elegir</span> <input type='radio' name='idHotel' value='"+ respuesta.hotel[i].idHotel +"-"+respuesta.hotel[i].idHabitacion+"-"+(parseFloat(respuesta.hotel[respuesta.hotel.length-1].noches)*parseFloat(respuesta.hotel[i].precio))+"'>"
						+"</center>"
					+"</div>"
				+"</div><br>";
			}
			contenidoHoteles+="<br></div><hr>";
			
			var contenidoActividades = "<div id='actividades'> <center><h1>Actividades</h1></center>";
			for(var i=0;i<respuesta.actividad.length;i++){
				contenidoActividades += "<div class='row'>"
					+"<div class='col-xs-12 col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-3 oferta'>"
						+"<h3 class='titulo'>"+respuesta.actividad[i].nombre+"</h3>"
						+"<div class='row'>"
							+"<div class='col-xs-12'>"
								+"<center><h4>Precio <span style='color:#FCAF17'>$"+respuesta.actividad[i].precio+"</span></h4></center>"
							+"</div>"
						+"</div>"
						+"<center>"
							+"<h3 style='color: green'>Total por "+$('#numPersonas').val()+" personas: $"+(parseFloat(respuesta.actividad[i].precio) * parseFloat($('#numPersonas').val()))+"</h3>"
							+"<span style='font-size:14pt;'>Elegir</span> <input type='radio' name='idActividad' value='"+respuesta.actividad[i].idActividad+"-"+(parseFloat(respuesta.actividad[i].precio) * parseFloat($('#numPersonas').val()))+"'>"
						+"</center>"	
					+"</div>"
				+"</div><br>";
			}
			contenidoActividades+="<br></div><hr><br>";

			var boton = "<div class='row'><div class='col-sm-4 col-sm-offset-3'><div id='mensajeReservacion'></div></div><div class='col-sm-2 col-sm-offset-1'><button class='btn btn-lg btn-primary' onclick='validaDatosReservacion()' type='button' id='btnTermina'>Reservar</button></div></div><br><br>";

			var modalConfirmacion = '<div class="modal fade" id="modal-confirmacion">'
		+'<div class="modal-dialog">'
			+'<div class="modal-content">'
				+'<div class="modal-header">'
					+'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
					+'<h4 class="modal-title">Reservación</h4>'
				+'</div>'
				+'<div class="modal-body">'
					+'<center><h2>Corfirmar reservacion</h2></center><div id="mensajeConfirmacion"></div>'
				+'</div>'
				+'<div class="modal-footer">'
					+'<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>'
					+'<button type="button" class="btn btn-primary" onclick="reservar()">Confirmar</button>'
				+'</div>'
			+'</div>'
		+'</div>'
	+'</div>';
			$("#contenedor").html(contenidoVuelos+contenidoHoteles+contenidoActividades+boton+modalConfirmacion);
		}	
		
	},"json");
}

function validaDatosReservacion(){
	if($('input:radio[name=idVuelo]:checked').val() === undefined){
		$("#mensajeReservacion").html("<div class='alert alert-danger'><center><strong>Error. </strong> Elija un vuelo</center></div>");
	}
	else if($('input:radio[name=idHotel]:checked').val() === undefined){
		$("#mensajeReservacion").html("<div class='alert alert-danger'><center><strong>Error. </strong> Elija un hotel</center></div>");
	}
	else if($('input:radio[name=idActividad]:checked').val() === undefined){
		$("#mensajeReservacion").html("<div class='alert alert-danger'><center><strong>Error. </strong> Elija una actividad</center></div>");
	}else{
		$("#mensajeReservacion").html("");
		$("#modal-confirmacion").modal('toggle');

	}
}

function reservar(){
	var datosVuelo = $('input:radio[name=idVuelo]:checked').val().split('-');
	var idVueloIda = datosVuelo[0];
	var idVueloRegreso = datosVuelo[1];
	var precioVuelo = datosVuelo[2];
	var datosHotel = $('input:radio[name=idHotel]:checked').val().split('-');
	var idHotel = datosHotel[0];
	var idHabitacion = datosHotel[1];
	var precioHotel = datosHotel[2];
	var datosActividad = $('input:radio[name=idActividad]:checked').val().split('-');
	var idActividad = datosActividad[0];
	var precioActividad = datosActividad[1];
	var fechaIda = $("#fechaIda").val();
	var fechaRegreso = $("#fechaRegreso").val();
	var numPersonas = $("#numPersonas").val();

	var barra = '<div class="progress"><div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"><span class="sr-only"></span></div></div>';
 	$("#mensajeConfirmacion").html(barra);
	$.post('reserva.php', {idVueloIda: idVueloIda, idVueloRegreso: idVueloRegreso, precioVuelo: precioVuelo, idHotel: idHotel, idHabitacion:idHabitacion, precioHotel: precioHotel, idActividad: idActividad, precioActividad: precioActividad ,fechaIda: fechaIda, fechaRegreso: fechaRegreso, numPersonas: numPersonas}, function(respuesta) {
		/*optional stuff to do after success */
		console.log(respuesta);
		if(respuesta.error !== undefined){
			$("#mensajeConfirmacion").html("<div class='alert alert-danger'><center><strong>Error. </strong> Ocurrio un error inesperado.</center></div>");
		}else if(respuesta.ok !== undefined){
			$("#mensajeConfirmacion").html("<div class='alert alert-success'><center><strong>Éxito. </strong> Reservación exitosa</center></div>");
			setTimeout(function(){window.location.href='index.php'}, 4000);
		}
	},"json");

}





