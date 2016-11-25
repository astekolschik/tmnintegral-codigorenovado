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
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs" id="redesTabs">
					<li class="active"><a href="#listaRedes" data-toggle="tab">Redes</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="listaRedes">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Administracion de Redes</h3>
								<br/>
								<button type="button" class="btn btn-danger" onclick="javascript:callDiscoveryPgm();">Descubrir red</button>
							</div>
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
					<c:if test="${empty model.error}">
						<h4 class="modal-title">La red fue eliminada correctamente</h4>
					</c:if>
					<c:if test="${not empty model.error}">
						<h4 class="modal-title">${model.error}</h4>
					</c:if>
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
	<div id="createConfirmDiscoveryModal" class="modal fade modal-success" role="dialog">
	  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">${model.message}</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"	data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
</section>