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
				<ul class="nav nav-tabs" id="clientesTabs">
					<li class="active"><a href="#listaClientes" data-toggle="tab">Listado de clientes</a></li>
					<li class="disabled" id="nuevoclienteTab"><a href="#nuevocliente" data-toggle="tab">Agregar cliente</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="listaClientes">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Administracion de Clientes</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="clientsTable" class="table table-bordered table-striped">
									<thead>
										<tr>
											<td>Cliente</td>
											<td>Descripción</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${model.clients}" var="client">
											<tr>
												<td>${client.client_id}</td>
												<td>${client.name}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<a href="#" id="goToAgregarCliente">
									<button type="button" class="btn btn-primary">Agregar</button>
								</a>
							</div>
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="nuevocliente">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label for="clientId" class="col-sm-2 control-label">Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="clientId" required="required"
										name="clientId" placeholder="Id">
								</div>
							</div>
							<div class="form-group">
								<label for="description" class="col-sm-2 control-label">Descripcion</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="description" required="required"
										name="description" placeholder="Descripcion">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-danger" onclick="javascript:agregarCliente();">Agregar</button>
									<button type="reset" class="btn btn-danger">Limpiar</button>
								</div>
							</div>
						</form>
					</div>
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
					<h4 class="modal-title">El cliente fue creado correctamente</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /.content -->
<!-- </div> -->
<!-- /.content-wrapper -->