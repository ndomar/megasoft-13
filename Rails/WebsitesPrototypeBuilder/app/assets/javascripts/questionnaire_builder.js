
// Used to make the questions sortable using Jquesry UI
$(function() {
  //use placholder to highlight the dropping postion
  $('#sortable').sortable({ placeholder: "ui-state-highlight"});
  $( "#sortable" ).disableSelection();
});


// Called to delete the question with sliding effect
function del(question){
	$(question).parent().slideUp('slow', function() { $(this).remove(); });
}