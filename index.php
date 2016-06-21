<?php 
	session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Triviajo </title>
	<link rel="icon" type="image/png" href="images/logo.png" />
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/triviajo.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/icons.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
						<span class="sr-only">Menú</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="#"><img src="images/logo.png" width="80px" alt=""></a>
					<a class="navbar-brand" href="#"> T R I V I A J O</a>

				</div>
		
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav">
						<li class=""><a href="#">Vuelos</a></li>
						<li><a href="#">Hoteles</a></li>
						<li><a href="#">Actividades</a></li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Buscar...">
						</div>
						<button type="submit" class="btn btn-default">Buscar</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><b><?php if(isset($_SESSION['nombre'])){ echo $_SESSION['nombreCompleto']; } else{ echo "Entrar";} ?></b> <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<?php
									if(isset($_SESSION['nombre'])){
										echo "<li><a href='cerrarSesion.php'>Cerrar sesión</a></li>";
									}
									else{
									 	echo "<li><a data-toggle='modal' href='#modal-sesion' >Iniciar sesión.</a></li>";
										echo "<li><a data-toggle='modal' href='#modal-registro'>Regístrate.</a></li>";
									}
								
								?>
								
							</ul>
						</li>
						<li><a href="#">Version 0.01</a></li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div>
		</nav>
	</header>

	<div class="principal">
	
		<?php 
			//Si no se ha iniciado sesión...
			if(!isset($_SESSION["nombre"])){
				//modal de inicio de sesión.
				echo '<div id="modal-sesion" class="modal fade" role="dialog">
			  	<div class="modal-dialog">
			    	<div class="modal-content">
			      		<div class="modal-header">
			        		<button type="button" class="close" data-dismiss="modal">&times</button>
			        		<h4 class="modal-title">Iniciar sesión</h4>
			      		</div>
			      		<div class="modal-body">
			        		<form role="form" id="formInicioSesion">
								<div class="form-group has-feedback">
									<label for="correo">Correo electronico</label>
									<input type="email" class="form-control" name="email" id="email">
									<span class="glyphicon glyphicon-user form-control-feedback"></span>
								</div>

								<div class="form-group has-feedback">
    								<label for="password">Password:</label>
    								<input type="password" class="form-control" name="password" id="password">
    								<span class="glyphicon glyphicon-lock form-control-feedback"></span>
  								</div>
			        		</form>
			        		<div id="mensajeInicioSesion"></div>
			      		</div>
			      		<div class="modal-footer">
			        		<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
			        		<button type="button" class="btn btn-info" onclick="iniciaSesion()" >Entrar</button>

			      		</div>
			    	</div>
			  	</div>
			</div>';

			//modal de registro de usuario
			echo '<div id="modal-registro" class="modal fade" role="dialog">
			  	<div class="modal-dialog">
			    	<div class="modal-content">
			      		<div class="modal-header">
			        		<button type="button" class="close" data-dismiss="modal">&times</button>
			        		<h4 class="modal-title">Registro</h4>
			      		</div>
			      		<div class="modal-body">
			        		<form role="form" id="formRegistroUsuario">
								<div class="form-group ">
									<label for="correo">Correo electronico</label>
									<input type="email" class="form-control" name="emailReg" id="emailReg">
								</div>

								<div class="form-group">
    								<label for="password">Password:</label>
    								<input type="password" class="form-control" name="passwordReg" id="passwordReg">
  								</div>

								<div class="form-group">
    								<label for="nombre">Nombre:</label>
    								<input type="text" class="form-control" name="nombre" id="nombre">
  								</div> 

 								<div class="form-group">
    								<label for="aPaterno">Apellido paterno:</label>
    								<input type="text" class="form-control" name="aPaterno" id="aPaterno">
  								</div>  

 								<div class="form-group">
    								<label for="aMaterno">Apellido materno:</label>
    								<input type="text" class="form-control" name="aMaterno" id="aMaterno">
  								</div>   
 							
			        		</form>
			        		<div id="mensajeRegistro"></div>
			      		</div>
			      		<div class="modal-footer">
			        		<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
			        		<button type="button" class="btn btn-info" onclick="registraUsuario()">Registrarse</button>

			      		</div>
			    	</div>
			  	</div>
			</div>';
			}
		 ?>
		<br><br><br><br><br>
		<div class="container-fluid">
			<div class="row">
				<div  class="col-md-6 col-md-offset-3">
					<h1 class='centrado' data-sr="move 300px , enter top, over 0.5s, reset" ><b>Reserva ahora en los mejores lugares</b></h1>
					<img src="images/img2.png" class="img-responsive" data-sr="wait 0.5s, enter left, reset, scale up 20%" alt="">	
				</div>
			</div>
		</div>

		<br><br><br><br><br><br><br><br><br>

		<div class="row" >
			<div  class="col-md-6 col-md-offset-3">
				<h1 class='centrado' data-sr="move 150px , enter top, over 0.5s, reset" ><b>Los mejores precios de la web</b></h1>
				<img src="images/img1.png" class="img-responsive" data-sr="wait 0.5s, enter left, reset, scale up 20%" alt="">
			</div>
		</div>

		<br><br><br><br><br><br><br><br><br>

		<div class="row" >
			<div  class="col-md-6 col-md-offset-3">
				<h1 class='centrado' data-sr="move 150px , enter top, over 0.5s, reset" ><b>Vive las mejores experiencias</b></h1>
				<img src="images/img3.png" class="img-responsive" data-sr="wait 0.5s, enter left, reset, scale up 20%" alt="">
			</div>
		</div>
		
		<br><br><br><br><br><br><br><br><br>

	</div>

	<footer data-sr="enter bottom, move 50px, wait 0.3s, reset">
		<div class="row">
			<div class="col-md-2 col-md-offset-5">
			<br>
				<p data-sr="enter bottom, move 50px, wait 0.7s, reset">Copyright Triviajo | Todos los Derechos Reservados ©</p>
			</div>
			<div class="col-md-4">
			<br>
				<span class="icon-twitter social" data-sr="wait 1s, enter top, move 10px, reset"></span>

				<span class="icon-facebook2 social" data-sr="wait 1.3s, enter top, move 10px, reset"></span>

				<span class="icon-instagram social" data-sr="wait 1.6s, enter top, move 10px, reset"></span>

				<span class="icon-whatsapp social" data-sr="wait 1.9s, enter top, move 10px, reset"></span>


			</div>
			
		</div>
	</footer>


	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src='js/scrollReveal.min.js'></script>
	<script src="js/triviajo.js"></script>
    <script>

      var config = {
        mobile : true
      }

      window.sr = new scrollReveal(config);

    </script>

</body>
</html>