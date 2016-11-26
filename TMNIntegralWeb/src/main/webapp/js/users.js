function loadChgUser(){
	$('#main-content').empty();
	$('#main-content').load('user/updateUser.htm');
}

function loadDeleteUser(){
	$('#main-content').empty();
	$('#main-content').load('user/deleteUser.htm', function(){
		var table = $("#usersTable").DataTable(dataTableParams);
	    new $.fn.dataTable.FixedHeader( table, {
	        alwaysCloneTop: true
	    });
	});
}

function loadEnableUser(){
	$('#main-content').empty();
	$('#main-content').load('user/enableUser.htm', function(){
		var table = $("#usersTable").DataTable(dataTableParams);
	    new $.fn.dataTable.FixedHeader( table, {
	        alwaysCloneTop: true
	    });
	});
}

function loadAllowUser(){
	$('#main-content').empty();
	$('#main-content').load('user/allowUser.htm', function(){
		var table = $("#usersTable").DataTable(dataTableParams);
	    new $.fn.dataTable.FixedHeader( table, {
	        alwaysCloneTop: true
	    });
	});
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
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe seleccionar al menos un usuario.');
		$('#validationModal').modal('show');
		//alert('Debe seleccionar al menos un usuario.');
	}else{
		$('#main-content').empty();
		$('#main-content').load('/TMNIntegralWeb/user/deleteUser.htm?deleteUserList=' + delList,
				function() {
						//Remove modal leftovers
						$("body").removeClass('modal-open');
						$("div").remove(".modal-backdrop.fade.in");
						//Load ok modal
						$('#okModal').modal('show');
						var table = $("#usersTable").DataTable(dataTableParams);
					    new $.fn.dataTable.FixedHeader( table, {
					        alwaysCloneTop: true
					    });
		        }); 
	}
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function actualizarDatosUsuario(){
	if (!createUserValidate())
		return;
	
	var nombre = $('#nombre').val();
	var apellido = $('#apellido').val();
	var email = $('#email').val();
	var password = $('#password').val();
	var direccion = $('#direccion').val();
	var notas = $('#notas').val();
	
	//Validacion
	if (!nombre || nombre == ''){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe completar el nombre.');
		$('#validationModal').modal('show');
		//alert('Debe completar el nombre');
		return;
	}
	if (!apellido || apellido == ''){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe completar el apellido.');
		$('#validationModal').modal('show');
		//alert('Debe completar el apellido');
		return;
	}
	if (!email || email == '' || !validateEmail(email)){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe ingresar un email valido');
		$('#validationModal').modal('show');
		//alert('Debe ingresar un email valido');
		return;
	}
	if (!password || password == ''){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe completar la contraseña.');
		$('#validationModal').modal('show');
		//alert('Debe completar la contraseña.');
		return;
	}
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/user/updateUser.htm?nombre=' + nombre
																			+ '&apellido=' + apellido
																			+ '&email=' + email
																			+ '&password=' + password
																			+ '&direccion=' + direccion
																			+ '&notas=' + notas
																			+ '&saveUser=true').replace(/ /g, "%20"), function(){
		//Load ok modal
		$('#updateConfirmModal').modal('show');
	});

}

function checkUserHasRole(username, adminlist, userlist, reportlist){
	for (var i in adminlist){
		if(adminlist[i] == username)
			return true;
	}
	
	for (var i in userlist){
		if(userlist[i] == username)
			return true;
	}
	
	for (var i in reportlist){
		if(reportlist[i] == username)
			return true;
	}
	
	return false;
}

function checkUsersRoles(listOfUsers, adminlist, userlist, reportlist){
	for (var i = 0; i < listOfUsers.size(); i++){
		if (!checkUserHasRole(listOfUsers[i].value, adminlist, userlist, reportlist))
			return false;
	}
	return true;
}

function actualizarUsuarios(){
	var listOfUsers = $(".clientList");
	
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
	
	if (!checkUsersRoles(listOfUsers, adminList, userList, reportList)){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Los usuarios deben tener al menos un rol asignado.');
		$('#validationModal').modal('show');
		//alert('Los usuarios deben tener al menos un rol asignado');
		return false;
	}

	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/user/enableUser.htm?adminUserList=' + adminList + '&userList=' + userList + '&reportList=' + reportList,
			function() {
					//Remove modal leftovers
					$("body").removeClass('modal-open');
					$("div").remove(".modal-backdrop.fade.in");
					//Load ok modal
					$('#okModal').modal('show');
					var table = $("#usersTable").DataTable(dataTableParams);
				    new $.fn.dataTable.FixedHeader( table, {
				        alwaysCloneTop: true
				    });
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
					var table = $("#usersTable").DataTable(dataTableParams);
				    new $.fn.dataTable.FixedHeader( table, {
				        alwaysCloneTop: true
				    });
	        }); 
}

function uploadImage(){
	var formData = new FormData();
	formData.append('newImage', $('#new-profile-pic')[0].files[0]);
	$.ajax({
	    url: '/TMNIntegralWeb/user/updateUserImage.htm',
	    data: formData,
	    type: 'POST',
	    contentType: false,
	    processData: false,
	    success: function(imgpath){
	    	$('#main-img-user').attr("src", imgpath);
	    	$('#mini-img-user-1').attr("src", imgpath);
	    	$('#mini-img-user-2').attr("src", imgpath);
	    	//alert("La imagen se guardo correctamente.");
	    	$('#okImgModal').modal('show');
	    },
	    error: function(message){
	    	$('#validation-modal-error').empty();
			$('#validation-modal-error').append('Error al subir el archivo.');
			$('#validationModal').modal('show');
			//alert("Error al subir el archivo");
	    	console.log(message);
	    }
	});
}

/****************************CLIENTS**************/
function loadClients(){
	$('#main-content').empty();
	$('#main-content').load('client/clientes.htm', function(){
		$('#goToAgregarCliente').click(function() {
			  $('#clientesTabs a[href="#nuevocliente"]').tab('show');
			});
		
		var table = $("#clientsTable").DataTable(dataTableParams);
	    new $.fn.dataTable.FixedHeader( table, {
	        alwaysCloneTop: true
	    });
	});
}

function agregarCliente(){
	var id = $('#clientId').val();
	var descripcion = $('#description').val();
	
	if (!id || id == ''){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe completar el identificador.');
		$('#validationModal').modal('show');
		//alert('Debe completar el identificador');
		return;
	}
	if (!descripcion || descripcion == ''){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe completar la descripcion.');
		$('#validationModal').modal('show');
		//alert('Debe completar la descripcion');
		return;
	}
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/client/updateClient.htm?descripcion=' + descripcion
																			+ '&id=' + id).replace(/ /g, "%20"), function(){
		$('#goToAgregarCliente').click(function() {
			  $('#clientesTabs a[href="#nuevocliente"]').tab('show');
			});
		
		var table = $("#clientsTable").DataTable(dataTableParams);
	    new $.fn.dataTable.FixedHeader( table, {
	        alwaysCloneTop: true
	    });
		
		//Load ok modal
		$('#createConfirmModal').modal('show');
	});
	
}