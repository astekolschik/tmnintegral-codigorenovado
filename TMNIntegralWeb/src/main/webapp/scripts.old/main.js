function setMenuValue(idMenu){
	$('#menu-' + idMenu).addClass('current');
	if(idMenu=='index')
		$('#menu-contactenos').show();
	else
		$('#menu-contactenos').hide();
}

function updateUserValidate(){
	$('#saveUser').val(true);
	return validatePassword();
}

function createUserValidate(){
	return validatePassword();
}

function validatePassword(){
	var pass1 = $('#password').val();
	var pass2 = $('#password2').val();
	
	var re = new RegExp("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,20})");
	if (!re.test(pass1)){
		alert('La contraseña no cumple los criterios de seguridad: \n '
				+ '1. Debe tener al menos un caracter en mínuscula.'
				+ '2. Debe tener al menos un caracter en mayúscula.'
				+ '3. Debe tener al menos un número.'
				+ '4. Debe tener una longitud entre 8 y 20 caracteres.');
		return false;
	}
	
	if (pass1 != ''){
		if (pass1 == pass2)
			return true;
		else{
			alert('Las contraseñas deben coincidir');
			return false;
		}
	}
}

function eliminarUsuarios(){
	var delList = [];
	$("input:checkbox[name=userCheck]:checked").each(function(){
	    delList.push($(this).val());
	});
	if(delList.length == 0){
		alert('Debe seleccionar al menos un usuario.');
	}else{
		 window.location.replace("/TMNIntegralWeb/user/deleteUser.htm?deleteUserList=" + delList);
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

	window.location.replace("/TMNIntegralWeb/enableUser.htm?adminUserList=" + adminList + "&userList=" + userList + "&reportList=" + reportList);
}

function displayTipoEquipo(teId, isEdition){
	window.location.replace("/TMNIntegralWeb/displayTipoEquipo.htm?teId=" + teId + "&edit=" + isEdition);
}

function nuevoTipoEquipo(){
	window.location.replace("/TMNIntegralWeb/nuevoTipoEquipo.htm");
}

function displayLisTipoEquipo(){
	window.location.replace("/TMNIntegralWeb/listTipoEquipos.htm");
}

function deleteTipoEquipo(idTipoEquipo){
	window.location.replace("/TMNIntegralWeb/deleteTipoEquipo.htm?teId=" + idTipoEquipo);
}

function displayComando(cId, isEdition){
	window.location.replace("/TMNIntegralWeb/displayComando.htm?cId=" + cId + "&edit=" + isEdition);
}

function nuevoComando(){
	window.location.replace("/TMNIntegralWeb/nuevoComando.htm");
}

function displayListComandos(){
	window.location.replace("/TMNIntegralWeb/listComandos.htm");
}

function deleteComando(idComando){
	window.location.replace("/TMNIntegralWeb/deleteComando.htm?cId=" + idComando);
}

function displayInterfaz(iId, isEdition){
	window.location.replace("/TMNIntegralWeb/displayInterface.htm?iId=" + iId + "&edit=" + isEdition);
}

function nuevaInterfaz(){
	window.location.replace("/TMNIntegralWeb/altaInterface.htm");
}

function displayLisInterfaces(){
	window.location.replace("/TMNIntegralWeb/listInterface.htm");
}

function deleteInterfaz(idTipoEquipo){
	window.location.replace("/TMNIntegralWeb/eliminarInterface.htm?iId=" + idTipoEquipo);
}

function displayRed(rId, isEdition){
	window.location.replace("/TMNIntegralWeb/displayRed.htm?redId=" + rId + "&edit=" + isEdition);
}

function nuevaRed(){
	window.location.replace("/TMNIntegralWeb/nuevaRed.htm");
}

function displayLisRed(){
	window.location.replace("/TMNIntegralWeb/listRed.htm");
}

function deleteRed(idRed){
	window.location.replace("/TMNIntegralWeb/eliminarRed.htm?rId=" + idRed);
}

function displayDevice(rId, isEdition){
	window.location.replace("/TMNIntegralWeb/displayDevice.htm?dId=" + rId + "&edit=" + isEdition);
}

function nuevoEquipo(){
	window.location.replace("/TMNIntegralWeb/nuevoEquipo.htm");
}

function displayLisDevice(){
	window.location.replace("/TMNIntegralWeb/listDevice.htm");
}

function deleteDevice(idEquipo){
	window.location.replace("/TMNIntegralWeb/eliminarEquipo.htm?dId=" + idEquipo);
}


function setEnableFields(isEnabled){
	$('input[type=text]').each(function () {
		this.disabled = !isEnabled ;
	  });
}

function paginateTable(tableId){
	$('#' + tableId).DataTable({
    	"language": {
    	    "sProcessing":     "Procesando...",
    	    "sLengthMenu":     "Mostrar _MENU_ registros",
    	    "sZeroRecords":    "No se encontraron resultados",
    	    "sEmptyTable":     "Ningún dato disponible en esta tabla",
    	    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
    	    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
    	    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
    	    "sInfoPostFix":    "",
    	    "sSearch":         "Buscar:",
    	    "sUrl":            "",
    	    "sInfoThousands":  ",",
    	    "sLoadingRecords": "Cargando...",
    	    "oPaginate": {
    	        "sFirst":    "Primero",
    	        "sLast":     "Último",
    	        "sNext":     "Siguiente",
    	        "sPrevious": "Anterior"
    	    },
    	    "oAria": {
    	        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
    	        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    	    }
    	},
    	dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf'
        ]
    });
}

function selectAllCheckbox(chk){
	var val = chk.checked;
	$('input[type=checkbox]').each(function () {
		this.checked = val;
	  });
}

function setTipoEquiposSelectValues(dts){
	var vals = [];
	$.each(dts, function(i,e){
	    $("#dt-select option[value='" + e + "']").prop("selected", true);
	});
}

function setdtValues(){
    $("#dtValues").val($("#dt-select").val());
}

function validarInterface(){
	if ($('#device-select').val() == -1)
		return false;
	
	$('#device').val($('#device-select').val());
	return true;
}

function setEquipo(idDev){
	$('#device-select').val(idDev);
}

function callDiscoveryPgm(){
	window.location.replace("/TMNIntegralWeb/callDiscoveryPgm.htm");	
}