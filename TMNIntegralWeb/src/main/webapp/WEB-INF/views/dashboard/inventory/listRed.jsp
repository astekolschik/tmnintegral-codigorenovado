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
				<ul class="nav nav-tabs" id="redesTabs">
					<li class="active"><a href="#listaRedes" data-toggle="tab">Listado de redes</a></li>
					<li class="disabled" id="nuevaredTab"><a href="#nuevared" data-toggle="tab">Agregar red</a></li>
					<li class="disabled" id="editarredTab"><a href="#editarred" data-toggle="tab">Editar red</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="listaRedes">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Administracion de Redes</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="redesTable"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<td>Id</td>
											<td>Nombre</td>
											<td>Descripcion</td>
											<td>Habilitada</td>
											<td>Ver</td>
											<td>Modificar</td>
											<td>Eliminar</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${model.redesList}" var="red">
											<tr>
												<td>${red.id_network}</td>
												<td>${red.network}</td>
												<td>${red.description}</td>
												<td>
													<c:if test="${red.enabled != 0}">
														Si
													</c:if>
													<c:if test="${red.enabled == 0}">
														No
													</c:if>
												</td>
												<td style="text-align: center;"><a
													onclick="javascript:displayRed(${red.id_network}, false);">
														<i class="fa fa-search"></i>
												</a></td>
												<td style="text-align: center;"><a
													onclick="javascript:displayRed(${red.id_network}, true);">
														<i class="fa fa-edit"></i>
												</a></td>
												<td style="text-align: center;">
													<input type="hidden" id="redDelId">
													<a data-toggle="modal" data-target="#deleteConfirmModal" data-id="${red.id_network}" class="open-DeleteNetworkDialog"> <i class="fa fa-eraser"></i></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<a href="#" id="goToAgregarRed">
									<button type="button" class="btn btn-primary">Agregar</button>
								</a>
							</div>
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="nuevared">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="nombre" class="col-sm-2 control-label">Nombre</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="nombre" required="required"
										name="nombre" placeholder="Nombre">
								</div>
							</div>
							<div class="form-group">
								 <div class="checkbox">
			                        <label for="enabled" class="col-sm-2 control-label">
			                          <input type="checkbox" name="enabled" id="enabled">
			                          Habilitada
			                        </label>
			                      </div>
							</div>
							<div class="form-group">
								<label for="descripcion" class="col-sm-2 control-label">Descripcion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="descripcion" required="required"
										name="descripcion" placeholder="Descripcion">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="javascript:agregarRed();">Agregar</button>
									<button type="reset" class="btn btn-danger">Limpiar</button>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="editarred">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="display-idRed" class="col-sm-2 control-label">Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-idRed" required="required"
										name="display-idRed" placeholder="Id">
								</div>
							</div>
							<div class="form-group">
								<label for="display-nombre" class="col-sm-2 control-label">Nombre</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-nombre" required="required"
										name="display-nombre" placeholder="Nombre">
								</div>
							</div>
							<div class="form-group">
								 <div class="checkbox">
			                        <label for="display-enabled" class="col-sm-2 control-label">
			                          <input type="checkbox" name="display-enabled" id="display-enabled">
			                          Habilitada
			                        </label>
			                      </div>
							</div>
							<div class="form-group">
								<label for="display-descripcion" class="col-sm-2 control-label">Descripcion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="display-descripcion" required="required"
										name="display-descripcion" placeholder="Descripcion">
								</div>
							</div>
							<div class="form-group" id="button-edition">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="actualizarRed();">Guardar</button>
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
					<h4 class="modal-title">Eliminar Red</h4>
				</div>
				<div class="modal-body">
					<p>
						Esta seguro que desea eliminar la red?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-outline" data-dismiss="modal" onclick="deleteRed();">Eliminar</button>
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
					<h4 class="modal-title">La red fue modificada correctamente</h4>
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
					<h4 class="modal-title">La red fue creada correctamente</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
</section>