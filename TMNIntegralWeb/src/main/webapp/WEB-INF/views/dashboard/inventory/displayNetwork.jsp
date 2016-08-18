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
	<input type="hidden" value="${model.networkGraph}" id="network-json"> 
	<div class="box">
		<section>
			<h3>Topología de la red</h3>
			<div class="row" style="width: 100%" id="net-container"></div>
		</section>
	</div>
</section>