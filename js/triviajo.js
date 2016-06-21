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

