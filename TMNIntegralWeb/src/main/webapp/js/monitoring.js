function displayAlarmasEnviadas(){
	$('#main-content').empty();
	$('#main-content').load('monitoring/alarmas.htm', function(){
		$("#alarmasTable").DataTable();
	});
}

function displayInicioReportes(){
	$('#main-content').empty();
	$('#main-content').load('monitoring/parametrosReporte.htm', function(){
		$("#alarmasTable").DataTable();
	});
}

function validarFormReporte(){
	if ($('#tipo-reporte').val() == -1){
		alert('Debe seleccionar el tipo de reporte.');
		return false;
	}
	
	if ($('#fecha-desde').val() == "" ||  $('#fecha-hasta').val() == ""){
		alert('Debe seleccionar las fechas para el reporte.');
		return false;
	}
	
	if ($('#nombre-equipo').val().length == 0){
		alert('Debe seleccionar al menos un equipo.');
		return false;
	}else{
		var listEq = "";
		for (var i=0; i < $('#nombre-equipo').val().length; i++){
			if (i != 0)
				listEq += ",";
			listEq += $('#nombre-equipo').val()[i];
		}
		$('#lista-equipos-value').val(listEq);
	}
	
	return true;
}

function generarReporte(){
	if (!validarFormReporte())
		return;
	var tiporeporte = $('#tipo-reporte').val();
	var tiporeporte = $('#tipo-reporte').val();
	var tiporeporte = $('#tipo-reporte').val();
	var tiporeporte = $('#tipo-reporte').val();
	
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
