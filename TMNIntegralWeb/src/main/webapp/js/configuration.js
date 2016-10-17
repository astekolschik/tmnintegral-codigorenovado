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


function displayCommand(idVar, idTipoEquipo, idFieldName, isEdit){
	$.ajax({
        url: "/TMNIntegralWeb/configuration/displayCommand.htm?idVar=" + idVar + "&idTE=" + idTipoEquipo + "&idFN=" + idFieldName,
        type: "POST",
        dataType: "json",
        success: function (response) {
        	$('#commandTabs a[href="#editarcomando"]').tab('show');
        	$('#display-id').val(response.id);
        	$("#display-id").prop('disabled', !isEdition);
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