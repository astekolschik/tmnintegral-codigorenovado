function loadChgUser(){
	$('#main-content').empty();
	$('#main-content').load('user/updateUser.htm');
}

function loadDeleteUser(){
	$('#main-content').empty();
	$('#main-content').load('user/deleteUser.htm');
}

function loadEnableUser(){
	$('#main-content').empty();
	$('#main-content').load('user/enableUser.htm');
}

function loadAllowUser(){
	$('#main-content').empty();
	$('#main-content').load('user/allowUser.htm');
}

function selectAllCheckbox(chk){
	var val = chk.checked;
	$('input[type=checkbox]').each(function () {
		this.checked = val;
	  });
}

function eliminarUsuarios(){
	var delList = [];
	$("input:checkbox[name=userCheck]:checked").each(function(){
	    delList.push($(this).val());
	});
	if(delList.length == 0){
		alert('Debe seleccionar al menos un usuario.');
	}else{
		$('#main-content').empty();
		$('#main-content').load('/TMNIntegralWeb/user/deleteUser.htm?deleteUserList=' + delList,
				function() {
						//Remove modal leftovers
						$("body").removeClass('modal-open');
						$("div").remove(".modal-backdrop.fade.in");
						//Load ok modal
						$('#okModal').modal('show');
		        }); 
	}
}

function actualizarUsuarios(){
	var adminList = [];
	$("input:checkbox[name=adminCheck]:checked").each(function(){
	    adminList.push($(this).val());
	});
	
	var userList = [];
	$("input:checkbox[name=userCheck]:checked").each(function(){
	    userList.push($(this).val());
	});
	
	var reportList = [];
	$("input:checkbox[name=reportCheck]:checked").each(function(){
	    reportList.push($(this).val());
	});

	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/user/enableUser.htm?adminUserList=' + adminList + '&userList=' + userList + '&reportList=' + reportList,
			function() {
					//Remove modal leftovers
					$("body").removeClass('modal-open');
					$("div").remove(".modal-backdrop.fade.in");
					//Load ok modal
					$('#okModal').modal('show');
	        }); 
}

function habilitarUsuarios(){
	var userList = [];
	$("input:checkbox[name=enabledCheck]:checked").each(function(){
		userList.push($(this).val());
	});
	
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/user/allowUser.htm?enabledUserList=' + userList,
			function() {
					//Remove modal leftovers
					$("body").removeClass('modal-open');
					$("div").remove(".modal-backdrop.fade.in");
					//Load ok modal
					$('#okModal').modal('show');
	        }); 
}

/****************************CLIENTS**************/
function loadClients(){
	$('#main-content').empty();
	$('#main-content').load('client/clientes.htm', function(){
		$('#goToAgregarCliente').click(function() {
			  $('#clientesTabs a[href="#nuevocliente"]').tab('show');
			});
		
		$("#clientsTable").DataTable();
	});
}

function agregarCliente(){
	var id = $('#clientId').val();
	var descripcion = $('#description').val();
	
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/client/updateClient.htm?descripcion=' + descripcion
																			+ '&id=' + id, function(){
		$('#goToAgregarCliente').click(function() {
			  $('#clientesTabs a[href="#nuevocliente"]').tab('show');
			});
		
		$("#clientsTable").DataTable();
		
		//Load ok modal
		$('#createConfirmModal').modal('show');
	});
	
}