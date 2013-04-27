var cardsView;
var groupsView;
var cardsThumbnails;

function init() {
	cardsThumbnails = $('#cards-thumbnail');
	cardsView = $('#cards-view').draggable({
		handle: '#cards-tag',
		axis: 'x',
		drag: function() {
				var difference = parseInt($(groupsView).css('right')) - parseInt($(cardsView).css('right'));
				var left = parseInt($(cardsView).css('left'));
				if (difference < 24)
					$(groupsView).css('left', left - 23);
				width = parseInt($(cardsView).css('width')) + parseInt($(cardsView).css('right'));
				$(cardsThumbnails).css('width', width+35);
			}

	});
	groupsView = $('#groups-view').draggable({
		handle: '#group-tag',
		axis: 'x',
		drag: function() {
				var difference = parseInt($(groupsView).css('right')) - parseInt($(cardsView).css('right'));
				var left = parseInt($(groupsView).css('left'));
				if (difference < 24)
					$(cardsView).css('left', left + 23);
			}
	});
}