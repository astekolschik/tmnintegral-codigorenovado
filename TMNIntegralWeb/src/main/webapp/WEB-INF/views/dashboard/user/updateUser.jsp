<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 -->	<section class="content">

		<div class="row">
			<div class="col-md-3">

				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<c:if test="${empty model.userObj.imagePath}">
							<img class="profile-user-img img-responsive img-circle" id="main-img-user"
								src="img/icon-user-default.png" alt="Imagen de perfil">
						</c:if>
						<c:if test="${not empty model.userObj.imagePath}">
							<img class="profile-user-img img-responsive img-circle" id="main-img-user"
								src="${model.userObj.imagePath}" alt="Imagen de perfil">
						</c:if>
						<h3 class="profile-username text-center">${model.userObj.name}</h3>
						<input type="file" id="new-profile-pic" onchange="javascript:uploadImage();"/> 
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

				<!-- About Me Box -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Acerca de mi</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<strong><i class="fa fa-book margin-r-5"></i> Email</strong>
						<p class="text-muted">${model.userObj.email}</p>

						<hr>

						<strong><i class="fa fa-map-marker margin-r-5"></i>
							Ubicacion</strong>
						<p class="text-muted">${model.userObj.address}</p>
						<hr>
						<strong><i class="fa fa-file-text-o margin-r-5"></i>
							Notas adicionales</strong>
						<p>${model.userObj.notas}</p>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
			<div class="col-md-9">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#activity" data-toggle="tab">Actividad Reciente</a></li>
						<li><a href="#settings" data-toggle="tab">Configuraciön</a></li>
					</ul>
					<div class="tab-content">
						<div class="active tab-pane" id="activity">
							<c:forEach items="${model.logs}" var="log">
								<!-- Post -->
								<div class="post">
									<div class="user-block">
										<span class='description'>${log.date}</span>
									</div>
									<!-- /.user-block -->
									<p>${log.log_desc}</p>
								</div>
								<!-- /.post -->
							</c:forEach>
						</div>
						<!-- /.tab-pane -->
						<div class="tab-pane" id="settings">
							<form method="post" class="form-horizontal">
								<div class="form-group">
									<label for="nombre" class="col-sm-2 control-label">Nombre *</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="nombre" name="nombre"
											placeholder="Nombre" value="${model.userObj.name}">
									</div>
								</div>
								<div class="form-group">
									<label for="apellido" class="col-sm-2 control-label">Apellido *</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="apellido" name="apellido"
											placeholder="Apellido" value="${model.userObj.last_name}">
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="col-sm-2 control-label">Email *</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" id="email" name="email"
											placeholder="Email" value="${model.userObj.email}">
									</div>
								</div>
								<div class="form-group">
									<label for="inputName" class="col-sm-2 control-label">Contraseña *</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="password" name="password"
											placeholder="Email" value="${model.userObj.password}">
									</div>
								</div>
								<div class="form-group">
									<label for="inputName" class="col-sm-2 control-label">Contraseña *</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="password2" name="password2"
											placeholder="Email" value="${model.userObj.password}">
									</div>
								</div>
								<div class="form-group">
									<label for="inputSkills" class="col-sm-2 control-label">Direccion</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="direccion" name="direccion"
											placeholder="Direccion" ${model.userObj.address}>
									</div>
								</div>
								<div class="form-group">
									<label for="inputExperience" class="col-sm-2 control-label">Notas</label>
									<div class="col-sm-10">
										<textarea class="form-control" id="notas" name="notas"
											placeholder="Notas" cols="" rows="">${model.userObj.notas}</textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="button" onclick="javascript:actualizarDatosUsuario();" class="btn btn-danger">Actualizar</button>
									</div>
								</div>
							</form>
						</div>
						<!-- /.tab-pane -->
					</div>
					<!-- /.tab-content -->
				</div>
				<!-- /.nav-tabs-custom -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	<div id="updateConfirmModal" class="modal fade modal-success" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">El usuario fue modificado correctamente</h4>
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
	<div id="okImgModal" class="modal fade modal-success" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">La imagen se guardo correctamente</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
<!-- </div> -->
<!-- /.content-wrapper -->