  $(function() {
    $( "#sortable" ).sortable({
      placeholder: "ui-state-highlight"
    });
    $( "#sortable" ).disableSelection();
  });

function create_textQuestion(){
	$("#sortable").append('<li class="ui-state-default"><span onclick="del(this);"class="ui-icon ui-icon-close"></span>New Question</li>');
}

function del(question){
	$(question).parent().slideUp('slow', function() {
        $(this).remove();
    });
}