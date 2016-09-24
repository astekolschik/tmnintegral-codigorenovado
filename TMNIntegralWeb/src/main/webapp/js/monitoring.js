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
	var listaEquipos = $('#lista-equipos-value').val();
	var desde = $('#fecha-desde').val();
	var hasta = $('#fecha-hasta').val();
	
	$('#main-content').empty();
	$('#main-content').load('monitoring/generarReporte.htm?tipo-reporte=' + tiporeporte 
				+ '&lista-equipos-value=' + listaEquipos
				+ '&fecha-deste=' + desde + '&fecha-hasta=' + hasta, function(){
	});
}
