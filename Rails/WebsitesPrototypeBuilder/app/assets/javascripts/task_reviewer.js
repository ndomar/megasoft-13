function highlight(id)
{
// A function that highlights a certain component given it's id
var element= document.getElementById(id);
element.style.border='none';
element.style.boxShadow="0px 0px 6px 5px orange";
}
 
 //A function that de-highlight's a certain component given its id
 function dehighlight(id){
  var element = document.getElementById(id);
  element.style.boxShadow= 'none';
  element.style.borderStyle='solid';
  element.style.borderWidth='1px';
  element.style.borderColor='#CCCCCC';
 } 

function display_form(){
  $("#coloured").show(500);
  $("#info_form").show(500);
  document.getElementById("page").style.color='transparent';
  document.getElementById("page").style.textShadow='0 0 8px #FFF';
  $("input").blur();
}

function hide_form(){
  $("#coloured").fadeOut('slow');
  $("#info_form").fadeOut('slow');
  document.getElementById("page").style.color='white';
  document.getElementById("page").style.textShadow='none';
}
 function update(cmp,event){
    var curr_element_id= cmp.id;
  //alert(steps_ids_array[0]);
  if (event == steps_events_array[0] && curr_element_id==steps_components_array[0]) {
    clicks_counter=clicks_counter+1;
    var current_hours = new Date().getHours();
    var current_minutes= new Date().getMinutes();
    var current_seconds = new Date().getSeconds();

    var hours_taken = current_hours - starting_hours;
    var minutes_taken = current_minutes - starting_minutes;
    if (minutes_taken <0) {
      minutes_taken=minutes_taken+60;
    }

    var seconds_taken= current_seconds - starting_seconds;
    if (seconds_taken < 0) {
      seconds_taken= seconds_taken+60; 
    }

    total_time= hours_taken + ":" + minutes_taken + ":" + seconds_taken; 
    if( minutes_taken >= task_time){
      alert("Time's up!" + minutes_taken);
    }
    //alert(total_time);

    steps_events_array.splice(0,1);
    var deleted_component= steps_components_array.splice(0,1);
    var deleted_step_id=steps_ids_array.splice(0,1);
    steps_description_array.splice(0,1);

    if (steps_ids_array.length ==0){
      //alert(parseInt(deleted_step_id)+1);
      $("#change_id").val(parseInt(deleted_step_id)+1); //to increment the value of the curr step
    } 
    else {
      $("#change_id").val(steps_ids_array[0]); //to increment the value of the curr step
      $("#start_time").val(curr_time); //set the time_from_start
      $("#change_clicks").val(clicks_counter); //update clicks_count in DB
      $("#change_success").val(step_answer_success); //set successful = true for step_answer
      $("#total_time_taken").val(total_time); //sets the value of  the time taken
      //alert($("#total_time_taken").val());
    }
    
    dehighlight(deleted_component);
    if(steps_components_array.length!=0) {
      document.getElementById("description_paragraph").innerHTML=steps_description_array[0];
      highlight(steps_components_array[0]); 
    }
    
    $(function() { $("#steps_form").submit(); }); //to update the step_id in the DB, store no. of clicks, success, time_from_Start and time_taken
  }
 }


