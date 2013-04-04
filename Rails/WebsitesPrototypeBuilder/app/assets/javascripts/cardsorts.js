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