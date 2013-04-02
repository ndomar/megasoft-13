$('#tech').live(
    'mouseenter',
    function(){
        $('<img src="computer.jpg" width = 200 />')
            .appendTo($(this));
    });

$('#tech').live(
    'mouseleave',
    function(){
        $(this).find('img').remove();
    });
