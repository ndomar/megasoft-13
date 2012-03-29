var notMatch = 'كلمة السر غير متطابقة'
var Match = 'كلمة السر متطابقة'

function passwordMatching(password1, password2){
	if (password1 == password2) {
		return Match
	}else{
		return notMatch
	}
}