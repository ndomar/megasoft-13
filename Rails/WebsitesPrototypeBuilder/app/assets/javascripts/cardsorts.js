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
		+ "</td>"
		+ "<td>"
		+ "<input type='text' class='cardsort-input' Style='display:none;' placeholder='Description' />"
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
}