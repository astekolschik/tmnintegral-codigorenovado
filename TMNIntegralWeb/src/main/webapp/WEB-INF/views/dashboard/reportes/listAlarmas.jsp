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
				<ul class="nav nav-tabs" id="alarmasTabs">
					<li class="active"><a href="#listaAlarmas" data-toggle="tab">Listado de alarmas</a></li>
					<li class="disabled" id="nuevaalarmaTab"><a href="#nuevaalarma" data-toggle="tab">Agregar alarma</a></li>
					<li class="disabled" id="editaralarmaTab"><a href="#editaralarma" data-toggle="tab">Editar alarma</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="listaAlarmas">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Administracion de Alarmas configuradas</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="alarmasTable"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<td>Id</td>
											<td>Variable</td>
											<td>Objeto</td>
											<td>Ver</td>
											<td>Eliminar</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${model.alarmasList}" var="a">
											<tr>
												<td>${a.id}</td>
												<td>${a.idVariable}</td>
												<td>
													<c:if test="${not empty a.device}">
														Equipo: ${a.device.hostName}
													</c:if>
													<c:if test="${not empty a.interfaz}">
														Interfaz: ${a.interfaz.name}
													</c:if>
												</td>
												<td style="text-align: center;"><a
													onclick="javascript:displayAlarma(${a.id});">
														<i class="fa fa-search"></i>
												</a></td>
												<td style="text-align: center;">
													<input type="hidden" id="alarmDelId">
													<a data-toggle="modal" data-target="#deleteConfirmModal" data-id="${a.id}" class="open-DeleteAlarmDialog"> <i class="fa fa-eraser"></i></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<a href="#" id="goToAgregarAlarma">
									<button type="button" class="btn btn-primary">Agregar</button>
								</a>
							</div>
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="nuevaalarma">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="variable" class="col-sm-2 control-label">Variable</label>
								<div class="col-sm-10">
									<select id="variable" name="variable">
										<option selected="selected">Seleccione la variable</option>
										<c:forEach items="${model.variablesList}" var="variable">
											<option value="${variable[0]}">${variable[1]}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="nombre" class="col-sm-2 control-label">Tipo de objeto</label>
								<div class="col-sm-10">
									<input type="radio" id="radio-obj" name="radio-obj" value="interface" onchange="javascript:displayComboNew()">Interface</input>
									<input type="radio" id="radio-obj" name="radio-obj" value="device" onchange="javascript:displayComboNew()">Equipo</input>
								</div>
							</div>
							<div class="form-group" style="display: none;" id="combo-device">
								<label for="device" class="col-sm-2 control-label">Equipo</label>
								<div class="col-sm-10">
									<select id="device" name="device">
										<option selected="selected">Seleccione el equipo</option>
										<c:forEach items="${model.deviceList}" var="device">
											<option value="${device.device_id}">${device.hostName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group" style="display: none;" id="combo-interface">
								<label for="interface" class="col-sm-2 control-label">Interfaz</label>
								<div class="col-sm-10">
									<select id="interface" name="interface">
										<option selected="selected">Seleccione la interfaz</option>
										<c:forEach items="${model.interfacesList}" var="i">
											<option value="${i.id}">${i.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="destinatarios" class="col-sm-2 control-label">Destinatarios(separados por ;)</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="destinatarios" required="required"
										name="destinatarios" placeholder="Destinatarios">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="javascript:agregarAlarma();">Agregar</button>
									<button type="reset" class="btn btn-danger">Limpiar</button>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="editaralarma">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="variable-display" class="col-sm-2 control-label">Variable</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="variable-display" required="required"
										name="variable-display" placeholder="Objeto" disabled="disabled">
								</div>
							</div>
							<div class="form-group">
								<label for="Objeto-display" class="col-sm-2 control-label">Objeto</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="Objeto-display" required="required"
										name="Objeto-display" placeholder="Objeto" disabled="disabled">
								</div>
							</div>
							<div class="form-group">
								<label for="destinatarios-display" class="col-sm-2 control-label">Destinatarios</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="destinatarios-display" required="required"
										name="destinatarios-display" placeholder="Destinatarios" disabled="disabled">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="deleteConfirmModal" class="modal fade modal-danger" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Eliminar Alarma</h4>
				</div>
				<div class="modal-body">
					<p>
						Esta seguro que desea eliminar la alarma?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-outline" data-dismiss="modal" onclick="deleteAlarma();">Eliminar</button>
				</div>
			</div>
		</div>
	</div>
	<div id="delConfirmModal" class="modal fade modal-success" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">La alarma fue eliminada correctamente</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
	<div id="createConfirmModal" class="modal fade modal-success" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">La alarma fue creada correctamente</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
</section>