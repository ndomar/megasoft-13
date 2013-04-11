//When a card is dragged from one container to the other, it's "id" is removed from it's previous container and added to the new one
$(document).ready(function(){
	$('.container').sortable({containment:'document',tolerance:'pointer',cursor:'pointer', connectWith:'.container'});
	$('.container').droppable({hoverClass:'border'});
} );