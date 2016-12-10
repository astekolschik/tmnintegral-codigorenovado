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
		
		
		var table = $("#alarmasTable").DataTable(dataTableParams);
	    new $.fn.dataTable.FixedHeader( table, {
	        alwaysCloneTop: true
	    });
		
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
		
		var table = $("#alarmasTable").DataTable(dataTableParams);
	    new $.fn.dataTable.FixedHeader( table, {
	        alwaysCloneTop: true
	    });
	});
}

function displayInicioReportes(){
	$('#main-content').empty();
	$('#main-content').load('monitoring/parametrosReporte.htm', function(){
		google.charts.load('current', {'packages':['corechart', 'line', 'table']});
	});
}

function limpiarValoresReporte(){
	$('#lista-equipos-value').val('');
	$('#lista-interfaces-value').val('');
}

function validarFormReporte(){
	if ($('#tipo-reporte').val() == -1){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe seleccionar el tipo de reporte.');
		$('#validationModal').modal('show');
		//alert('Debe seleccionar el tipo de reporte.');
		return false;
	}
	
	if ($('#fecha-desde').val() == "" ||  $('#fecha-hasta').val() == ""){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe seleccionar las fechas para el reporte.');
		$('#validationModal').modal('show');
		//alert('Debe seleccionar las fechas para el reporte.');
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
        		$('#validation-modal-error').empty();
        		$('#validation-modal-error').append('No se encontro informacion para el reporte.');
        		$('#validationModal').modal('show');
        		return;
        	}
        		
        	var data = new google.visualization.DataTable(response);
			$('#reportesTab a[href="#reporte"]').tab('show');
		    //Reporte lineal
			/*var componentsToolbar = [{type: 'html', datasource: response},
			                         {type: 'csv', datasource: response}
			              		];
			google.visualization.drawToolbar(document.getElementById('report-content-lineal-toolbar'), componentsToolbar);*/
			var optionsLine = {
    	      chart: {
    	        title: 'Reporte Lineal'
    	      },
    	      width: 900,
    	      height: 400
    	    };
    	    var lineChart = new google.charts.Line(document.getElementById('report-content-lineal'));
    	    lineChart.draw(data, optionsLine);
    	    //Reporte Columnas
			//google.visualization.drawToolbar(document.getElementById('report-content-columna-toolbar'), componentsToolbar);
    	    var optionsCol = {
    	      chart: {
    	        title: 'Reporte Columnas'
    	      },
    	      width: 900,
    	      height: 400
    	    };
    	    var columnChart = new google.visualization.ColumnChart(document.getElementById('report-content-columna'));
    	    columnChart.draw(data, optionsCol);
    	    //Reporte torta
    	    var dataForPieJson = getDataForPie(response);
    	    /*var componentsToolbarPie = [{type: 'html', datasource: dataForPieJson},
			                         {type: 'csv', datasource: dataForPieJson}
			              		];
			google.visualization.drawToolbar(document.getElementById('report-content-torta-toolbar'), componentsToolbarPie);
			*/
    	    var dataForPie = google.visualization.arrayToDataTable(dataForPieJson);
            var optionsForPie = {chart: {
		    	        title: 'Porcentajes'
		  	      },
		  	      width: 900,
		  	      height: 400};
            var pieChart = new google.visualization.PieChart(document.getElementById('report-content-torta'));
            pieChart.draw(dataForPie, optionsForPie);
    	    //Reporte Tabla
            //google.visualization.drawToolbar(document.getElementById('report-content-tablalumna-toolbar'), componentsToolbar);
    	    var table = new google.visualization.Table(document.getElementById('report-content-tabla'));
            table.draw(data, {showRowNumber: true, width: '100%', height: '100%', title: 'Mediciones'});
        },
        error: function(jqXHR, textStatus, errorThrown) {
        	$('#validation-modal-error').empty();
    		$('#validation-modal-error').append('Error al generar el reporte');
    		$('#validationModal').modal('show');
        	console.log(textStatus, errorThrown);
        }
    });
}

function getDataForPie(info){
	var cols = [];
	for (var i=1; i<info.cols.length;i++){
		cols.push(info.cols[i]);
	}
	
	var rows = [];
	for (i in info.rows){
		for (var j = 0; j < cols.length; j++){
			if (rows[j] == null)
				rows[j] = 0;
			rows[j] = rows[j] + (info.rows[i].c[j+1]? info.rows[i].c[j+1].v : 0);
		}
	}
	
	var ret = [['Nombre', 'Valor']];
	for (i = 0; i < cols.length; i++){
		ret.push([cols[i].label, rows[i]]);
	}
	return ret;
}

function displayReportSelected(){
	switch($('input[name=radio-reporte]:checked').val()){
	case "lineal":
		$('#reporte-lineal').show();
		$('#reporte-columna').hide();
		$('#reporte-torta').hide();
		$('#reporte-tabla').hide();
		break;
	case "columna":
		$('#reporte-lineal').hide();
		$('#reporte-columna').show();
		$('#reporte-torta').hide();
		$('#reporte-tabla').hide();
		break;
	case "torta":
		$('#reporte-lineal').hide();
		$('#reporte-columna').hide();
		$('#reporte-torta').show();
		$('#reporte-tabla').hide();
		break;
	case "tabla":
		$('#reporte-lineal').hide();
		$('#reporte-columna').hide();
		$('#reporte-torta').hide();
		$('#reporte-tabla').show();
		break;
	}
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
		
		
		var table = $("#alarmasTable").DataTable(dataTableParams);
	    new $.fn.dataTable.FixedHeader( table, {
	        alwaysCloneTop: true
	    });
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
		$('#combo-interface-device').show();
		break;
	case "device":
		$('#combo-interface').hide();
		$('#combo-device').show();
		$('#combo-interface-device').hide();
		break;
	}
}

function agregarAlarma(){
	var typealarm = $('input[name=radio-obj]:checked').val();
	var url = "/TMNIntegralWeb/monitoring/createAlarm.htm?";
	if (typealarm == 'interface'){
		if (!$('#interface').val() || $('#interface').val() == '-1'){
			$('#validation-modal-error').empty();
			$('#validation-modal-error').append('Debe seleccionar la interface para la alarma.');
			$('#validationModal').modal('show');
			//alert('Debe seleccionar la interface para la alarma.');
			return false;
		}
		url = url + "idInt=" + $('#interface').val();
	}else if (typealarm == 'device'){
		if (!$('#device').val() || $('#device').val() == '-1'){
			$('#validation-modal-error').empty();
			$('#validation-modal-error').append('Debe seleccionar el equipo para la alarma.');
			$('#validationModal').modal('show');
			//alert('Debe seleccionar el equipo para la alarma.');
			return false;
		}
		url = url + "idDev=" + $('#device').val();
	}else{
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe seleccionar el tipo de la alarma.');
		$('#validationModal').modal('show');
		//alert('Debe seleccionar el tipo de la alarma.');
		return false;
	}
	url = url + "&idVar=" + $('#variable').val();
	url = url + "&dest=" + $('#destinatarios').val();
	if ($('#umbral').val() != '')
		url = url + "&umbral=" + $('#umbral').val();
	
	if (!$('#variable').val() || $('#variable').val() == '-1'){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe completar la variable a la que corresponde la alarma.');
		$('#validationModal').modal('show');
		//alert('Debe completar la variable a la que corresponde la alarma.');
		return false;
	}
	
	if (!$('#destinatarios').val() || $('#destinatarios').val() == ''){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('Debe completar los destinatarios de la alarma.');
		$('#validationModal').modal('show');
		//alert('Debe completar los destinatarios de la alarma.');
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
		
		
		var table = $("#alarmasTable").DataTable(dataTableParams);
	    new $.fn.dataTable.FixedHeader( table, {
	        alwaysCloneTop: true
	    });
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
    		$('#variable-display').val(response.variableName);
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
function displayInterfacesByDevice(){
	var idDevice = $('#interface-device').val();
	$.ajax({
        url: "/TMNIntegralWeb/monitoring/getDeviceInterfaces.htm?deviceId=" + idDevice,
        type: "POST",
        dataType: "json",
        success: function (response) {
        	$('#interface option').remove();
        	$('#interface').append('<option value="-1">Seleccione la interfaz</option>');
        	for (i in response){
        		//${i.id},${i.device.ip}_${i.device.hostName}_${i.name}
        		
        		$('#interface').append('<option value="' + response[i].id + ','+ response[i].device_ip + '_'+ response[i].device_name + '_' + response[i].name + '">' 
        				+ response[i].name + '</option>');
        	}
        },
        error: function(jqXHR, textStatus, errorThrown) {
           console.log(textStatus, errorThrown);
        }
    });

}