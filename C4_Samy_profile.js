function startup() {
    $("form").animate({top:150, left:350, width:1080, height: 600}, 200, startup2);
	$("form").fadeIn(200);
}
function startup2() {
    $(".name1").animate({ left: 620 }, 500, null);
    $(".name2").animate({ left: 400 }, 500, startup3);
   
}

function startup3() {
    $("img").fadeIn(500, function () { $("div").fadeIn(500); });
    
}