//TIPO DE EQUIPO
$(document).on("click", ".open-DeleteDialog", function () {
     var tipoEquipoId = $(this).data('id');
     $("#tipoEquipoDelId").val(tipoEquipoId);
});

function displayLisTipoEquipo(){
	$('#main-content').empty();
	$('#main-content').load('inventory/listTipoEquipos.htm', function(){
		$('#goToAgregarTipoEquipo').click(function() {
			  $('#tipoEquipoTabs a[href="#nuevoequipo"]').tab('show');
			});
		$('#nuevoequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#tipoEquiposTable").DataTable();
	});
}

function agregarTipoEquipo(){
	var descripcion = $('#descripcion').val();
	var defaultComm = $('#defaultComm').val();
	var defaultSNMP = $('#defaultSNMP').val();
	var driver = $('#driver').val();
	var technology = $('#technology').val();
	var vendor = $('#vendor').val();
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/inventory/updateTipoEquipo.htm?descripcion=' + descripcion
																			+ '&defaultComm=' + defaultComm
																			+ '&defaultSNMP=' + defaultSNMP
																			+ '&driver=' + driver
																			+ '&technology=' + technology
																			+ '&vendor=' + vendor).replace(/ /g, "%20"), function(){
		$('#nuevoequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#tipoEquiposTable").DataTable();
		
		//Load ok modal
		$('#createConfirmModal').modal('show');
	});
	
}

function deleteTipoEquipo(){
	var tipoEq = $('#tipoEquipoDelId').val();
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/inventory/deleteTipoEquipo.htm?teId=' + tipoEq, function(){
		$('#goToAgregarTipoEquipo').click(function() {
			  $('#tipoEquipoTabs a[href="#nuevoequipo"]').tab('show');
			});
		$('#nuevoequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#tipoEquiposTable").DataTable();

		//Remove modal leftovers
		$("body").removeClass('modal-open');
		$("div").remove(".modal-backdrop.fade.in");
		
		//Load ok modal
		$('#delConfirmModal').modal('show');
	});
}

function displayTipoEquipo(idTipoEquipo, isEdition){
	$.ajax({
        url: "/TMNIntegralWeb/inventory/displayTipoEquipo.htm?teId=" + idTipoEquipo,
        type: "POST",
        dataType: "json",
        success: function (response) {
        	$('#tipoEquipoTabs a[href="#editarequipo"]').tab('show');
        	$('#display-id').val(response.id);
        	$("#display-id").prop('disabled', !isEdition);
        	$('#display-descripcion').val(response.descripcion);
        	$("#display-descripcion").prop('disabled', !isEdition);
        	$('#display-defaultComm').val(response.defaultComm);
        	$("#display-defaultComm").prop('disabled', !isEdition);
        	$('#display-defaultSNMP').val(response.defaultSNMP);
        	$("#display-defaultSNMP").prop('disabled', !isEdition);
        	$('#display-driver').val(response.driver);
        	$("#display-driver").prop('disabled', !isEdition);
        	$('#display-technology').val(response.technology);
        	$("#display-technology").prop('disabled', !isEdition);
        	$('#display-vendor').val(response.vendor);
        	$("#display-vendor").prop('disabled', !isEdition);
        	if (isEdition)
        		$("#button-edition").show();
        	else
        		$("#button-edition").hide();
        },
        error: function(jqXHR, textStatus, errorThrown) {
           console.log(textStatus, errorThrown);
        }
    });
}

function actualizarTipoEquipo(){
	var id = $('#display-id').val();
	var descripcion = $('#display-descripcion').val();
	var defaultComm = $('#display-defaultComm').val();
	var defaultSNMP = $('#display-defaultSNMP').val();
	var driver = $('#display-driver').val();
	var technology = $('#display-technology').val();
	var vendor = $('#display-vendor').val();
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/inventory/updateTipoEquipo.htm?idequipo=' + id + '&descripcion=' + descripcion
																			+ '&defaultComm=' + defaultComm
																			+ '&defaultSNMP=' + defaultSNMP
																			+ '&driver=' + driver
																			+ '&technology=' + technology
																			+ '&vendor=' + vendor).replace(/ /g, "%20"), function(){
		$('#nuevoequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#tipoEquiposTable").DataTable();
		
		//Load ok modal
		$('#updateConfirmModal').modal('show');
	});
	
}

//EQUIPO
$(document).on("click", ".open-DeleteDeviceDialog", function () {
    var equipoID = $(this).data('id');
    $("#equipoDelId").val(equipoID);
});

function displayLisEquipo(){
	$('#main-content').empty();
	$('#main-content').load('inventory/listDevice.htm', function(){
		$('#goToAgregarEquipo').click(function() {
			  $('#equipoTabs a[href="#nuevoequipo"]').tab('show');
			});
		$('#nuevoequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#equiposTable").DataTable();
	});
}

function deleteEquipo(){
	var equipo = $('#equipoDelId').val();
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/inventory/eliminarEquipo.htm?dId=' + equipo, function(){
		$('#goToAgregarEquipo').click(function() {
			  $('#equipoTabs a[href="#nuevoequipo"]').tab('show');
			});
		$('#nuevoequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#equiposTable").DataTable();
		
		//Remove modal leftovers
		$("body").removeClass('modal-open');
		$("div").remove(".modal-backdrop.fade.in");
		
		//Load ok modal
		$('#delConfirmModal').modal('show');
	});
}

function validateIp(ipaddress){  
	if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(ipaddress))  
		return true;  
	return false;
}  

function agregarEquipo(){
	var descripcion = $('#descripcion').val();
	var hostName = $('#hostName').val();
	var iosType = $('#iosType').val();
	var iosVersion = $('#iosVersion').val();
	var ip = $('#ip').val();
	var modelo = $('#modelo').val();
	var serialNumber = $('#serialNumber').val();
	var release = $('#release').val();
	var tipoEquipoId = $('#tipoEquipoId').val();
	var networkId = $('#networkId').val();
	var enabled = $('#enabled').prop('checked') ? 1 : 0;
	
	if (!descripcion || descripcion == ''){
		alert('Debe completar la descripcion del equipo.');
		return false;
	}
	if (!ip || ip == '' || !validateIp(ip)){
		alert('Debe ingresar una IP valida para el equipo.');
		return false;
	}
	if (!tipoEquipoId || tipoEquipoId == '-1'){
		alert('Debe completar el tipo al que pertenece el equipo.');
		return false;
	}
	if (!networkId || networkId == '-1'){
		alert('Debe completar la red a la que pertenece el equipo.');
		return false;
	}
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/inventory/updateEquipo.htm?communityRead=' + descripcion
										+ '&hostName=' + hostName
										+ '&iosType=' + iosType
										+ '&iosVersion=' + iosVersion
										+ '&ip=' + ip
										+ '&model=' + modelo
										+ '&serialNumber=' + serialNumber
										+ '&softwareRelease=' + release
										+ '&id_device_type=' + tipoEquipoId
										+ '&id_network=' + networkId
										+ '&enable=' + enabled).replace(/ /g, "%20"), function(){
		$('#goToAgregarEquipo').click(function() {
			  $('#equipoTabs a[href="#nuevoequipo"]').tab('show');
			});
		$('#nuevoequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#equiposTable").DataTable();
		
		//Load ok modal
		$('#createConfirmModal').modal('show');
	});
	
}

function displayEquipo(idEquipo, isEdition){
	$.ajax({
        url: "/TMNIntegralWeb/inventory/displayDevice.htm?dId=" + idEquipo,
        type: "POST",
        dataType: "json",
        success: function (response) {
        	$('#equipoTabs a[href="#editarequipo"]').tab('show');
        	$('#display-id').val(response.device_id);
        	$('#display-descripcion').val(response.communityRead);
        	$("#display-descripcion").prop('disabled', !isEdition);
        	$('#display-hostName').val(response.hostName);
        	$("#display-hostName").prop('disabled', !isEdition);
        	$('#display-iosType').val(response.iosType);
        	$("#display-iosType").prop('disabled', !isEdition);
        	$('#display-iosVersion').val(response.iosVersion);
        	$("#display-iosVersion").prop('disabled', !isEdition);
        	$('#display-ip').val(response.ip);
        	$("#display-ip").prop('disabled', !isEdition);
        	$('#display-modelo').val(response.model);
        	$("#display-modelo").prop('disabled', !isEdition);
        	$('#display-serialNumber').val(response.serialNumber);
        	$("#display-serialNumber").prop('disabled', !isEdition);
        	$('#display-release').val(response.softwareRelease);
        	$("#display-release").prop('disabled', !isEdition);
        	$('#display-tipoEquipoId').val(response.id_device_type);
        	$("#display-tipoEquipoId").prop('disabled', !isEdition);
        	$('#display-networkId').val(response.id_network);
        	$("#display-networkId").prop('disabled', !isEdition);
        	if (response.enabled != '0')
        		$('#display-enabled').prop('checked', true);
        	else
        		$('#display-enabled').prop('checked', false);
        	$("#display-enabled").prop('disabled', !isEdition);
        	$('#display-lastupdate').val(response.last_update_date);
        	if (isEdition)
        		$("#button-edition").show();
        	else
        		$("#button-edition").hide();
        },
        error: function(jqXHR, textStatus, errorThrown) {
           console.log(textStatus, errorThrown);
        }
    });
}

function actualizarEquipo(){
	var id = $('#display-id').val();
	var descripcion = $('#display-descripcion').val();
	var hostName = $('#display-hostName').val();
	var iosType = $('#display-iosType').val();
	var iosVersion = $('#display-iosVersion').val();
	var ip = $('#display-ip').val();
	var modelo = $('#display-modelo').val();
	var serialNumber = $('#display-serialNumber').val();
	var release = $('#display-release').val();
	var tipoEquipoId = $('#display-tipoEquipoId').val();
	var networkId = $('#display-networkId').val();
	var enabled = $('#display-enabled').prop('checked') ? 1 : 0;
	
	if (!descripcion || descripcion == ''){
		alert('Debe completar la descripcion del equipo.');
		return false;
	}
	if (!ip || ip == '' || !validateIp(ip)){
		alert('Debe ingresar una IP valida para el equipo.');
		return false;
	}
	if (!tipoEquipoId || tipoEquipoId == '-1'){
		alert('Debe completar el tipo al que pertenece el equipo.');
		return false;
	}
	if (!networkId || networkId == '-1'){
		alert('Debe completar la red a la que pertenece el equipo.');
		return false;
	}
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/inventory/updateEquipo.htm?idDevice=' + id +'&communityRead=' + descripcion
																			+ '&hostName=' + hostName
																			+ '&iosType=' + iosType
																			+ '&iosVersion=' + iosVersion
																			+ '&ip=' + ip
																			+ '&model=' + modelo
																			+ '&serialNumber=' + serialNumber
																			+ '&softwareRelease=' + release
																			+ '&id_device_type=' + tipoEquipoId
																			+ '&id_network=' + networkId
																			+ '&enable=' + enabled).replace(/ /g, "%20"), function(){
		$('#goToAgregarEquipo').click(function() {
			  $('#equipoTabs a[href="#nuevoequipo"]').tab('show');
			});
		$('#nuevoequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarequipotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#equiposTable").DataTable();
		
		//Load ok modal
		$('#updateConfirmModal').modal('show');
	});
	
}

//Red
$(document).on("click", ".open-DeleteNetworkDialog", function () {
    var redId = $(this).data('id');
    $("#redDelId").val(redId);
});

function displayRedes(){
	$('#main-content').empty();
	$('#main-content').load('inventory/listRedes.htm', function(){
		$('#goToAgregarRed').click(function() {
			  $('#redesTabs a[href="#nuevared"]').tab('show');
			});
		$('#nuevaredTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarredTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#redesTable").DataTable();
	});
}

function deleteRed(){
	var redId = $('#redDelId').val();
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/inventory/eliminarRed.htm?rId=' + redId, function(){
		$('#goToAgregarRed').click(function() {
			  $('#redesTabs a[href="#nuevared"]').tab('show');
			});
		$('#nuevaredTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarredTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#redesTable").DataTable();

		//Remove modal leftovers
		$("body").removeClass('modal-open');
		$("div").remove(".modal-backdrop.fade.in");
		
		//Load ok modal
		$('#delConfirmModal').modal('show');
	});
}

function agregarRed(){
	var nombre = $('#nombre').val();
	var enabled =  $('#enabled').val() == 'on' ? 1 : 0
	var descripcion = $('#descripcion').val();
	
	if (!nombre || nombre == ''){
		alert('Debe completar el nombre de la red.');
		return false;
	}
	if (!descripcion || descripcion == ''){
		alert('Debe completar la descripcion de la red.');
		return false;
	}
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/inventory/updateRed.htm?network=' + nombre
																			+ '&enabled=' + enabled
																			+ '&description=' + descripcion).replace(/ /g, "%20"), function(){
		$('#goToAgregarRed').click(function() {
			  $('#redesTabs a[href="#nuevared"]').tab('show');
			});
		$('#nuevaredTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarredTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#redesTable").DataTable();
		
		//Load ok modal
		$('#createConfirmModal').modal('show');
	});
	
}

function displayRed(redId, isEdition){
	$.ajax({
        url: "/TMNIntegralWeb/inventory/displayRed.htm?redId=" + redId,
        type: "POST",
        dataType: "json",
        success: function (response) {
        	$('#redesTabs a[href="#editarred"]').tab('show');
        	$('#display-idRed').val(response.id_network);
        	$('#display-nombre').val(response.network);
        	$("#display-nombre").prop('disabled', !isEdition);
        	if (response.enabled != '0')
        		$('#display-enabled').prop('checked', true);
        	else
        		$('#display-enabled').prop('checked', false);
        	$("#display-enabled").prop('disabled', !isEdition);
        	$('#display-descripcion').val(response.descripcion);
        	$("#display-descripcion").prop('disabled', !isEdition);
        	if (isEdition)
        		$("#button-edition").show();
        	else
        		$("#button-edition").hide();
        },
        error: function(jqXHR, textStatus, errorThrown) {
           console.log(textStatus, errorThrown);
        }
    });
}

function actualizarRed(){
	
	var id = $('#display-idRed').val();
	var nombre = $('#display-nombre').val();
	var enabled = $('#display-enabled').prop('checked') ? 1 : 0;
	var descripcion = $('#display-descripcion').val();
	
	if (!nombre || nombre == ''){
		alert('Debe completar el nombre de la red.');
		return false;
	}
	if (!descripcion || descripcion == ''){
		alert('Debe completar la descripcion de la red.');
		return false;
	}
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/inventory/updateRed.htm?idred=' + id + '&network=' + nombre
																			+ '&enabled=' + enabled
																			+ '&description=' + descripcion).replace(/ /g, "%20"), function(){
		$('#goToAgregarRed').click(function() {
			  $('#redesTabs a[href="#nuevared"]').tab('show');
			});
		$('#nuevaredTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarredTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#redesTable").DataTable();
		
		//Load ok modal
		$('#updateConfirmModal').modal('show');
	});
	
}

//Interfaces
$(document).on("click", ".open-DeleteInterfaceDialog", function () {
    var interfaceId = $(this).data('id');
    $("#interfaceDelId").val(interfaceId);
});

function displayInterfaces(){
	$('#main-content').empty();
	$('#main-content').load('inventory/listInterface.htm', function(){
		$('#goToAgregarInterface').click(function() {
			  $('#interfacesTabs a[href="#nuevaInterfaz"]').tab('show');
			});
		$('#nuevaInterfazTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarInterfazTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#interfacesTable").DataTable();
	});
}

function deleteInterface(){
	var interfaceId = $('#interfaceDelId').val();
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/inventory/eliminarInterface.htm?iId=' + interfaceId, function(){
		$('#goToAgregarInterface').click(function() {
			  $('#interfacesTabs a[href="#nuevaInterfaz"]').tab('show');
			});
		$('#nuevaInterfazTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarInterfazTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#interfacesTable").DataTable();

		//Remove modal leftovers
		$("body").removeClass('modal-open');
		$("div").remove(".modal-backdrop.fade.in");
		
		//Load ok modal
		$('#delConfirmModal').modal('show');
	});
}

function agregarInterface(){
	var nombre = $('#nombre').val();
	var status = $('#status').val();
	var alias = $('#alias').val();
	var shelf = $('#shelf').val();
	var slot = $('#slot').val();
	var puerto = $('#puerto').val();
	var subpuerto = $('#subpuerto').val();
	var tipo = $('#tipo').val();
	var idDevice = $('#idDevice').val();
	var ifIndex = $('#ifIndex').val();
	var ifIndexIp = $('#ifIndexIp').val();
	var mac = $('#mac').val();
	var ipnexthop = $('#ipnexthop').val();
	var macnexthop = $('#macnexthop').val();
	
	if (!nombre || nombre == ''){
		alert('Debe completar el nombre de la interfaz.');
		return false;
	}
	if (ipnexthop && ipnexthop != '' && !validateIp(ipnexthop)){
		alert('Debe ingresar una IP valida para el proximo salto.');
		return false;
	}
	if (ifIndexIp && ifIndexIp != '' && !validateIp(ifIndexIp)){
		alert('Debe ingresar una IP valida el IF index.');
		return false;
	}
	if (!idDevice || idDevice == '-1'){
		alert('Debe completar el equipo al que pertenece la interfaz.');
		return false;
	}
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/inventory/updateInterface.htm?status=' + status
																			+ '&alias=' + alias
																			+ '&name=' + nombre
																			+ '&shelf=' + shelf
																			+ '&slot=' + slot
																			+ '&port=' + puerto
																			+ '&subport=' + subpuerto
																			+ '&type=' + tipo
																			+ '&device=' + idDevice
																			+ '&ifIndex=' + ifIndex
																			+ '&ipAdEntIfIndex=' + ifIndexIp
																			+ '&mac=' + mac
																			+ '&ip_next_hop=' + ipnexthop
																			+ '&mac_next_hop=' + macnexthop).replace(/ /g, "%20"), function(){
		$('#goToAgregarInterface').click(function() {
			  $('#interfacesTabs a[href="#nuevaInterfaz"]').tab('show');
			});
		$('#nuevaInterfazTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarInterfazTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#interfacesTable").DataTable();

		//Load ok modal
		$('#createConfirmModal').modal('show');
	});
	
}

function displayInterfaz(idInterface, isEdition){
	$.ajax({
        url: "/TMNIntegralWeb/inventory/displayInterface.htm?iId=" + idInterface,
        type: "POST",
        dataType: "json",
        success: function (response) {
        	$('#interfacesTabs a[href="#editarInterfaz"]').tab('show');
        	$('#display-id').val(response.id);
        	$('#display-nombre').val(response.name);
        	$("#display-nombre").prop('disabled', !isEdition);
        	$('#display-status').val(response.adminStatus);
        	$("#display-status").prop('disabled', !isEdition);
        	$('#display-alias').val(response.alias);
        	$("#display-alias").prop('disabled', !isEdition);
        	$('#display-shelf').val(response.shelf);
        	$("#display-shelf").prop('disabled', !isEdition);
        	$('#display-slot').val(response.slot);
        	$("#display-slot").prop('disabled', !isEdition);
        	$('#display-puerto').val(response.port);
        	$("#display-puerto").prop('disabled', !isEdition);
        	$('#display-subpuerto').val(response.subport);
        	$("#display-subpuerto").prop('disabled', !isEdition);
        	$('#display-tipo').val(response.type);
        	$("#display-tipo").prop('disabled', !isEdition);
        	$('#display-idDevice').val(response.id_device);
        	$("#display-idDevice").prop('disabled', !isEdition);
        	$('#display-ifIndex').val(response.ifIndex);
        	$("#display-ifIndex").prop('disabled', !isEdition);
        	$('#display-ifIndexIp').val(response.ipAdEntIfIndex);
        	$("#display-ifIndexIp").prop('disabled', !isEdition);
        	$('#display-mac').val(response.mac);
        	$("#display-mac").prop('disabled', !isEdition);
        	$('#display-ipnexthop').val(response.ip_next_hop);
        	$("#display-ipnexthop").prop('disabled', !isEdition);
        	$('#display-macnexthop').val(response.mac_next_hop);
        	$("#display-macnexthop").prop('disabled', !isEdition);
        	$('#display-lastupdate').val(response.last_update_date);
        	if (isEdition)
        		$("#button-edition").show();
        	else
        		$("#button-edition").hide();
        },
        error: function(jqXHR, textStatus, errorThrown) {
           console.log(textStatus, errorThrown);
        }
    });
}

function actualizarInterfaz(){
	var id = $('#display-id').val();
	var nombre = $('#display-nombre').val();
	var status = $('#display-status').val();
	var alias = $('#display-alias').val();
	var shelf = $('#display-shelf').val();
	var slot = $('#display-slot').val();
	var puerto = $('#display-puerto').val();
	var subpuerto = $('#display-subpuerto').val();
	var tipo = $('#display-tipo').val();
	var idDevice = $('#display-idDevice').val();
	var ifIndex = $('#display-ifIndex').val();
	var ifIndexIp = $('#display-ifIndexIp').val();
	var mac = $('#display-mac').val();
	var ipnexthop = $('#display-ipnexthop').val();
	var macnexthop = $('#display-macnexthop').val();
	
	if (!nombre || nombre == ''){
		alert('Debe completar el nombre de la interfaz.');
		return false;
	}
	if (ipnexthop && ipnexthop != '' && !validateIp(ipnexthop)){
		alert('Debe ingresar una IP valida para el proximo salto.');
		return false;
	}
	if (ifIndexIp && ifIndexIp != '' && !validateIp(ifIndexIp)){
		alert('Debe ingresar una IP valida el IF index.');
		return false;
	}
	if (!idDevice || idDevice == '-1'){
		alert('Debe completar el equipo al que pertenece la interfaz.');
		return false;
	}
	
	$('#main-content').empty();
	$('#main-content').load(('/TMNIntegralWeb/inventory/updateInterface.htm?idInterfaz=' + id + '&status=' + status
													+ '&alias=' + alias
													+ '&name=' + nombre
													+ '&shelf=' + shelf
													+ '&slot=' + slot
													+ '&port=' + puerto
													+ '&subport=' + subpuerto
													+ '&type=' + tipo
													+ '&device=' + idDevice
													+ '&ifIndex=' + ifIndex
													+ '&ipAdEntIfIndex=' + ifIndexIp
													+ '&mac=' + mac
													+ '&ip_next_hop=' + ipnexthop
													+ '&mac_next_hop=' + macnexthop).replace(/ /g, "%20"), function(){
			$('#goToAgregarInterface').click(function() {
			$('#interfacesTabs a[href="#nuevaInterfaz"]').tab('show');
			});
			$('#nuevaInterfazTab').click(function(event){
			if ($(this).hasClass('disabled')) {
			return false;
			}
			});
			$('#editarInterfazTab').click(function(event){
			if ($(this).hasClass('disabled')) {
			return false;
			}
			});
			
			$("#interfacesTable").DataTable();
			
			//Load ok modal
			$('#updateConfirmModal').modal('show');
	});
}


//TOPOLOGIA
function displayTopologiaRed(){
	$('#main-content').empty();
	$('#main-content').load('inventory/displayNetwork.htm', function(){
		var jsonObj = JSON.parse($("#network-json").val().replace(new RegExp('\'','g'),'"'));
		mostrarTopologiaConImagenes(jsonObj);
	});
}

function mostrarTopologiaConImagenes(topologia) {

	var DIR = window.location.pathname +  '/../img/topologia/';
	
    var EDGE_LENGTH_MAIN = 150;
    var EDGE_LENGTH_SUB = 50;

	// Create a data table with nodes.
    nodes = [];

    // Create a data table with links.
    edges = [];
    
    for (var i=0; i<topologia.elements.length; i++){
    	var elmt = topologia.elements[i];
    	elmt.shape = 'image';
    	if (elmt.type == 'equipment')
    		elmt.image = DIR + 'computer.png';
    	else if (elmt.type == 'interface')
    		elmt.image = DIR + 'router.png';
    	nodes.push(elmt);
    }
    
    for (var i=0; i<topologia.links.length; i++){
    	var link = topologia.links[i];
    	if (link.type == 'internal')
    		link.length = EDGE_LENGTH_SUB;
    	else if (link.type == 'external')
    		link.length = EDGE_LENGTH_MAIN;
    	edges.push(link);
    }

    // create a network
    var container = document.getElementById('net-container');
    var data = {
      nodes: nodes,
      edges: edges
    };
    var options = {};
    network = new vis.Network(container, data, options);
}

function callDiscoveryPgm(){
	$('#main-content').empty();
	$('#main-content').load('inventory/callDiscoveryPgm.htm', function(){
		$('#goToAgregarInterface').click(function() {
			  $('#interfacesTabs a[href="#nuevaInterfaz"]').tab('show');
			});
		$('#nuevaInterfazTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarInterfazTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#interfacesTable").DataTable();

		//Load ok modal
		$('#createConfirmDiscoveryModal').modal('show');
	});
}
