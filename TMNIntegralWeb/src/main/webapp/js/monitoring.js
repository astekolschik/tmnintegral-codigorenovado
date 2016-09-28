function displayAlarmasEnviadas(){
	$('#main-content').empty();
	$('#main-content').load('monitoring/alarmas.htm', function(){
		$("#alarmasTable").DataTable();
	});
}

function displayInicioReportes(){
	$('#main-content').empty();
	$('#main-content').load('monitoring/parametrosReporte.htm', function(){
		google.charts.load('current', {'packages':['corechart', 'line']});
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
	var listaInterfaces = $('#lista-interfaces-value').val();
	var desde = $('#fecha-desde').val();
	var hasta = $('#fecha-hasta').val();
	
	$.ajax({
        url: 'monitoring/generarReporte.htm?tipo-reporte=' + tiporeporte 
				+ '&lista-equipos-value=' + listaEquipos
				+ '&lista-interfaces-value=' + listaInterfaces
				+ '&fecha-desde=' + desde + '&fecha-hasta=' + hasta,
        type: "POST",
        dataType: "json",
        success: function (response) {
			var data = new google.visualization.DataTable(response);
		    var options = {
    	      chart: {
    	        title: 'Reporte seleccionado'
    	      },
    	      width: 700,
    	      height: 400
    	    };
    	    var chart = new google.charts.Line(document.getElementById('report-content'));
    	    chart.draw(data, options);
        },
        error: function(jqXHR, textStatus, errorThrown) {
           console.log(textStatus, errorThrown);
        }
    });
}
