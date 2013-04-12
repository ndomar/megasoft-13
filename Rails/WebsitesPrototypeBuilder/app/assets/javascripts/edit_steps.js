$(function(){
  $('#embedded').find('a').each(function () {
    //$(this).replaceWith($(this).text());
    $(this).bind('click',false);
  });
});

$(function(){
  $("#embedded").find('textarea').click(function(event){
    var id = event.target.id;
    select(id);
  });
});

$(function(){
  $("#embedded").find('button').click(function(event){
    var id = event.target.id;
    select(id);
  });
});

$(function(){
  $("#embedded").find('img').click(function(event){
    var id = event.target.id;
    select(id);
  });
});

$(function(){
  $("#embedded").find('a').click(function(event){
    var id = event.target.id;
    select(id);
  });
});

function select(id){
  dehighlight($("#component_id").val());
  $("#add_step").show();
  highlight(id);
  $("#component_id").val(id);
}

function save(task_id){
  var params = $.param({
    id: task_id,
    component: $("#component_id").val(),
    "event" : $("input:radio[name=events_list]:checked").val(),
    description: $("#step_description").val()
  });
  $.ajax("/tasks/new_step/?" + params);
  $("#add_step").hide();
  //$("#component_id").val("");
  dehighlight($("#component_id").val());
}

function highlight(id){
  // A function that highlights a certain component given it's id
  var element= document.getElementById(id);
  element.style.border='none';
  element.style.boxShadow="0px 0px 6px 2px orange";
}
 
function dehighlight(id){
  var element = document.getElementById(id);
  element.style.boxShadow= 'none';
  element.style.border=1;
 } 


