$(document).ready(function() {
	// $('#username').keyup(function(){$('#result').html(passwordStrength($('#password').val(),$('#username').val()))})
	// $('#password').keyup(function(){
	// 	$('#result').html(passwordStrength($('#password').val(),$('#email').val().split("@")[0]));
	// 	switch ($('#result').html()){
	// 		case "كلمة سر قصيرة":
	// 			$('#result').css("color","red");
	// 			$('#password').css("border-color", "red");
	// 			break;
	// 		case "ضعيف":
	// 			$('#result').css("color","red");
	// 			$('#password').css("border-color", "red");
	// 			break;
	// 		case "جيد":
	// 			$('#result').css("color","lime");
	// 			$('#password').css("border-color", "lime");
	// 			break;
	// 		case "قوي":
	// 			$('#result').css("color","green");
	// 			$('#password').css("border-color", "green");
	// 			break;
	// 	}
	// });
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
	$('#password').keyup(function(){
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
});