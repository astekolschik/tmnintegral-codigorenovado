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
				<ul class="nav nav-tabs" id="interfacesTabs">
					<li class="active"><a href="#listaInterfaces" data-toggle="tab">Listado de interfaces</a></li>
					<li class="disabled" id="nuevaInterfazTab"><a href="#nuevaInterfaz" data-toggle="tab">Agregar Interfaz</a></li>
					<li class="disabled" id="editarInterfazTab"><a href="#editarInterfaz" data-toggle="tab">Editar Interfaz</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="listaInterfaces">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Administracion de Interfaces</h3>
							</div>
							<a href="#" id="goToAgregarInterface">
								<button type="button" class="btn btn-primary">Agregar</button>
							</a>
							<br/>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="interfacesTable"
									style="font-size: small"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<td>Id</td>
											<td>Status</td>
											<td>Descripcion</td>
											<td>Equipo</td>
											<td>Ver</td>
											<td>Modificar</td>
											<td>Eliminar</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${model.interfaceList}" var="inter">
											<tr>
												<td>${inter.id}</td>
												<td>${inter.adminStatus}</td>
												<td>${inter.name}</td>
												<td>${inter.device.hostName}</td>
												<td style="text-align: center;"><a
													onclick="javascript:displayInterfaz(${inter.id}, false);">
														<i class="fa fa-search"></i>
												</a></td>
												<td style="text-align: center;"><a
													onclick="javascript:displayInterfaz(${inter.id}, true);">
														<i class="fa fa-edit"></i>
												</a></td>
												<td style="text-align: center;">
													<input type="hidden" id="interfaceDelId">
													<a data-toggle="modal" data-target="#deleteConfirmModal" data-id="${inter.id}" class="open-DeleteInterfaceDialog"> <i class="fa fa-eraser"></i></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="nuevaInterfaz">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="nombre" class="col-sm-2 control-label">Nombre *</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="nombre" required="required"
										name="nombre" placeholder="Nombre" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="status" class="col-sm-2 control-label">Status</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="status" required="required"
										name="status" placeholder="Status" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="alias" class="col-sm-2 control-label">Alias</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="alias" required="required"
										name="alias" placeholder="Alias" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="shelf" class="col-sm-2 control-label">Shelf</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="shelf" required="required"
										name="shelf" placeholder="Shelf">
								</div>
							</div>
							<div class="form-group">
								<label for="slot" class="col-sm-2 control-label">Slot</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="slot" required="required"
										name="slot" placeholder="Slot">
								</div>
							</div>
							<div class="form-group">
								<label for="puerto" class="col-sm-2 control-label">Puerto</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="puerto" required="required"
										name="puerto" placeholder="Puerto">
								</div>
							</div>
							<div class="form-group">
								<label for="subpuerto" class="col-sm-2 control-label">Sub Puerto</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="subpuerto" required="required"
										name="subpuerto" placeholder="Sub Puerto">
								</div>
							</div>
							<div class="form-group">
								<label for="tipo" class="col-sm-2 control-label">Tipo</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="tipo" required="required"
										name="tipo" placeholder="Tipo" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="idDevice" class="col-sm-2 control-label">Equipo *</label>
								<div class="col-sm-10">
									<select class="form-control" id="idDevice" name="idDevice">
										<option value="-1">Ninguno</option>
										<c:forEach items="${model.equiposList}" var="equipo">
											<option value="${equipo.device_id}">${equipo.hostName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="ifIndex" class="col-sm-2 control-label">IF Index</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="ifIndex" required="required"
										name="ifIndex" placeholder="if Index">
								</div>
							</div>
							<div class="form-group">
								<label for="ifIndexIp" class="col-sm-2 control-label">IF Index IP</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="ifIndexIp" required="required"
										name="ifIndexIp" placeholder="if Index IP" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="mac" class="col-sm-2 control-label">MAC</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mac" required="required"
										name="mac" placeholder="MAC" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="ipnexthop" class="col-sm-2 control-label">Ip del proximo salto</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="ipnexthop" required="required"
										name="ipnexthop" placeholder="Ip del proximo salto" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="macnexthop" class="col-sm-2 control-label">MAC del proximo salto</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="macnexthop" required="required"
										name="macnexthop" placeholder="MAC del proximo salto" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="javascript:agregarInterface();">Agregar</button>
									<button type="reset" class="btn btn-danger">Limpiar</button>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="editarInterfaz">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="descripcion" class="col-sm-2 control-label">Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-id"
										name="descripcion" placeholder="descripcion" disabled="disabled">
								</div>
							</div>
							<div class="form-group">
								<label for="display-name" class="col-sm-2 control-label">Nombre *</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-nombre" required="required"
										name="display-nombre" placeholder="Nombre" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="display-status" class="col-sm-2 control-label">Status</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-status" required="required"
										name="display-status" placeholder="Status" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="display-alias" class="col-sm-2 control-label">Alias</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-alias" required="required"
										name="display-alias" placeholder="Alias" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="display-shelf" class="col-sm-2 control-label">Shelf</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="display-shelf" required="required"
										name="display-shelf" placeholder="Shelf">
								</div>
							</div>
							<div class="form-group">
								<label for="display-slot" class="col-sm-2 control-label">Slot</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="display-slot" required="required"
										name="display-slot" placeholder="Slot">
								</div>
							</div>
							<div class="form-group">
								<label for="display-puerto" class="col-sm-2 control-label">Puerto</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="display-puerto" required="required"
										name="display-puerto" placeholder="Puerto">
								</div>
							</div>
							<div class="form-group">
								<label for="display-subpuerto" class="col-sm-2 control-label">Sub Puerto</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="display-subpuerto" required="required"
										name="display-subpuerto" placeholder="Sub Puerto">
								</div>
							</div>
							<div class="form-group">
								<label for="display-tipo" class="col-sm-2 control-label">Tipo</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-tipo" required="required"
										name="display-tipo" placeholder="Tipo" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="display-idDevice" class="col-sm-2 control-label">Equipo *</label>
								<div class="col-sm-10">
									<select class="form-control" id="display-idDevice" name="display-idDevice">
										<option value="-1">Ninguno</option>
										<c:forEach items="${model.equiposList}" var="equipo">
											<option value="${equipo.device_id}">${equipo.hostName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="display-ifIndex" class="col-sm-2 control-label">IF Index</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="display-ifIndex" required="required"
										name="display-ifIndex" placeholder="if Index">
								</div>
							</div>
							<div class="form-group">
								<label for="display-ifIndexIp" class="col-sm-2 control-label">IF Index IP</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-ifIndexIp" required="required"
										name="display-ifIndexIp" placeholder="if Index IP" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="display-mac" class="col-sm-2 control-label">MAC</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-mac" required="required"
										name="display-mac" placeholder="MAC" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="display-ipnexthop" class="col-sm-2 control-label">Ip del proximo salto</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-ipnexthop" required="required"
										name="display-ipnexthop" placeholder="Ip del proximo salto" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="display-macnexthop" class="col-sm-2 control-label">MAC del proximo salto</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-macnexthop" required="required"
										name="display-macnexthop" placeholder="MAC del proximo salto" maxlength="50">
								</div>
							</div>
							<div class="form-group">
								<label for="display-lastupdate" class="col-sm-2 control-label">Ultima Actualizacion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-lastupdate" required="required"
										name="display-lastupdate" placeholder="MAC del proximo salto" disabled="disabled">
								</div>
							</div>
							<div class="form-group" id="button-edition">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="actualizarInterfaz();">Guardar</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="deleteConfirmModal" class="modal fade modal-warning" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Eliminar Interfaz</h4>
				</div>
				<div class="modal-body">
					<p>
						Esta seguro que desea eliminar la interfaz?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-outline" data-dismiss="modal" onclick="deleteInterface();">Eliminar</button>
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
					<h4 class="modal-title">La interfaz fue eliminada correctamente</h4>
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
					<h4 class="modal-title">La interfaz fue modificada correctamente</h4>
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
					<h4 class="modal-title">La interfaz fue creada correctamente</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
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