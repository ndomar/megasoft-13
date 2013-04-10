$(document).ready(function(){
	$('.container').sortable({tolerance:'pointer',cursor:'pointer', connectWith:'.container'});
	$('.container').droppable({hoverClass:'border'});
} );