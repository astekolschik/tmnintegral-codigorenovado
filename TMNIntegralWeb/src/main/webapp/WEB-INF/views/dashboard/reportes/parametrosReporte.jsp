<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Content Wrapper. Contains page content -->
<!-- <div class="content-wrapper">
	Content Header (Page header)
	<section class="content-header">
		<h1>User Profile</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">User profile</li>
		</ol>
	</section>

	Main content
 -->
<section class="content">
	<div class="box">
		<div class="box box-primary">
			<h3>Parámetros del reporte</h3>
				<form method="post" role="form" action="">
					<div class="form-group">
						<label>Tipo de Reporte</label> <select class="form-control" id="tipo-reporte" name="tipo-reporte">
							<option value="-1">Ninguno</option>
							<option value="1">Memoria disponible</option>
							<option value="2">Memoria utilizada</option>
							<option value="3">Tráfico entrante</option>
							<option value="4">Tráfico saliente</option>
							<option value="5">Utilización CPU</option>
						</select>
					</div>
					<div class="form-group">
						<label>Equipos</label> <input type="hidden"
							name="lista-equipos-value" id="lista-equipos-value"> <select
							class="form-control" multiple id="nombre-equipo"
							name="nombre-equipo">
							<c:forEach items="${model.devices}" var="equipo">
								<option value="${equipo.device_id}">${equipo.hostName}
									(${equipo.ip})</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label>Fecha desde</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="date" class="form-control pull-right"
								name="fecha-desde" id="fecha-desde">
						</div>
					</div>
					<div class="form-group">
						<label>Fecha hasta</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="date" class="form-control pull-right"
								name="fecha-hasta" id="fecha-hasta">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-danger"
								onclick="javascript:generarReporte();">Generar</button>
							<button type="reset" class="btn btn-danger">Limpiar</button>
						</div>
					</div>
				</form>
		</div>
	</div>
</section>
<!-- /.content -->
<!-- </div> -->
<!-- /.content-wrapper -->
