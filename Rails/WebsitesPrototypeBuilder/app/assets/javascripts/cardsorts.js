var cardsView;
var groupsView;
var cardsThumbnails;

function init() {
	setParams();
	$('#cards-view').draggable({
		handle: '#cards-tag',
		axis: 'x',
		drag: function() {
				var difference = cardsView.offsetLeft - groupsView.offsetLeft;
				var left = parseInt($(cardsView).css('left'));
				if (difference < 24)
					$(groupsView).css('left', left - 24);
				width = wrapper.offsetWidth - cardsView.offsetLeft;
				$(cardsThumbnails).css('width', width);
			}

	});
	$('#groups-view').draggable({
		handle: '#group-tag',
		axis: 'x',
		drag: function() {
				var difference =cardsView.offsetLeft - groupsView.offsetLeft;
				var left = parseInt($(groupsView).css('left'));
				if (difference < 24)
					$(cardsView).css('left', left + 23);
			}
	});

}

function setParams() {
	cardsView = $('#cards-view')[0];
	groupsView = $('#groups-view')[0];
	cardsThumbnails = $('#cards-thumbnail')[0];
	wrapper = $('#wrapper')[0];
}