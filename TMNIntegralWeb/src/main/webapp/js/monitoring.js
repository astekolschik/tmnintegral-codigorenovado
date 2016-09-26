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
			var data = new google.visualization.DataTable();
		    data.addColumn('number', 'Day');
		    data.addColumn('number', 'Guardians of the Galaxy');
		    data.addColumn('number', 'The Avengers');
		    data.addColumn('number', 'Transformers: Age of Extinction');
	
		    data.addRows([
		      [1,  37.8, 80.8, 41.8],
		      [2,  30.9, 69.5, 32.4],
		      [3,  25.4,   57, 25.7],
		      [4,  11.7, 18.8, 10.5],
		      [5,  11.9, 17.6, 10.4],
		      [6,   8.8, 13.6,  7.7],
		      [7,   7.6, 12.3,  9.6],
		      [8,  12.3, 29.2, 10.6],
		      [9,  16.9, 42.9, 14.8],
		      [10, 12.8, 30.9, 11.6],
		      [11,  5.3,  7.9,  4.7],
		      [12,  6.6,  8.4,  5.2],
		      [13,  4.8,  6.3,  3.6],
		      [14,  4.2,  6.2,  3.4]
		    ]);
		    var options = {
    	      chart: {
    	        title: 'Box Office Earnings in First Two Weeks of Opening',
    	        subtitle: 'in millions of dollars (USD)'
    	      },
    	      width: 900,
    	      height: 500
    	    };
    	    // Instantiate and draw our chart, passing in some options.
    	    var chart = new google.charts.Line(document.getElementById('report-content'));
    	    chart.draw(data, options);
        },
        error: function(jqXHR, textStatus, errorThrown) {
           console.log(textStatus, errorThrown);
        }
    });
}
