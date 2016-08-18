function createUserValidate(){
	return validatePassword();
}

function validatePassword(){
	var pass1 = $('#password').val();
	var pass2 = $('#password2').val();
	
	var re = new RegExp("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,20})");
	if (!re.test(pass1)){
		alert('La contraseña no cumple los criterios de seguridad: \n '
				+ '1. Debe tener al menos un caracter en mínuscula.'
				+ '2. Debe tener al menos un caracter en mayúscula.'
				+ '3. Debe tener al menos un número.'
				+ '4. Debe tener una longitud entre 8 y 20 caracteres.');
		return false;
	}
	
	if (pass1 != ''){
		if (pass1 == pass2)
			return true;
		else{
			alert('Las contraseñas deben coincidir');
			return false;
		}
	}
}

function displayInProgress(){
	$('#main-content').empty();
	$('#main-content').load('enProgreso.htm');
}