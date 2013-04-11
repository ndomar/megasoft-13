$(document).ready(function(){
	$('.container').sortable({containment:'document',tolerance:'pointer',cursor:'pointer', connectWith:'.container'});
	$('.container').droppable({hoverClass:'border'});
} );