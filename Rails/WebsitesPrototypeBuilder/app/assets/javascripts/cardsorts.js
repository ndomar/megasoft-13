function showPopup() {
	$(".popup-darkscreen").fadeIn(400);
}

function hidePopup() {
	$(".popup-darkscreen").hide();
}

function fillTable(tableID) {
	code = "<tr>"
		+ "<td>"
		+ "<input type='text' class='cardsort-input' Style='display:none;' placeholder='Label' />"
		+ "<label/>"
		+ "</td>"
		+ "<td>"
		+ "<input type='text' class='cardsort-input' Style='display:none;' placeholder='Description' />"
		+ "<label/>"
		+ "</td>"
		+ "</tr>";
	nRows = 15;
	while(nRows > 0) {
		$("#"+tableID).append(code);
		nRows--;
	}
}

function setTableEffect(){
	$("td").click(function () {
		$("input").hide();
		$("label").show();
		var label = $(this).children("label").hide();
		var input = $(this).children("input").show();
		$(input).focus();
		$(input).val($(label).text());
	});

	$("td").each(function () {
		var input = $(this).children("input");
		$(input).focusout(function () {
			$(this).siblings("label")
				.text($(this).val());
		});
	});

	$("input").keypress(function (event) {
		if (event.which == 13){
			$(this).hide();
			var label = $(this).siblings("label").show();
			$(label).text($(this).val());
			$(this).parent().next().next().click();		
		}
	});
}

function setCardEffects(){
	$(".card").click(function (){
		$(".card").removeClass('selected-card');
		$(this).addClass('selected-card');
	});

	$(document).keypress(changeSelected);
}

function changeSelected(event){
	var mainCard = $("#main-card").stop();

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

	var nextSelected = $(".card[card-index="+selectedIndex+"]");
	if (nextSelected.length){
		$(".selected-card").removeClass("selected-card");
		$(nextSelected).addClass("selected-card");

		$(mainCard).fadeOut(300);
		$("#title").val($(nextSelected).attr("title"));
		$("#description").val($(nextSelected).attr("description"));
		$(mainCard).fadeIn(300);
	}
}
