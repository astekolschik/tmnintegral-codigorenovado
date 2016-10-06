<%@ include file="/WEB-INF/views/dashboard/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>TMN Integral - Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="index.htm" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>TMN</b>I</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>TMN</b> Integral</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> 
							<c:if test="${empty sessionScope.user.imagePath}">
								<img src="img/icon-user-default.png" class="user-image" width="160px" height="160px" id="mini-img-user-2"
									alt="User Image"> 
							</c:if>
							<c:if test="${not empty sessionScope.user.imagePath}">
								<img src="${sessionScope.user.imagePath}" class="user-image" width="160px" height="160px" id="mini-img-user-2"
									alt="User Image"> 
							</c:if>
							<span class="hidden-xs"><c:out value="${sessionScope.user.name}"/></span>
						</a>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<c:if test="${empty sessionScope.user.imagePath}">
							<img src="img/icon-user-default.png" class="img-circle" width="160px" height="160px" id="mini-img-user-1"
								alt="User Image">
						</c:if>
						<c:if test="${not empty sessionScope.user.imagePath}">
							<img src="${sessionScope.user.imagePath}" class="img-circle" width="160px" height="160px" id="mini-img-user-1"
								alt="User Image">
						</c:if>
					</div>
					<div class="pull-left info">
						<p><c:out value="${sessionScope.user.name}"/></p>
					</div>
				</div>
				<%@ include file="/WEB-INF/views/dashboard/usermenu.jsp"%>
				
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Dashboard <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content" id="main-content">
				<%@ include file="/WEB-INF/views/dashboard/dashboard.jsp"%>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.3.0
			</div>
			<strong>Copyright &copy; 2014-2016 <a
				href="http://almsaeedstudio.com">Almsaeed Studio</a>.
			</strong> All rights reserved.
		</footer>

	</div>
	<!-- ./wrapper -->
</body>
</html>
