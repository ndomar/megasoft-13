$(function() {
  $( "#sortable" ).sortable({ placeholder: "ui-state-highlight" });
  $( "#sortable" ).disableSelection();
});

function create_textQuestion(){
  $("#sortable").append('<li class="ui-state-default"><span onclick="del(this);"class="ui-icon ui-icon-close"></span>New Question</li>');
}

function del(question){
	$(question).parent().slideUp('slow', function() { $(this).remove(); });
}

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}