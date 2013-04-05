function startup() {
    $("img").fadeIn(1000, startup2);
}
function startup2() {
    
    $(".name1").animate({ left: 1000 }, 500, null);
    $(".name2").animate({ left: 1200 }, 500, function () { $(".divText").slideDown(1000); });
}

