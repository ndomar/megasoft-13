
function loadfn(){
	$('#digital-clock').clock({offset: '0', type: 'digital'});
	$("#seemore")[0].click = null;
	$('#programming_technologies2').hide();
	$('#seemore').click(function() {
		$('#programming_technologies2').show();
		var child = document.getElementById("seemore");
		child.parentNode.removeChild(child);
		return false;
	});
}