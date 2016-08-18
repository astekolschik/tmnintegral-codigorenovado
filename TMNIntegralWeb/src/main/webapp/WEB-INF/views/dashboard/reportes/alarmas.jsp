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
				<h3 class="box-title">Alarmas enviadas</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table id="alarmasTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<td>Elemento</td>
							<td>Tipo de Alarma</td>
							<td>Última actualización</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${model.alarmas}" var="a">
							<tr>
								<td>${a.elementName}</td>
								<td>${a.valor}</td>
								<td>${a.lastUpdateDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModal">Eliminar</button>
			</div>
		</div>
	</div>
</section>
<!-- /.content -->
<!-- </div> -->
<!-- /.content-wrapper -->