$(function(){
 $("#embedded").find('input').click(function(event){
      $("#add_step").show();
      var id = event.target.id;
      $("#component_id").val(id);
});});

$(function(){
 $("#embedded").find('button').click(function(event){
      $("#add_step").show();
      var id = event.target.id;
      $("#component_id").val(id);
});});

function save(task_id){
  var params = $.param({
      id: task_id,
      component: $("#component_id").val(),
      "event" : $("input:radio[name=events_list]:checked").val(),
      description: $("#step_description").val()
  });
  $.ajax("/tasks/new_step/?" + params);
  $("#add_step").hide();
}


