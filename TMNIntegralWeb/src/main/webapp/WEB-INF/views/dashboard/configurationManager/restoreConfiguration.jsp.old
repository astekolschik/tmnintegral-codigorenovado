<%@ include file="/WEB-INF/views/include.jsp" %>

<%-- Redirected because we can't set the welcome page to a virtual URL. --%>
<!-- c:redirect url="/hello.htm"/-->
<!--
	Arcana by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>TMN Integral - Configuración</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	
	</head>
	<body onload="setMenuValue('configuracion');">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.htm" id="logo">TMN <em>Integral</em></a></h1>

					<!-- Nav -->
						<%@ include file="/WEB-INF/views/menu.jsp" %>

				</div>
				
				<div class="container">
						<section class="12u 24u(narrower)">
							<h3>Restaurar Configuración</h3>
							<div class="row 100%">
								<div class="4u 8u(mobilep)">
									<label>Comando</label>
								</div>
								<div class="8u 16u(mobilep)">
									<select id="select-comando" style="width: 120px;">
										<c:forEach items="${model.commands}" var="c">
											<option value="${c.id_command}"><c:out value="${c.command_name}"></c:out></option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row 100%">
								<div class="4u 8u(mobilep)">
									<label>Dispositivo</label>
								</div>
								<div class="8u 16u(mobilep)">
									<!-- select id="select-dispositivo">
										<c:forEach items="${model.devices}" var="d">
											<option value="${c.id_command}"><c:out value="${c.command}"></c:out></option>
										</c:forEach>
									</select-->
								</div>
							</div>
							<div class="row 100%">
								<ul class="actions">
									<li><input type="button" class="button alt" value="Restaurar" onclick="restoreDevice();" /></li>
								</ul>
							</div>
						</section>
					</div>
				</div>
			

			<!-- Footer -->
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</div>
	</body>
</html>