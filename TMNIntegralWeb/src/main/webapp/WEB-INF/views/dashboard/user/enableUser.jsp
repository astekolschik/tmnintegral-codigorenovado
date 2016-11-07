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
				<table id="usersTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<td>Nombre de usuario</td>
							<td>Nombre</td>
							<td>Apellido</td>
							<td>Email</td>
							<td>Administrador</td>
							<td>Usuario</td>
							<td>Solo reportes</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${model.userList}" var="user">
							<input type="hidden" class="clientList" value="${user.user_name}"/>
							<tr>
								<td>${user.user_name}</td>
								<td>${user.name}</td>
								<td>${user.lastName}</td>
								<td>${user.email}</td>
								<td>
									<c:if test="${user.role.role_id==1}">
										<input type="checkbox" name="adminCheck" checked="checked" value="${user.user_name}"/>
									</c:if>
									<c:if test="${user.role.role_id!=1}">
										<input type="checkbox" name="adminCheck" value="${user.user_name}"/>
									</c:if>
								</td>
								<td>
									<c:if test="${user.role.role_id==2}">
										<input type="checkbox" name="userCheck" checked="checked" value="${user.user_name}"/>
									</c:if>
									<c:if test="${user.role.role_id!=2}">
										<input type="checkbox" name="userCheck" value="${user.user_name}"/>
									</c:if>
								</td>
								<td>
									<c:if test="${user.role.role_id==3}">
										<input type="checkbox" name="reportCheck" checked="checked" value="${user.user_name}"/>
									</c:if>
									<c:if test="${user.role.role_id!=3}">
										<input type="checkbox" name="reportCheck" value="${user.user_name}"/>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModal">Actualizar</button>
			</div>
		</div>
	</div>
	<div id="confirmModal" class="modal fade modal-danger" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Habilitar Usuarios</h4>
				</div>
				<div class="modal-body">
					<p>Esta seguro que desea habilitar el/los usuario/s?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-outline" data-dismiss="modal" onclick="actualizarUsuarios();">Habilitar</button>
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
					<h4 class="modal-title">Los usuarios fueron modificados correctamente</h4>
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