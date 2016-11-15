$(document).on("click", ".open-DeleteAlarmDialog", function () {
     var alarmId = $(this).data('id');
     $("#alarmDelId").val(alarmId);
});

function displayAlarmasEnviadas(){
	$('#main-content').empty();
	$('#main-content').load('monitoring/listadoAlarmasEnviadas.htm', function(){
		$('#goToAgregarAlarma').click(function() {
			$('#alarmasTabs a[href="#nuevaalarma"]').tab('show');
		});
		$('#nuevaalarmaTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editaralarmaTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});		
		
		
		$("#alarmasTable").DataTable();
	});
}

function configurarAlarmas(){
	$('#main-content').empty();
	$('#main-content').load('monitoring/configurarAlarmas.htm', function(){
		$('#goToAgregarAlarma').click(function() {
			$('#alarmasTabs a[href="#nuevaalarma"]').tab('show');
		});
		$('#nuevaalarmaTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editaralarmaTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});		
		
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
	
	/*if ($('#nombre-equipo').val().length == 0){
		alert('Debe seleccionar al menos un equipo.');
		return false;
	}else{*/
		if ($('#nombre-equipo').val()){
			var listEq = "";
			for (var i=0; i < $('#nombre-equipo').val().length; i++){
				if (i != 0)
					listEq += ",";
				listEq += $('#nombre-equipo').val()[i];
			}
			$('#lista-equipos-value').val(listEq);
		}
		if ($('#nombre-interface').val()){
			var listIn = "";
			for (var i=0; i < $('#nombre-interface').val().length; i++){
				if (i != 0)
					listIn += ",";
				listIn += $('#nombre-interface').val()[i];
			}
			$('#lista-interfaces-value').val(listIn);
		}
	/*}*/
	
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
        	if (response.rows == 0){
        		alert('No se encontro informacion para el reporte');
        		return;
        	}
        		
        	var data = new google.visualization.DataTable(response);
			$('#reportesTab a[href="#reporte"]').tab('show');
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

function deleteAlarma(){
	var alarmid = $('#alarmDelId').val();
	$('#main-content').empty();
	$('#main-content').load('/TMNIntegralWeb/monitoring/eliminarAlarma.htm?alarmId=' + alarmid, function(){
		$('#goToAgregarAlarma').click(function() {
			$('#alarmasTabs a[href="#nuevaalarma"]').tab('show');
		});
		$('#nuevaalarmaTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editaralarmaTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});		
		
		
		$("#alarmasTable").DataTable();
		//Remove modal leftovers
		$("body").removeClass('modal-open');
		$("div").remove(".modal-backdrop.fade.in");
		
		//Load ok modal
		$('#delConfirmModal').modal('show');
	});
}

function displayComboNew(){
	switch($('input[name=radio-obj]:checked').val()){
	case "interface":
		$('#combo-interface').show();
		$('#combo-device').hide();
		break;
	case "device":
		$('#combo-interface').hide();
		$('#combo-device').show();
		break;
	}
}

function agregarAlarma(){
	var typealarm = $('input[name=radio-obj]:checked').val();
	var url = "/TMNIntegralWeb/monitoring/createAlarm.htm?";
	if (typealarm == 'interface'){
		if (!$('#interface').val() || $('#interface').val() == '-1'){
			alert('Debe seleccionar la interface para la alarma.');
			return false;
		}
		url = url + "idInt=" + $('#interface').val();
	}else if (typealarm == 'device'){
		if (!$('#device').val() || $('#device').val() == '-1'){
			alert('Debe seleccionar el equipo para la alarma.');
			return false;
		}
		url = url + "idDev=" + $('#device').val();
	}else{
		alert('Debe seleccionar el tipo de la alarma.');
		return false;
	}
	url = url + "&idVar=" + $('#variable').val();
	url = url + "&dest=" + $('#destinatarios').val();
	if ($('#umbral').val() != '')
		url = url + "&umbral=" + $('#umbral').val();
	
	if (!$('#variable').val() || $('#variable').val() == '-1'){
		alert('Debe completar la variable a la que corresponde la alarma.');
		return false;
	}
	
	if (!$('#destinatarios').val() || $('#destinatarios').val() == ''){
		alert('Debe completar los destinatarios de la alarma.');
		return false;
	}
	
	$('#main-content').empty();
	$('#main-content').load(url, function(){
		$('#goToAgregarAlarma').click(function() {
			$('#alarmasTabs a[href="#nuevaalarma"]').tab('show');
		});
		$('#nuevaalarmaTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});
		$('#editaralarmaTab').click(function(event){
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		});		
		
		
		$("#alarmasTable").DataTable();
		$('#createConfirmModal').modal('show');
	});
	
}

function displayAlarma(idAlarm){
	$.ajax({
        url: "/TMNIntegralWeb/monitoring/displayAlarm.htm?id=" + idAlarm,
        type: "POST",
        dataType: "json",
        success: function (response) {
        	$('#alarmasTabs a[href="#editaralarma"]').tab('show');
    		$('#variable-display').val(response.idVariable);
        	if (response.idDevice != null)
        		$('#Objeto-display').val('Equipo: ' + response.deviceName);
        	if (response.idInterface != null)
        		$('#Objeto-display').val('Interface: ' + response.interfaceName);
        	$('#destinatarios-display').val(response.destinatarios);
        	$('#umbral-display').val(response.umbral);
        },
        error: function(jqXHR, textStatus, errorThrown) {
           console.log(textStatus, errorThrown);
        }
    });
}