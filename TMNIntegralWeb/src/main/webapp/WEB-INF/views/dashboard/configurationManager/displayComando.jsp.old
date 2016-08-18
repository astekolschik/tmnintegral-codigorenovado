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
	<body onload="setMenuValue('configuracion'); setEnableFields(${model.edit}); setTipoEquiposSelectValues(${model.commandObj.deviceTypesIds})">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.htm" id="logo">TMN <em>Integral</em></a></h1>

					<!-- Nav -->
						<%@ include file="/WEB-INF/views/menu.jsp" %>

				</div>
				
				<div class="container">
						<section class="8u 16u(narrower)">
							<h3>Comando</h3>
							<form action="/TMNIntegralWeb/updateComando.htm" method="post" onsubmit="setdtValues();">
								<div class="row 100%">
									<c:if test="${not empty model.commandObj.id_command}">
										<div class="4u 8u(mobilep)">
											<label>Id Comando</label>
										</div>
										<div class="8u 16u(mobilep)">
											<input type="text" id="idCommand" name="idCommand" value="${model.commandObj.id_command}" placeholder="Id Comando" />
										</div>
									</c:if>
									<div class="4u 8u(mobilep)">
										<label>Nombre</label>
									</div>
									<div class="8u 16u(mobilep)">
										<input type="text" id="nameComm" name="nameComm" value="${model.commandObj.command_name}" placeholder="Nombre" />
									</div>
									<div class="4u 8u(mobilep)">
										<label>Comando</label>
									</div>
									<div class="8u 16u(mobilep)">
										<input type="text" id="defaultComm" name="defaultComm" value="${model.commandObj.command}" placeholder="Comando" />
									</div>
									<div class="4u 8u(mobilep)">
										<label>Tipo de Comando</label>
									</div>
									<div class="8u 16u(mobilep)">
										<input type="text" id="tipocomando" name="tipocomando" value="${model.commandObj.command_type}" placeholder="Tipo de Comando" />
									</div>
									<div class="4u 8u(mobilep)">
										<label>Tipos de equipo asociados</label>
									</div>
									<div class="8u 16u(mobilep)">
										<input type="hidden" name="dtValues" id="dtValues"/>
										<select id="dt-select"
												multiple="multiple" 
												style="width: 250px;">
											<c:forEach items="${model.deviceTypes}" var="dt">
												<option value="${dt.id}"><c:out value="${dt.description}"/> </option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row 100%">
									<div class="12u">
										<ul class="actions">
											<li style="display: ${model.displayEdit}">
												<input type="submit" class="button alt" value="Guardar" />
											</li>
											<li><input type="button" class="button alt" value="Volver" onclick="displayListComandos();" /></li>
										</ul>
									</div>
								</div>
							</form>
						</section>
					</div>
				</div>
			

			<!-- Footer -->
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</div>
	</body>
</html>