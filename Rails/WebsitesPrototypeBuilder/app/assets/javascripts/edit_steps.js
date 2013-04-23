$(function(){
  $('#cursorSwitch').click(function(event){
    var cursor = $('#cursorSwitch');
    if(cursor.hasClass("cursorPressed")){
      $("#add_step").hide();
      dehighlight($("#component_id").val());
    }
    $('#cursorSwitch').toggleClass('cursorPressed');
    $('#embedded').toggleClass('embeddedDiv');
  });
});

$(function(){
  $('#embedded').find('a').each(function () {
    $(this).bind('click',false);
  });
});

$(function(){
  $("#embedded").find('input').click(function(event){
    var cursor = $('#cursorSwitch');
    if(cursor.hasClass("cursorPressed")){
      var id = event.target.id;
      select(id);
    }
  });
});

$(function(){
  $("#embedded").find('button').click(function(event){
    var cursor = $('#cursorSwitch');
    if(cursor.hasClass("cursorPressed")){
      var id = event.target.id;
      select(id);
    }
  });
});

$(function(){
  $("#embedded").find('img').click(function(event){
    var cursor = $('#cursorSwitch');
    if(cursor.hasClass("cursorPressed")){
      var id = event.target.id;
      select(id);
    }
  });
});

$(function(){
  $("#embedded").find('a').click(function(event){
    var cursor = $('#cursorSwitch');
    if(cursor.hasClass("cursorPressed")){
      var id = event.target.id;
      select(id);
    }
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
  dehighlight($("#component_id").val());
}

function highlight(id){
  var element= document.getElementById(id);
  element.style.border='none';
  element.style.boxShadow="0px 0px 6px 2px orange";
}
 
function dehighlight(id){
  var element = document.getElementById(id);
  element.style.boxShadow= 'none';
  element.style.border=1;
 } 


