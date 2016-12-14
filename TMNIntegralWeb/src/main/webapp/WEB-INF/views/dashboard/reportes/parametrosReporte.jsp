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
	<div class="row">
		<div>
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs" id="reportesTab">
					<li class="active"><a href="#parametrosReporte" data-toggle="tab">Parametros del reporte</a></li>
					<li><a href="#reporte" data-toggle="tab">Reporte</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="parametrosReporte">
						<div class="box box-primary">
							<form method="post" role="form" action="">
								<div class="form-group">
									<label>Tipo de Reporte</label> <select class="form-control" id="tipo-reporte" name="tipo-reporte">
										<option value="-1">Ninguno</option>
										<c:forEach items="${model.reportList}" var="repName">
											<option value="${repName[0]}">${repName[1]}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>Equipos</label> <input type="hidden"
										name="lista-equipos-value" id="lista-equipos-value"> <select
										class="form-control" multiple id="nombre-equipo"
										name="nombre-equipo">
										<c:forEach items="${model.devices}" var="equipo">
											<option value="${equipo.ip}_${equipo.hostName}">${equipo.hostName}
												(${equipo.ip}_${equipo.hostName})</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>Interfaces</label> <input type="hidden"
										name="lista-interfaces-value" id="lista-interfaces-value"> <select
										class="form-control" multiple id="nombre-interface"
										name="nombre-interface">
										<c:forEach items="${model.interfaces}" var="i">
											<option value="${i.device.ip}_${i.device.hostName}_${i.name}">${i.name}
												(${i.device.ip}_${i.device.hostName}_${i.name})</option>
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
										<button type="reset" class="btn btn-danger" onclick="javascript:limpiarValoresReporte();">Limpiar</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="reporte">
						<h3>Reporte</h3>
						<h4>Puede cambiar el tipo de reporte seleccionando de las opciones listadas debajo</h4>
						<div>
							<input type="radio" name="radio-reporte" value="lineal" checked="checked" onchange="displayReportSelected();">Lineal</input>
							<input type="radio" name="radio-reporte" value="columna" onchange="displayReportSelected();">Columnas</input>
							<input type="radio" name="radio-reporte" value="torta" onchange="displayReportSelected();">Torta</input>
							<input type="radio" name="radio-reporte" value="tabla" onchange="displayReportSelected();">Tabla</input>
						</div>
						<div class="box" id="reporte-lineal">
							<div id="report-content-lineal-toolbar"></div>
							<div id="report-content-lineal"></div>
						</div>
						<div class="box" id="reporte-columna" style="display: none;">
							<div id="report-content-columna-toolbar"></div>
							<div id="report-content-columna"></div>
						</div>
						<div class="box" id="reporte-torta" style="display: none;">
							<div id="report-content-torta-toolbar"></div>
							<div id="report-content-torta"></div>
						</div>
						<div class="box" id="reporte-tabla" style="display: none;">
							<div id="report-content-tabla-toolbar"></div>
							<div id="report-content-tabla">
								<table id="report-content-tabla-table" style="font-size: small"
									class="table table-bordered table-striped"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="validationModal" class="modal fade modal-danger" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Error en la validacion:</h4>
					<label id="validation-modal-error"/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
</section> 
