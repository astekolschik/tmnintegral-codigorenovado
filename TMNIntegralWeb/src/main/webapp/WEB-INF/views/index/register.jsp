<%@ include file="/WEB-INF/views/index/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TMN Integral - Ingresar</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- Menu general -->
	<%@ include file="/WEB-INF/views/index/menu.jsp"%>

	<div class="well" id="ingresar">
		<h2 class="text-left">
			<span class="text-left">Información del Usuario</span>
		</h2>
		<hr>
		<div class="container">
			<c:if test="${not empty model.status}">
				<c:if test="${model.statusType eq 'OK'}">
					<div class="alert alert-success">
			 			 <strong><c:out value="${model.status}" default=""/></strong>
					</div>
				</c:if>
				<c:if test="${model.statusType eq 'ERROR'}">
					<div class="alert alert-danger">
			 			 <strong><c:out value="${model.status}" default=""/></strong>
					</div>
				</c:if>
			</c:if>
			<form action="/TMNIntegralWeb/register.htm" method="post"
				class="form-horizontal" onsubmit="return createUserValidate();">
				<div class="form-group">
					<label class="control-label col-sm-2" for="usuario">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre"
								required="required" style="width: 300px"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="apellido">Apellido:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="apellido" id="apellido" placeholder="Apellido"
								required="required" style="width: 300px"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">E-Mail:</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="email" name="email"
							placeholder="E-Mail" required="required" style="width: 300px">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="usuario">Usuario:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="usuario" name="usuario"
							placeholder="Usuario" required="required" style="width: 300px">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password">Contraseña:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password" name="password"
							placeholder="Contraseña" required="required" style="width: 300px">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password2">Repita contraseña:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password2" name="password2"
							placeholder="Contraseña" required="required" style="width: 300px">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Guardar</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>