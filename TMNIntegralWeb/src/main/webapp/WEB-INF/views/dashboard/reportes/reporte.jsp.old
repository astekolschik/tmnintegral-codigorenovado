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
		<title>TMN Integral - Reportes</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body onload="setMenuValue('reportes'); generarGrafico(${model.reportData});fillTable(${model.reportData});paginateTable('reporte-table');">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.htm" id="logo">TMN <em>Integral</em></a></h1>

					<!-- Nav -->
						<%@ include file="/WEB-INF/views/menu.jsp" %>

				</div>
				
				<div class="container">
						<h3>Reporte</h3>
						<section style="width: 1400px">
							<div class="row" style="width: 1300px;height: 700px; margin-left: 30px;" id="div-reporte">
							</div>
						</section>
						<h3>Información detallada</h3>
						<section style="width: 1400px">
							<div class="row" style="width: 1000px;height: 700px; margin-left: 30px;">
								<table id="reporte-table">
									<thead>
										<tr>
											<td>Nombre del equipo</td>
											<td>Fecha</td>
											<td>Valor</td>
										</tr>
									</thead>
									<tbody>
									
										<c:forEach items="${model.reportData}" var="eqs">
									<%-- 		<c:forEach items="${eqs.Data}" var="eqData">
												<tr>
													<td><c:out value="${eqs.Equipment}"></c:out> </td>
													<td>${eqData.Date}</td>
													<td>${eqData.Value}</td>
												</tr>
											</c:forEach> --%>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</section>
					</div>
				</div>
			

			<!-- Footer -->
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</div>
	</body>
</html>