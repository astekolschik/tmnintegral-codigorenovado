<%@ include file="/WEB-INF/views/index/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TMN Integral - Inicio</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bg-primary">
	<c:if test="${not empty user}">
		<c:redirect url="dashboard/index.htm"></c:redirect>
	</c:if>
	<!-- Menu general -->
	<%@ include file="/WEB-INF/views/index/menu.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="label-primary">
					<h1 class="text-center">TMN Integral</h1>
					<p class="text-center">Solución para gestión de redes</p>
					<img src="img/bgd.jpg" alt="" width="1190" height="655"
						class="img-responsive">
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<h2 class="text-center">Características</h2>
		<hr>
		<div class="row">
			<div class="col-sm-6">
				<div class="thumbnail">
					<img src="img/600X300.gif" alt="Thumbnail Image 1"
						class="img-responsive">
					<div class="caption">
						<h3>Alertas en tiempo real</h3>
						<p>Podrá recibir o ver las alertas en la página principal de
							su red.</p>
						<hr>
						<p>
							<a href="#" class="btn btn-success" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="thumbnail">
					<img src="img/600X300.gif" alt="Thumbnail Image 1"
						class="img-responsive">
					<div class="caption">
						<h3>Gran variedad de reportes</h3>
						<p>A partir de los datos leídos, podrá obtener reportes sobre
							distintos funcionamientos de la red.</p>
						<hr>
						<p>
							<a href="#" class="btn btn-success" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="well" id="ingresar">
		<h2 class="text-left">
			<span class="text-left">Ingresar</span>
		</h2>
		<hr>
		<div class="container">

			<form action="/TMNIntegralWeb/login.htm" method="post"
				class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="usuario">Usuario:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="usuario" name="usuario"
							placeholder="Usuario" style="width: 300px">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password">Contraseña:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password" name="password"
							placeholder="Contraseña" style="width: 300px">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Ingresar</button>
					</div>
				</div>
				<div>
					<a href="/TMNIntegralWeb/olvidePass.htm">Olvide mi contraseña</a>
				</div>
			</form>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6" id="contactenos">
				<h2>Contactenos</h2>
				<address>
					<strong>Nuestra direcciÃ³n</strong><br> Av. De Mayo 866, CABA,
					Argentina
				</address>
				<address>Email: tmnintegral@gmail.com</address>
				<address>Tel: +54 11 5217-7878</address>
				<h4>Formulario de contacto</h4>
				<!--div class="col-xs-2"><img class="img-circle" src="img/32X32.gif" alt=""></div>
      	<div class="col-xs-2"><img class="img-circle" src="img/32X32.gif" alt=""></div>
      	<div class="col-xs-2"><img class="img-circle" src="img/32X32.gif" alt=""></div>
      	<div class="col-xs-2"><img class="img-circle" src="img/32X32.gif" alt=""></div-->
				<form action="/tmnintegral/contacto.htm">
					<div class="form-group">
						<input type="text" name="name" id="name" placeholder="Nombre" />
					</div>
					<div class="form-group">
						<input type="email" name="email" id="email" placeholder="E-mail" />
					</div>
					<div class="form-group">
						<input type="text" name="motivo" id="motivo"
							placeholder="Motivo de Contacto" />
					</div>
					<div class="form-group">
						<textarea name="message" id="message" placeholder="Mensaje"
							rows="5" cols=""></textarea>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-default" value="Enviar" />
					</div>
				</form>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6" id="ubicacion">
				<h2>Encuentrenos</h2>
				<div>
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3283.8025428598326!2d-58.3808433850104!3d-34.609154265292375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bccad19fb651f1%3A0xc79a466a81135fcf!2sUniversidad+Caece!5e0!3m2!1ses-419!2sar!4v1462369223869"
						width="450" height="300" frameborder="0" style="border: 0"
						allowfullscreen></iframe>
				</div>
			</div>

		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-12">
				<h2>Acerca de nosotros</h2>
				<p>TMN Integral nació como un proyecto de la facultad que
					teníamos que terminar :)</p>
			</div>
		</div>
	</div>
	<hr>
	<footer class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<p>Copyright © TMN Integral. All rights reserved.</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
