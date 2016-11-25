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
	<div class="container">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Administracion de usuarios</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table id="usersTable" class="table table-bordered table-striped" style="font-size: small">
					<thead>
						<tr>
							<td><input type="checkbox" name="userCheck" value="all"
								onclick="selectAllCheckbox(this);" /></td>
							<td>Nombre de usuario</td>
							<td>Nombre</td>
							<td>Apellido</td>
							<td>Email</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${model.userList}" var="user">
							<tr>
								<td><input type="checkbox" name="userCheck"
									value="${user.user_name}" /></td>
								<td>${user.user_name}</td>
								<td>${user.name}</td>
								<td>${user.lastName}</td>
								<td>${user.email}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModal">Eliminar</button>
			</div>
		</div>
	</div>
	<div id="confirmModal" class="modal fade modal-warning" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Eliminar Usuarios</h4>
				</div>
				<div class="modal-body">
					<p>Esta seguro que desea eliminar el/los usuario/s?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-outline" data-dismiss="modal" onclick="eliminarUsuarios();">Eliminar</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="okModal" class="modal fade modal-success" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Los usuarios fueron eliminados correctamente</h4>
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
<!-- /.content -->
<!-- </div> -->
<!-- /.content-wrapper -->