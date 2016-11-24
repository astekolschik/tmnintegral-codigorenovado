<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content">
	<div class="row">
		<div>
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs" id="tipoEquipoTabs">
					<li class="active"><a href="#listaequipos" data-toggle="tab">Listado de tipos de equipo</a></li>
					<!-- <li class="disabled" id="nuevoequipotab"><a href="#nuevoequipo" data-toggle="tab">Agregar tipo de equipo</a></li> -->
					<li class="disabled" id="editarequipotab"><a href="#editarequipo" data-toggle="tab">Ver tipo de equipo</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="listaequipos">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Administracion de Tipos de Equipos</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="tipoEquiposTable"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<td>Id</td>
											<td>Descripción</td>
											<td>Comando default</td>
											<td>SNMP Version default</td>
											<td>Driver</td>
											<td>Tecnología</td>
											<td>Vendor</td>
											<td>Ver</td>
<!-- 											<td>Modificar</td>
											<td>Eliminar</td> -->
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${model.tipoEquipoList}" var="te">
											<tr>
												<td>${te.id}</td>
												<td>${te.description}</td>
												<td>${te.default_comm_read}</td>
												<td>${te.default_snmp_version}</td>
												<td>${te.driver}</td>
												<td>${te.technology}</td>
												<td>${te.vendor}</td>
												<td style="text-align: center;"><a
													onclick="javascript:displayTipoEquipo(${te.id}, false);">
														<i class="fa fa-search"></i>
												</a></td>
												<%-- <td style="text-align: center;"><a
													onclick="javascript:displayTipoEquipo(${te.id}, true);">
														<i class="fa fa-edit"></i>
												</a></td>
												<td style="text-align: center;">
													<input type="hidden" id="tipoEquipoDelId">
													<a data-toggle="modal" data-target="#deleteConfirmModal" data-id="${te.id}" class="open-DeleteDialog"> <i class="fa fa-eraser"></i></a>
												</td> --%>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- <a href="#" id="goToAgregarTipoEquipo">
									<button type="button" class="btn btn-primary">Agregar</button>
								</a> -->
							</div>
						</div>
					</div>
					<!-- /.tab-pane -->
					<!-- <div class="tab-pane" id="nuevoequipo">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="descripcion" class="col-sm-2 control-label">Descripcion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="descripcion" required="required"
										name="descripcion" placeholder="descripcion">
								</div>
							</div>
							<div class="form-group">
								<label for="defaultComm" class="col-sm-2 control-label">Default Comm</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="defaultComm" required="required"
										name="defaultComm" placeholder="Default Comm">
								</div>
							</div>
							<div class="form-group">
								<label for="defaultSNMP" class="col-sm-2 control-label">Default SNMP</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="defaultSNMP" required="required"
										name="defaultSNMP" placeholder="Default SNMP">
								</div>
							</div>
							<div class="form-group">
								<label for="driver" class="col-sm-2 control-label">Driver</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="driver" required="required"
										name="driver" placeholder="Driver">
								</div>
							</div>
							<div class="form-group">
								<label for="technology" class="col-sm-2 control-label">Technology</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="technology" required="required"
										name="technology" placeholder="Technology">
								</div>
							</div>
							<div class="form-group">
								<label for="vendor" class="col-sm-2 control-label">Vendor</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="vendor" required="required"
										name="vendor" placeholder="Vendor">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="javascript:agregarTipoEquipo();">Agregar</button>
									<button type="reset" class="btn btn-danger">Limpiar</button>
								</div>
							</div>
						</form>
					</div> -->
					<div class="tab-pane" id="editarequipo">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="descripcion" class="col-sm-2 control-label">Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-id"
										name="descripcion" placeholder="descripcion">
								</div>
							</div>
							<div class="form-group">
								<label for="descripcion" class="col-sm-2 control-label">Descripcion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-descripcion"
										name="descripcion" placeholder="descripcion">
								</div>
							</div>
							<div class="form-group">
								<label for="defaultComm" class="col-sm-2 control-label">Default Comm</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-defaultComm"
										name="defaultComm" placeholder="Default Comm">
								</div>
							</div>
							<div class="form-group">
								<label for="defaultSNMP" class="col-sm-2 control-label">Default SNMP</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-defaultSNMP"
										name="defaultSNMP" placeholder="Default SNMP">
								</div>
							</div>
							<div class="form-group">
								<label for="driver" class="col-sm-2 control-label">Driver</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-driver"
										name="driver" placeholder="Driver" >
								</div>
							</div>
							<div class="form-group">
								<label for="technology" class="col-sm-2 control-label">Technology</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-technology"
										name="technology" placeholder="Technology">
								</div>
							</div>
							<div class="form-group">
								<label for="vendor" class="col-sm-2 control-label">Vendor</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-vendor"
										name="vendor" placeholder="Vendor">
								</div>
							</div>
							<div class="form-group" id="button-edition">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="actualizarTipoEquipo();">Guardar</button>
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
					<h4 class="modal-title">Eliminar Tipo de equipo</h4>
				</div>
				<div class="modal-body">
					<p>
						Esta seguro que desea eliminar el tipo de equipo?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-outline" data-dismiss="modal" onclick="deleteTipoEquipo();">Eliminar</button>
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