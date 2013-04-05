function showPopup() {
	$(".popup-darkscreen").fadeIn(400);
}

function hidePopup() {
	$(".popup-darkscreen").hide();
}

function init(){
	setCardEffects();
	setRemoteFunc();
}

function setCardEffects(){
	$(".card").click(function (){
		changeSelectedCard(this);
	});

	$(document).keypress(moveSelection);
}

function moveSelection(event){
	var selectedIndex = parseInt($(".selected-card").attr('card-index'));
	switch(event.keyCode){
		case 37: 
			selectedIndex--;
			break;
		case 38:
			selectedIndex += 14;
			break;
		case 39:
			selectedIndex++;
			break;
		case 40:
			selectedIndex -= 14;
			break;
		default:
			return;
	}

	var newCard = $(".card[card-index="+selectedIndex+"]");
	if (newCard.length){
		changeSelectedCard(newCard);
	}
}

function changeSelectedCard(newCard){
	var mainCard = $("#main-card").stop();
	$(".selected-card").removeClass("selected-card");
	$(newCard).addClass("selected-card");

	$(mainCard).hide(300, checkAddButton);
	$("#title").val($(newCard).attr("title"));
	$("#description").val($(newCard).attr("description"));
	$(mainCard).show(300);
}

function checkAddButton(){
	if ($(".selected-card").hasClass('new-card')){
		$("#add-button").show();
	} else {
		$("#add-button").hide();
	}
}

function setRemoteFunc(){
	$('#add-button').click(function (){
		var params = $.param({
			title: $('#title').val(),
			desc: $('#description').val()
		});
		$.ajax("/cardsorts/create?" + params);
	});
}
