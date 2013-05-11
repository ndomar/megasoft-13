$(document).ready(function() {
	//Everytime a key is pressed on the password field, the function in "password_strength_meter.js" checks
	//it's strength and returns a string to the user next to the password field with the strength 
	$('#password').keyup(function(){
		$('#result').html(passwordStrength($('#password').val(),$('#email').val().split("@")[0]));
		switch ($('#result').html()){
			case "كلمة سر قصيرة":
				$('#result').css("color","red");
				$('#password').css("border-color", "red");
				break;
			case "ضعيف":
				$('#result').css("color","red");
				$('#password').css("border-color", "red");
				break;
			case "جيد":
				$('#result').css("color","lime");
				$('#password').css("border-color", "lime");
				break;
			case "قوي":
				$('#result').css("color","green");
				$('#password').css("border-color", "green");
				break;
		}
	});
	//Checks if both the password and repeated password fields are identical
	$('#password').keyup(function(){
		$('#confirmation').html(passwordMatching($('#password').val(),$('#password2').val()));
		switch($('#confirmation').html()){
			case "كلمة السر غير متطابقة":
				$('#confirmation').css("color","red");
				$('#password2').css("border-color","red");
				break;
			case "كلمة السر متطابقة":
				$('#confirmation').css("color","green");
				$('#password2').css("border-color","green");
				break;
		}
	});
	$('#password2').keyup(function(){
		$('#confirmation').html(passwordMatching($('#password').val(),$('#password2').val()));
		switch($('#confirmation').html()){
			case "كلمة السر غير متطابقة":
				$('#confirmation').css("color","red");
				$('#password2').css("border-color","red");
				break;
			case "كلمة السر متطابقة":
				$('#confirmation').css("color","green");
				$('#password2').css("border-color","green");
				break;
		}
	});
	//Checks if both the password and repeated password fields are identical
	$('#password2').keyup(function(){
		$('#confirmation').html(passwordMatching($('#password').val(),$('#password2').val()));
		switch($('#confirmation').html()){
			case "كلمة السر غير متطابقة":
				$('#confirmation').css("color","red");
				break;
			case "كلمة السر متطابقة":
				$('#confirmation').css("color","green");
				break;
		}
	});
	//Disables submit button
	$('input[type="submit"]').attr('disabled','disabled');
	//Enables the submit button if all fields are not blank after typing in a textarea
	$(document.getElementById("box1")).keyup(function(){
		if($(this).val()!= ''
		    && document.getElementById("email").value!='' 
			&& document.getElementById("box1").value!=''
			&& document.getElementById("box2").value!=''
			){
			$('input[type="submit"]').removeAttr('disabled');
		}else {
			$('input[type="submit"]').attr('disabled','disabled');
		}
	});
	$(document.getElementById("email")).keyup(function(){
		if($(this).val()!= ''
		    && document.getElementById("email").value!='' 
			&& document.getElementById("box1").value!=''
			&& document.getElementById("box2").value!=''
			){
			$('input[type="submit"]').removeAttr('disabled');
		}else {
			$('input[type="submit"]').attr('disabled','disabled');
		}
	});
	//Enables the submit button if all fields are not blank after typing in email textarea
	$(document.getElementById("box2")).keyup(function(){
		if($(this).val()!= ''
		    && document.getElementById("email").value!='' 
			&& document.getElementById("box1").value!=''
			&& document.getElementById("box2").value!=''){
			$('input[type="submit"]').removeAttr('disabled');
		}else {
			$('input[type="submit"]').attr('disabled','disabled');
		}
	});
});
