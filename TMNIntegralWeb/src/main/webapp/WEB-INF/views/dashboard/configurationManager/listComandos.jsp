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
				<ul class="nav nav-tabs" id="commandTabs">
					<li class="active"><a href="#listacomandos" data-toggle="tab">Listado de Comandos</a></li>
					<li class="disabled" id="nuevocomandotab"><a href="#nuevocomando" data-toggle="tab">Agregar comando</a></li>
					<li class="disabled" id="editarcomandotab"><a href="#editarcomando" data-toggle="tab">Editar comando</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="listacomandos">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Administracion de comandos</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="comandosTable"
									style="font-size: small"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<td>Nombre</td>
											<td>Tipo</td>
											<td>Operacion</td>
											<td>Ver</td>
											<td>Modificar</td>
											<td>Eliminar</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${model.commandList}" var="command">
											<tr>
												<td>${command.key.fieldName}</td>
												<td>${command.type}</td>
												<td>${command.operation}</td>
												<td style="text-align: center;"><a
													onclick="javascript:displayCommand('${command.key.idVariable}','${command.key.idDeviceType}','${command.key.fieldName}', false);">
														<i class="fa fa-search"></i>
												</a></td>
												<td style="text-align: center;"><a
													onclick="javascript:displayCommand('${command.key.idVariable}','${command.key.idDeviceType}','${command.key.fieldName}', true);">
														<i class="fa fa-edit"></i>
												</a></td>
												<td style="text-align: center;">
													<input type="hidden" id="commandDelId">
													<a data-toggle="modal" data-target="#deleteConfirmModal" data-id="${command.key.idVariable},${command.key.idDeviceType},${command.key.fieldName}" class="open-DeleteCommandDialog"> <i class="fa fa-eraser"></i></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<a href="#" id="goToAgregarCommand">
									<button type="button" class="btn btn-primary">Agregar</button>
								</a>
							</div>
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="nuevocomando">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="variable" class="col-sm-2 control-label">Variable *</label>
								<div class="col-sm-10">
									<select id="variable" name="variable">
										<option selected="selected" value="-1">Seleccione la variable</option>
										<c:forEach items="${model.variablesList}" var="variable">
											<option value="${variable[0]}">${variable[1]}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="tipoequipo" class="col-sm-2 control-label">Tipo de equipo *</label>
								<div class="col-sm-10">
									<select id="tipoequipo" name="tipoequipo">
										<option selected="selected" value="-1">Seleccione el tipo de equipo</option>
										<c:forEach items="${model.tipoEquipoList}" var="te">
											<option value="${te.id}">${te.typeName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="fieldname" class="col-sm-2 control-label">Nombre del campo *</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="fieldname" required="required"
										name="fieldname" placeholder="Nombre del campo" maxlength="255">
								</div>
							</div>
							<div class="form-group">
								<label for="type" class="col-sm-2 control-label">Tipo *</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="type" required="required"
										name="type" placeholder="Tipo" maxlength="255">
								</div>
							</div>
							<div class="form-group">
								<label for="regex" class="col-sm-2 control-label">Expresion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="regex" required="required"
										name="regex" placeholder="Expresion" maxlength="255">
								</div>
							</div>
							<div class="form-group">
								<label for="operation" class="col-sm-2 control-label">Operacion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="operation" required="required"
										name="operation" placeholder="Operacion" maxlength="255">
								</div>
							</div>
							<div class="form-group">
								<div class="checkbox">
			                        <label for="enabled" class="col-sm-2 control-label">
			                          <input type="checkbox" name="isdevice" id="isdevice">
			                          Es para equipo? *
			                        </label>
			                      </div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="javascript:agregarComando();">Agregar</button>
									<button type="reset" class="btn btn-danger">Limpiar</button>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="editarcomando">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="variable-display" class="col-sm-2 control-label">Variable</label>
								<div class="col-sm-10">
									<select id="variable-display" name="variable-display">
										<option selected="selected" value="-1">Seleccione la variable *</option>
										<c:forEach items="${model.variablesList}" var="variable">
											<option value="${variable[0]}">${variable[1]}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="tipoequipo-display" class="col-sm-2 control-label">Tipo de equipo *</label>
								<div class="col-sm-10">
									<select id="tipoequipo-display" name="tipoequipo-display">
										<option selected="selected" value="-1">Seleccione el tipo de equipo</option>
										<c:forEach items="${model.tipoEquipoList}" var="te">
											<option value="${te.id}">${te.typeName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="fieldname-display" class="col-sm-2 control-label">Nombre del campo *</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="fieldname-display" required="required"
										name="fieldname-display" placeholder="Nombre del campo">
								</div>
							</div>
							<div class="form-group">
								<label for="type-display" class="col-sm-2 control-label">Tipo *</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="type-display" required="required"
										name="type-display" placeholder="Tipo">
								</div>
							</div>
							<div class="form-group">
								<label for="regex-display" class="col-sm-2 control-label">Expresion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="regex-display" required="required"
										name="regex-display" placeholder="Expresion">
								</div>
							</div>
							<div class="form-group">
								<label for="operation-display" class="col-sm-2 control-label">Operacion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="operation-display" required="required"
										name="operation-display" placeholder="Operacion">
								</div>
							</div>
							<div class="form-group">
								<div class="checkbox">
			                        <label for="isdevice-display" class="col-sm-2 control-label">
			                          <input type="checkbox" name="isdevice-display" id="isdevice-display">
			                          Es para equipo? *
			                        </label>
			                      </div>
							</div>
							<div class="form-group" id="button-edition">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="actualizarComando();">Guardar</button>
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
					<h4 class="modal-title">Eliminar Comando</h4>
				</div>
				<div class="modal-body">
					<p>
						Esta seguro que desea eliminar el comando?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-outline" data-dismiss="modal" onclick="deleteComando();">Eliminar</button>
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
					<h4 class="modal-title">El comando fue eliminado correctamente</h4>
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
					<h4 class="modal-title">El comando fue modificado correctamente</h4>
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
					<h4 class="modal-title">El comando fue creado correctamente</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
</section>