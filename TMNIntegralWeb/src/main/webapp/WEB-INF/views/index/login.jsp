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
 <link rel="stylesheet" href="css/TMNIntegral.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- Menu general -->

	<div class="col-md-6 col-md-offset-3" id="ingresar">
		<h2 class="text-center">
			 <a id="loginlink" href="index.htm"><span><b>TMN</b> Integral</span></a>
		</h2>
		<hr>
		<div class="container">
			<c:if test="${not empty model.status}">
				<div class="alert alert-danger">
		 			 <strong><c:out value="${model.status}" default=""/></strong>
				</div>
			</c:if>
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
					<label class="control-label col-sm-2" for="password">Contraseņa:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password" name="password"
							placeholder="Contraseņa" style="width: 300px">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Ingresar</button>
					</div>
				</div>
				<div class="col-md-6 col-md-offset-3">
					<a href="/TMNIntegralWeb/olvidePass.htm">Olvide mi contraseņa</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>