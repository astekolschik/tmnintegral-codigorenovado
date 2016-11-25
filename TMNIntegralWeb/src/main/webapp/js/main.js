var dataTableParams = 
		{ language: {
				"sProcessing": "Procesando...",
				"sLengthMenu": "Mostrar _MENU_ registros",
				"sZeroRecords": "No se encontraron resultados",
				"sEmptyTable": "Ningún dato disponible en esta tabla",
				"sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
				"sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
				"sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
				"sInfoPostFix": "",
				"sSearch": "Buscar:",
				"sUrl": "",
				"sInfoThousands": ",",
				"sLoadingRecords": "Cargando...",
				"oPaginate": {
					"sFirst": "Primero",
					"sLast": "Último",
					"sNext": "Siguiente",
					"sPrevious": "Anterior"
				},
				"oAria": {
					"sSortAscending": ": Activar para ordenar la columna de manera ascendente",
					"sSortDescending": ": Activar para ordenar la columna de manera descendente"
				}
			}
		};

function createUserValidate(){
	return validatePassword();
}

function validatePassword(){
	var pass1 = $('#password').val();
	var pass2 = $('#password2').val();
	
	var re = new RegExp("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,20})");
	if (!re.test(pass1)){
		$('#validation-modal-error').empty();
		$('#validation-modal-error').append('La contraseña no cumple los criterios de seguridad: \n '
				+ '1. Debe tener al menos un caracter en mínuscula.'
				+ '2. Debe tener al menos un caracter en mayúscula.'
				+ '3. Debe tener al menos un número.'
				+ '4. Debe tener una longitud entre 8 y 20 caracteres.');
		$('#validationModal').modal('show');
		/*alert('La contraseña no cumple los criterios de seguridad: \n '
				+ '1. Debe tener al menos un caracter en mínuscula.'
				+ '2. Debe tener al menos un caracter en mayúscula.'
				+ '3. Debe tener al menos un número.'
				+ '4. Debe tener una longitud entre 8 y 20 caracteres.');*/
		return false;
	}
	
	if (pass1 != ''){
		if (pass1 == pass2)
			return true;
		else{
			$('#validation-modal-error').empty();
			$('#validation-modal-error').append('Las contraseñas deben coincidir.');
			$('#validationModal').modal('show');
			//alert('Las contraseñas deben coincidir');
			return false;
		}
	}
}

function displayInProgress(){
	$('#main-content').empty();
	$('#main-content').load('enProgreso.htm');
}