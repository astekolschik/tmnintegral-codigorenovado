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
				<table id="alarmasTable" class="table table-bordered table-striped" style="font-size: small">
					<thead>
						<tr>
							<td>Id</td>
							<td>Variable</td>
							<td>Equipo</td>
							<td>Última actualización</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${model.alarmas}" var="a">
							<tr>
								<td>${a.id}</td>
								<td>${a.alarm.idVariable}</td>
								<td>${a.alarm.idVariable}</td>
								<td>${a.alarm.elementName}</td>
								<td>${a.datesent}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
<!-- /.content -->
<!-- </div> -->
<!-- /.content-wrapper -->