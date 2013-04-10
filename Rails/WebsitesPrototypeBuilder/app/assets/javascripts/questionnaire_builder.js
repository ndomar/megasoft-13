$(function() {
    $('#sortable').sortable({ placeholder: "ui-state-highlight" ,
        update: function(event, ui) {
            var start_pos = ui.item.data('start_pos');
            var end_pos = $(ui.item).index();
            //alert(end_pos); 
          }
    });
    $( "#sortable" ).disableSelection();
});


function del(question){
	$(question).parent().slideUp('slow', function() { $(this).remove(); });
}

$(document).on('nested:fieldRemoved', function(event){
  // this field was just inserted into your form
  var field = event.field; 
  // it's a jQuery object already! Now you can find date input
 field.parent().slideUp('slow', function() { field.remove(); });
})