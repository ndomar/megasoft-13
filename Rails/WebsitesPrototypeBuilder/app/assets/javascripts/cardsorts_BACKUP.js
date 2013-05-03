function showPopup(project_id) {
	$('#project_id_field').val(project_id)
	$(".popup-darkscreen").fadeIn(400);
}

function hidePopup() {
	$(".popup-darkscreen").hide();
}

function init(){
	setTabs();
	setEffects();
	setRemoteFunc();
}

function setTabs(){
	$('#cards-tab').click(function (){
		$('#groups-wrapper').fadeOut(300, function (){
			$('#cards-wrapper').fadeIn(300);
		});
		$('.active').removeClass('active');
		$('#cards-tab').addClass('active');
	});

	$('#groups-tab').click(function (){
		$('#cards-wrapper').fadeOut(300, function (){
			$('#groups-wrapper').fadeIn(300);
		});
		$('.active').removeClass('active');
		$('#groups-tab').addClass('active');
	});
}

function setEffects(){
	$(".card").click(function (){
		changeSelected(this, 'card');
	});

	$(".group").click(function (){
		changeSelected(this, 'group');
	});

	$(document).keypress(handleKeyPress);
}

function handleKeyPress(event){
	if (event.which == 13){
		if ($('#cards-wrapper').css('display') != 'none'){
			if ($('.selected-card').hasClass('new-card')){
				$("#add-button-card").click();
			}
		} else if ($('.selected-group').hasClass('new-group')){
			$("#add-button-group").click();
		}
		return;
	}

	moveSelection(event, ($('#cards-wrapper').css('display') != 'none') ? 'card' : 'group');
}

function moveSelection(event, element){
	var newCard;
	switch(event.keyCode){
		case 37: 
			newCard = $(".selected-"+element+'[display!=none]').next();
			break;
		case 38:
			newCard = $(".selected-"+element+'[display!=none]');	
			for (var i = 0; i < 14; i++)
				newCard = $(newCard).prev();
			break;
		case 39:
			newCard = $(".selected-"+element+'[display!=none]').prev();
			break;
		case 40:
			newCard = $(".selected-"+element+'[display!=none]');
			for (var i = 0; i < 14; i++)
				newCard = $(newCard).next();
			break;
		default:
			return;
	}

	//var newCard = $(".card[card-index="+selectedIndex+"]");
	if (newCard.length){
		changeSelected(newCard, element);
	}
}

function changeSelected(newCard, element){
	var mainCard = $("#main-"+element).stop();
	$(".selected-"+element).removeClass("selected-"+element);
	$(newCard).addClass("selected-"+element);

	$(mainCard).hide(300, function (){
		checkAddButton(element)
		$("#title-"+element).val($(newCard).attr("title"));
		$("#description-"+element).val($(newCard).attr("description"));
	});
	$(mainCard).show(300);
}

function checkAddButton(element){
	if ($(".selected-"+element).hasClass('new-'+element)){
		$("#add-button-"+element).show();
		$('#error-'+element).text("Click the plus button to add a new card.");
	
	} else {
		$("#add-button-"+element).hide();
		$('#error-'+element).text("you can edit the details of this card.");
	
	}
}

function setRemoteFunc(){
	$('#add-button-card').click(function (){
		var params = $.param({
			title: $('#title-card').val(),
			desc: $('#description-card').val()
		});
		$.ajax("/cardsorts/create_card?" + params);
	});

	$('#add-button-group').click(function (){
		var params = $.param({
			title: $('#title-group').val(),
			desc: $('#description-group').val()
		});
		$.ajax("/cardsorts/create_group?" + params);
	});
}

function valid(){
	var title_field = $('#cardsort_title');
	if ($(title_field).val() == ''){
		$(title_field).css("color","red");
		$(title_field).css("border-color", "red");
		return false;
	}
		
}
