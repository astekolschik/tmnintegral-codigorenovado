<%-- <%@ page session="false"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Bootstrap 3.3.5 -->
<!-- <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
 --><!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Google graphics for charts  -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<c:if test="${not model.context}">

	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	
	<!-- Main validation -->
	<script src="js/main.js"></script>
	<script src="js/users.js"></script>
	<script src="js/inventory.js"></script>
	<script src="js/monitoring.js"></script>

	<!-- Theme style -->
	<link rel="stylesheet" href="js/dashboard/dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
	         folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="js/dashboard/dist/css/skins/_all-skins.min.css">
	<!-- iCheck -->
	<link rel="stylesheet" href="js/dashboard/plugins/iCheck/flat/blue.css">
	<!-- Morris chart -->
	<link rel="stylesheet" href="js/dashboard/dist/css/skins/_all-skins.min.css">
	<!-- jvectormap -->
	<link rel="stylesheet"
		href="js/dashboard/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="js/dashboard/plugins/datepicker/datepicker3.css">
	<!-- Daterange picker -->
	<link rel="stylesheet"
		href="js/dashboard/plugins/daterangepicker/daterangepicker-bs3.css">
	<!-- bootstrap wysihtml5 - text editor -->
	<link rel="stylesheet"
		href="js/dashboard/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
		<!-- jQuery 2.1.4 -->
	<script src="js/dashboard/plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"
		type="text/javascript"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script type="text/javascript">
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.5 -->
	<script src="js/dashboard/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"
		type="text/javascript"></script>
	<!-- Sparkline -->
	<script src="js/dashboard/plugins/sparkline/jquery.sparkline.min.js"
		type="text/javascript"></script>
	<!-- jvectormap -->
	<script src="js/dashboard/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"
		type="text/javascript"></script>
	<script src="js/dashboard/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"
		type="text/javascript"></script>
	<!-- jQuery Knob Chart -->
	<script src="js/dashboard/plugins/knob/jquery.knob.js" type="text/javascript"></script>
	<!-- daterangepicker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"
		type="text/javascript"></script>
	<script src="js/dashboard/plugins/daterangepicker/daterangepicker.js"
		type="text/javascript"></script>
	<!-- datepicker -->
	<script src="js/dashboard/plugins/datepicker/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="js/dashboard/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
		type="text/javascript"></script>
	<!-- Slimscroll -->
	<script src="js/dashboard/plugins/slimScroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src="js/dashboard/plugins/fastclick/fastclick.min.js" type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="js/dashboard/dist/js/app.min.js" type="text/javascript"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="js/dashboard/dist/js/pages/dashboard.js" type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="js/dashboard/dist/js/demo.js" type="text/javascript"></script>
	
	<!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="js/dashboard/plugins/timepicker/bootstrap-timepicker.min.css">
    
	<!-- Data tables -->
	<script src="js/dashboard/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="js/dashboard/plugins/datatables/dataTables.bootstrap.min.js"></script>
    
    <!-- topologia -->
   	<link rel="stylesheet" 	href="js/dashboard/vis.min.css"></link>
    <script src="js/dashboard/vis.min.js"></script>
</c:if>
<c:if test="${model.context}">

	<!-- Bootstrap -->
	<link rel="stylesheet" href="../css/bootstrap.css">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../js/jquery-1.11.2.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../js/bootstrap.min.js" type="text/javascript"></script>
	
	<!-- Main validation -->
	<script src="../js/main.js"></script>
	<script src="../js/users.js"></script>
	<script src="../js/inventory.js"></script>
	<script src="../js/monitoring.js"></script>
	
		
	<!-- Theme style -->
	<link rel="stylesheet" href="../js/dashboard/dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
	         folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="../js/dashboard/dist/css/skins/_all-skins.min.css">
	<!-- iCheck -->
	<link rel="stylesheet" href="../js/dashboard/plugins/iCheck/flat/blue.css">
	<!-- Morris chart -->
	<link rel="stylesheet" href="../js/dashboard/dist/css/skins/_all-skins.min.css">
	<!-- jvectormap -->
	<link rel="stylesheet"
		href="../js/dashboard/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="../js/dashboard/plugins/datepicker/datepicker3.css">
	<!-- Daterange picker -->
	<link rel="stylesheet"
		href="../js/dashboard/plugins/daterangepicker/daterangepicker-bs3.css">
	<!-- bootstrap wysihtml5 - text editor -->
	<link rel="stylesheet"
		href="../js/dashboard/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
		<!-- jQuery 2.1.4 -->
	<script src="../js/dashboard/plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"
		type="text/javascript"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script type="text/javascript">
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.5 -->
	<script src="../js/dashboard/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"
		type="text/javascript"></script>
	<!-- Sparkline -->
	<script src="../js/dashboard/plugins/sparkline/jquery.sparkline.min.js"
		type="text/javascript"></script>
	<!-- jvectormap -->
	<script src="../js/dashboard/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"
		type="text/javascript"></script>
	<script src="../js/dashboard/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"
		type="text/javascript"></script>
	<!-- jQuery Knob Chart -->
	<script src="../js/dashboard/plugins/knob/jquery.knob.js" type="text/javascript"></script>
	<!-- daterangepicker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"
		type="text/javascript"></script>
	<script src="../js/dashboard/plugins/daterangepicker/daterangepicker.js"
		type="text/javascript"></script>
	<!-- datepicker -->
	<script src="../js/dashboard/plugins/datepicker/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="../js/dashboard/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
		type="text/javascript"></script>
	<!-- Slimscroll -->
	<script src="../js/dashboard/plugins/slimScroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src="../js/dashboard/plugins/fastclick/fastclick.min.js" type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="../js/dashboard/dist/js/app.min.js" type="text/javascript"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="../js/dashboard/dist/js/pages/dashboard.js" type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../js/dashboard/dist/js/demo.js" type="text/javascript"></script>
	<!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="../js/dashboard/plugins/timepicker/bootstrap-timepicker.min.css">
    
	<!-- Data tables -->
	<script src="../js/dashboard/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../js/dashboard/plugins/datatables/dataTables.bootstrap.min.js"></script>
    
    <!-- topologia -->
   	<link rel="stylesheet" 	href="../js/dashboard/vis.min.css"></link>
    <script src="../js/dashboard/vis.min.js"></script>
</c:if>