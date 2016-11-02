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
				<ul class="nav nav-tabs" id="equipoTabs">
					<li class="active"><a href="#listaequipos" data-toggle="tab">Listado de equipos</a></li>
					<li class="disabled" id="nuevoequipotab"><a href="#nuevoequipo" data-toggle="tab">Agregar equipo</a></li>
					<li class="disabled" id="editarequipotab"><a href="#editarequipo" data-toggle="tab">Editar equipo</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="listaequipos">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Administracion de Equipos</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="equiposTable"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<td>Id</td>
											<td>Descripción</td>
											<td>Host</td>
											<td>IP</td>
											<td>Ver</td>
											<td>Modificar</td>
											<td>Eliminar</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${model.deviceList}" var="device">
											<tr>
												<td>${device.device_id}</td>
												<td>${device.communityRead}</td>
												<td>${device.hostName}</td>
												<td>${device.ip}</td>
												<td style="text-align: center;"><a
													onclick="javascript:displayEquipo(${device.device_id}, false);">
														<i class="fa fa-search"></i>
												</a></td>
												<td style="text-align: center;"><a
													onclick="javascript:displayEquipo(${device.device_id}, true);">
														<i class="fa fa-edit"></i>
												</a></td>
												<td style="text-align: center;">
													<input type="hidden" id="equipoDelId">
													<a data-toggle="modal" data-target="#deleteConfirmModal" data-id="${device.device_id}" class="open-DeleteDeviceDialog"> <i class="fa fa-eraser"></i></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<a href="#" id="goToAgregarEquipo">
									<button type="button" class="btn btn-primary">Agregar</button>
								</a>
							</div>
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="nuevoequipo">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="descripcion" class="col-sm-2 control-label">Descripcion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="descripcion" required="required"
										name="descripcion" placeholder="descripcion">
								</div>
							</div>
							<div class="form-group">
								<label for="hostName" class="col-sm-2 control-label">Nombre del host</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="hostName" required="required"
										name="hostName" placeholder="Nombre del host">
								</div>
							</div>
							<div class="form-group">
								<label for="iosType" class="col-sm-2 control-label">Tipo de IOS</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="iosType" required="required"
										name="iosType" placeholder="Tipo de IOS">
								</div>
							</div>
							<div class="form-group">
								<label for="iosVersion" class="col-sm-2 control-label">Version de IOS</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="iosVersion" required="required"
										name="iosVersion" placeholder="Version de IOS">
								</div>
							</div>
							<div class="form-group">
								<label for="ip" class="col-sm-2 control-label">IP</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="ip" required="required"
										name="ip" placeholder="IP">
								</div>
							</div>
							<div class="form-group">
								<label for="modelo" class="col-sm-2 control-label">Modelo</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="modelo" required="required"
										name="modelo" placeholder="Modelo">
								</div>
							</div>
							<div class="form-group">
								<label for="serialNumber" class="col-sm-2 control-label">Numero de serie</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="serialNumber" required="required"
										name="serialNumber" placeholder="Numero de serie">
								</div>
							</div>
							<div class="form-group">
								<label for="release" class="col-sm-2 control-label">Release</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="release" required="required"
										name="release" placeholder="Release">
								</div>
							</div>
							<div class="form-group">
								<label for="tipoEquipoId" class="col-sm-2 control-label">Tipo de equipo</label>
								<div class="col-sm-10">
									<select class="form-control" id="tipoEquipoId" name="tipoEquipoId">
										<option value="-1">Ninguno</option>
										<c:forEach items="${model.tipoEquipoList}" var="equipo">
											<option value="${equipo.id}">${equipo.typeName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="networkId" class="col-sm-2 control-label">Red</label>
								<div class="col-sm-10">
									<select class="form-control" id="networkId" name="networkId">
										<option value="-1">Ninguno</option>
										<c:forEach items="${model.redesList}" var="net">
											<option value="${net.id_network}">${net.network}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								 <div class="checkbox">
			                        <label for="enabled" class="col-sm-2 control-label">
			                          <input type="checkbox" name="enabled" id="enabled">
			                          Habilitado
			                        </label>
			                      </div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="javascript:agregarEquipo();">Agregar</button>
									<button type="reset" class="btn btn-danger">Limpiar</button>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="editarequipo">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="display-id" class="col-sm-2 control-label">Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-id"
										name="display-id" placeholder="descripcion">
								</div>
							</div>
							<div class="form-group">
								<label for="display-descripcion" class="col-sm-2 control-label">Descripcion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-descripcion" required="required"
										name="display-descripcion" placeholder="descripcion">
								</div>
							</div>
							<div class="form-group">
								<label for="display-hostName" class="col-sm-2 control-label">Nombre del host</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-hostName" required="required"
										name="display-hostName" placeholder="Nombre del host">
								</div>
							</div>
							<div class="form-group">
								<label for="display-iosType" class="col-sm-2 control-label">Tipo de IOS</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-iosType" required="required"
										name="display-iosType" placeholder="Tipo de IOS">
								</div>
							</div>
							<div class="form-group">
								<label for="display-iosVersion" class="col-sm-2 control-label">Version de IOS</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-iosVersion" required="required"
										name="display-iosVersion" placeholder="Version de IOS">
								</div>
							</div>
							<div class="form-group">
								<label for="display-ip" class="col-sm-2 control-label">IP</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-ip" required="required"
										name="display-ip" placeholder="IP">
								</div>
							</div>
							<div class="form-group">
								<label for="display-modelo" class="col-sm-2 control-label">Modelo</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-modelo" required="required"
										name="display-modelo" placeholder="Modelo">
								</div>
							</div>
							<div class="form-group">
								<label for="display-serialNumber" class="col-sm-2 control-label">Numero de serie</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-serialNumber" required="required"
										name="display-serialNumber" placeholder="Numero de serie">
								</div>
							</div>
							<div class="form-group">
								<label for="display-release" class="col-sm-2 control-label">Release</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-release" required="required"
										name="display-release" placeholder="Release">
								</div>
							</div>
							<div class="form-group">
								<label for="display-tipoEquipoId" class="col-sm-2 control-label">Tipo de equipo</label>
								<div class="col-sm-10">
									<select class="form-control" id="display-tipoEquipoId" name="display-tipoEquipoId">
										<option value="-1" selected="selected">Ninguno</option>
										<c:forEach items="${model.tipoEquipoList}" var="equipo">
											<option value="${equipo.id}">${equipo.typeName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="display-networkId" class="col-sm-2 control-label">Red</label>
								<div class="col-sm-10">
									<select class="form-control" id="display-networkId" name="display-networkId">
										<option value="-1" selected="selected">Ninguno</option>
										<c:forEach items="${model.redesList}" var="net">
											<option value="${net.id_network}">${net.network}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								 <div class="checkbox">
			                        <label for="display-enabled" class="col-sm-2 control-label">
			                          <input type="checkbox" name="display-enabled" id="display-enabled">
			                          Habilitado
			                        </label>
			                      </div>
							</div>
							<div class="form-group">
								<label for="display-lastupdate" class="col-sm-2 control-label">Ultima actualizacion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-lastupdate" required="required"
										name="display-lastupdate" disabled="disabled">
								</div>
							</div>
							<div class="form-group" id="button-edition">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="actualizarEquipo();">Guardar</button>
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
					<h4 class="modal-title">Eliminar Equipo</h4>
				</div>
				<div class="modal-body">
					<p>
						Esta seguro que desea eliminar el equipo?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-outline" data-dismiss="modal" onclick="deleteEquipo();">Eliminar</button>
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
					<h4 class="modal-title">El equipo fue eliminado correctamente</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
	<div id="updateConfirmModal" class="modal fade modal-success" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">El equipo fue modificado correctamente</h4>
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
					<h4 class="modal-title">El equipo fue creado correctamente</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
</section>