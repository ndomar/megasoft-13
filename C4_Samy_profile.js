function startup() {
    $("form").animate({top:150, left:350, width:1080, height: 600}, 500, startup2);
	$("form").fadeIn(500);
}
function startup2() {
    
    $("img").fadeIn(600, startup3);
}

function startup3() {
    $(".name1").animate({ left: 620 }, 500, null);
    $(".name2").animate({ left: 400 }, 500, function () { $("ul").fadeIn(500); });
}