<%@ include file="/WEB-INF/views/index/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TMN Integral - Inicio</title>

<!-- Bootstrap -->

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" href="css/TMNIntegral.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 100%;
            margin: auto;
        }
    </style>
</head>
<body>
	<c:if test="${not empty user}">
		<c:redirect url="dashboard/index.htm"></c:redirect>
	</c:if>
	<!-- Menu general -->
	<%@ include file="/WEB-INF/views/index/menu.jsp"%>
	
 <div id="main">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">

            <div class="item active">
                <img src="img/1.jpg" alt="Chania">
            </div>

            <div class="item">
                <img src="img/2.jpg" alt="Chania">
            </div>

            <div class="item">
                <img src="img/3.jpg" alt="Flower">
            </div>


        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>

        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>

    </div>
<!--     <footer> -->

<!-- 		<ul> -->
<!-- 			<li id= "li1"> -->
<!-- 				<p class="encuentrenos">Encuentrenos</p> -->
	
<!-- 				<ul> -->
<!-- 				<div> -->
<!-- 					<iframe -->
<!-- 						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3283.8025428598326!2d-58.3808433850104!3d-34.609154265292375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bccad19fb651f1%3A0xc79a466a81135fcf!2sUniversidad+Caece!5e0!3m2!1ses-419!2sar!4v1462369223869" -->
<!-- 						width="450" height="300" style="border: 0"></iframe> -->
<!-- 				</div> -->
<!-- 				</ul> -->
<!-- 			</li> -->
<!-- 			<li id="li2"> -->
<!-- 				<p class="reachus">Contactenos</p> -->
	
<!-- 				<ul> -->
<!-- 					<li><address> -->
<!-- 					<strong>Nuestra dirección</strong><br> Av. De Mayo 866, CABA, Argentina</address></li> -->
<!-- 					<li><address>Email: tmnintegral@gmail.com</address></li> -->
<!-- 					<li><address>Tel: +54 11 5217-7878</address></li> -->
					
<!-- 				</ul>	 -->
<!-- 			</li>		 -->
<!-- 			<li id= "li3"> -->
<!-- 				<p class= "formulario">Formulario</p> -->
<!-- 				<ul> -->
<!-- 					<form action="/tmnintegral/contacto.htm"> -->
<!-- 						<li><div class="form-group"> -->
<!-- 							<input type="text" name="name" id="name"  placeholder="Nombre" style="width: 90%"/> -->
<!-- 						</div> -->
<!-- 						</li> -->
<!-- 						<li><div class="form-group"> -->
<!-- 							<input type="email" name="email" id="email" placeholder="E-mail" style="width: 90%"/> -->
<!-- 						</div></li> -->
<!-- 						<li><div class="form-group"> -->
<!-- 							<input type="text" name="motivo" id="motivo"  -->
<!-- 								placeholder="Motivo de Contacto" style="width: 90%"/> -->
<!-- 						</div></li> -->
<!-- 						<li><div class="form-group"> -->
<!-- 							<textarea name="message" id="message"  placeholder="Mensaje" style="width: 90%" -->
<!-- 								rows="5" cols=""></textarea> -->
<!-- 						</div></li> -->
<!-- 						<li><div class="form-group"> -->
<!-- 							<input type="submit" class="btn btn-default" value="Enviar" /> -->
<!-- 						</div></li> -->
<!-- 					</form> -->
<!-- 					</ul> -->
<!-- 			     </li> -->
			  
<!-- 		</ul> -->
<!-- 	</footer> -->
</div>
</body>
</html>
</body>
</html>