//Comandos
$(document).on("click", ".open-DeleteCommandDialog", function () {
     var comandoId = $(this).data('id');
     $("#commandDelId").val(comandoId);
});


function displayConfiguracion(){
	$('#main-content').empty();
	$('#main-content').load('configuration/listComandos.htm', function(){
		$('#goToAgregarCommand').click(function() {
			$('#commandTabs a[href="#nuevocomando"]').tab('show');
		});
		$('#nuevocomando').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarcomandotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});		
		
		$("#comandosTable").DataTable();
	});
}

function deleteComando(){
	var commandid = $('#commandDelId').val();
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/configuration/deleteComando.htm?commandId=' + commandid, function(){
		$('#goToAgregarCommand').click(function() {
			$('#commandTabs a[href="#nuevocomando"]').tab('show');
		});
		$('#nuevocomando').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarcomandotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		
		$("#comandosTable").DataTable();
		//Remove modal leftovers
		$("body").removeClass('modal-open');
		$("div").remove(".modal-backdrop.fade.in");
		
		//Load ok modal
		$('#delConfirmModal').modal('show');
	});
}


function displayCommand(idVar, idTipoEquipo, idFieldName, isEdition){
	$.ajax({
        url: "/TMNIntegralWeb/configuration/displayComando.htm?idVar=" + idVar + "&idTE=" + idTipoEquipo 
        							+ "&fieldName=" + idFieldName,
        type: "POST",
        dataType: "json",
        success: function (response) {
        	$('#commandTabs a[href="#editarcomando"]').tab('show');
        	$('#variable-display').val(response.variableId);
        	$("#variable-display").prop('disabled', !isEdition);
        	$('#tipoeequipo-display').val(response.tipoequipoId);
        	$("#tipoeequipo-display").prop('disabled', !isEdition);
        	$('#fieldname-display').val(response.fieldname);
        	$("#fieldname-display").prop('disabled', !isEdition);
        	$('#type-display').val(response.type);
        	$("#type-display").prop('disabled', !isEdition);
        	$('#regex-display').val(response.regex);
        	$("#regex-display").prop('disabled', !isEdition);
        	$('#operation-display').val(response.operation);
        	$("#operation-display").prop('disabled', !isEdition);
        	$('#isdevice-display').val(response.isdevice);
        	$("#isdevice-display").prop('disabled', !isEdition);
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

function agregarComando(){
	var variable = $('#variable').val();
	var tipoequipo = $('#tipoequipo').val();
	var fieldname = $('#fieldname').val();
	var type = $('#type').val();
	var regex = $('#regex').val();
	var operation = $('#operation').val();
	var device = $('#isdevice').prop('checked') ? 1 : 0;
	
	if (!variable || variable == '-1'){
		alert('Debe completar la variable a la que corresponde el comando.');
		return false;
	}
	if (!tipoequipo || tipoequipo == '-1'){
		alert('Debe completar el tipo al que pertenece el comando.');
		return false;
	}
	if (!fieldname || fieldname == ''){
		alert('Debe ingresar nombre de campo valido.');
		return false;
	}
	if (!type || type == ''){
		alert('Debe ingresar tipo valido.');
		return false;
	}
	
	
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/configuration/createCommand.htm?variable=' + variable
																			+ '&tipoequipo=' + tipoequipo
																			+ '&fieldname=' + fieldname
																			+ '&type=' + type
																			+ '&regex=' + regex
																			+ '&operation=' + operation
																			+ '&device=' + device, function(){
		$('#goToAgregarCommand').click(function() {
			$('#commandTabs a[href="#nuevocomando"]').tab('show');
		});
		$('#nuevocomando').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarcomandotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		
		$("#comandosTable").DataTable();
		$('#createConfirmModal').modal('show');
	});
	
}

function actualizarComando(){
	var variable = $('#variable-display').val();
	var tipoequipo = $('#tipoequipo-display').val();
	var fieldname = $('#fieldname-display').val();
	var type = $('#type-display').val();
	var regex = $('#regex-display').val();
	var operation = $('#operation-display').val();
	var device = $('#isdevice-display').prop('checked') ? 1 : 0;
	
	if (!variable || variable == '-1'){
		alert('Debe completar la variable a la que corresponde el comando.');
		return false;
	}
	if (!tipoequipo || tipoequipo == '-1'){
		alert('Debe completar el tipo al que pertenece el comando.');
		return false;
	}
	if (!fieldname || fieldname == ''){
		alert('Debe ingresar nombre de campo valido.');
		return false;
	}
	if (!type || type == ''){
		alert('Debe ingresar tipo valido.');
		return false;
	}
	
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/configuration/updateComando.htm?variable=' + variable
																			+ '&tipoequipo=' + tipoequipo
																			+ '&fieldname=' + fieldname
																			+ '&type=' + type
																			+ '&regex=' + regex
																			+ '&operation=' + operation
																			+ '&device=' + device, function(){
		$('#goToAgregarCommand').click(function() {
			$('#commandTabs a[href="#nuevocomando"]').tab('show');
		});
		$('#nuevocomando').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editarcomandotab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		
		$("#comandosTable").DataTable();
		
		//Load ok modal
		$('#updateConfirmModal').modal('show');
	});
	
}
