$('<iframe id="preview_mode"/>').load(function(){


 
 //A function that de-highlight's a certain component given its id
 function dehighlight(id){
  var element = document.getElementById(id);
  element.style.boxShadow= 'none';
  element.style.borderStyle='solid';
  element.style.borderWidth='1px';
  element.style.borderColor='#CCCCCC';
 } 
 
 //keeps track user clicked where and when
//var current_click_time= new Date();
$("input").on('click',function(event){
  //alert(event.target.id);
  update_log(event.target,'click');
  update_steps(event.target,'click');
 if (event.target.id == 'submit_form_button'){
  hide_form();
 }
}); 
  // Write your iframe javascript here
  $('#preview_mode').contents().find('body').append('function selectItem () {var element = document.getElementById("drag_resize");var isVisible = element.offsetWidth > 0 || element.offsetHeight > 0;if(isVisible){var offset = $("#drag_resize").offset();var posY =offset.top + ($("#drag_resize").height()/2) -51 ;var posX =offset.left+ ($("#drag_resize").width()/2);window.frames[0].OnMouseMove(posX,posY);}}');
  
}).appendTo("body");

function highlight(id){
  var element=document.getElementById(id);element.style.border="none";element.style.boxShadow="0px 0px 6px 5px orange";}

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
  $("#info_form").fadeIn(500);
  document.getElementById("page").style.color='transparent';
  document.getElementById("page").style.textShadow='0 0 8px #FFF';
  document.getElementById('submit_form_button').value= 'إحفظ المعلومات' 
}

function hide_form(){
  $("#coloured").fadeOut('slow');
  $("#info_form").fadeOut('slow');
  document.getElementById("page").style.color='white';
  document.getElementById("page").style.textShadow='none';
}

function update_total_time(){
  var current_hours = new Date().getHours();
  var current_minutes= new Date().getMinutes();
  var current_seconds = new Date().getSeconds();

  var hours_taken = current_hours - starting_hours;
  var minutes_taken = current_minutes - starting_minutes;
  var seconds_taken= current_seconds - starting_seconds;
  if (minutes_taken <0) {
    minutes_taken=minutes_taken+60;
  }
  if (seconds_taken < 0) {
    seconds_taken= seconds_taken+60; 
  }
  total_time= hours_taken + ":" + minutes_taken + ":" + seconds_taken; 
}


 function update_steps(element,event){
  var curr_element_id= element.id;
  if(event=='click'){
    clicks_counter=clicks_counter+1;    
  }

  update_total_time();

  if (event == steps_events_array[0] && curr_element_id==steps_components_array[0]) {
    //STEPS MODE
    steps_events_array.splice(0,1);
    var deleted_component= steps_components_array.splice(0,1);
    var deleted_step_id=steps_ids_array.splice(0,1);
    steps_description_array.splice(0,1);

    //alert($(page_html).filter('input').get());
    //alert($(page_html.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&#x27;/g,'"')));
    //$('#page').text(page_html);
    //document.getElementById('page').innerHTML=page_html.replace('"', '');
    //$('#page').parseHTML(page_htmls_array[index]);
    // if(page_htmls_array.length >0) {
    //   //handles redirecting to different pages
    //   var removed_id = step_page_id_array.splice(0,1); //the id of the current step page
    //   var index= page_ids_array.indexOf(step_page_id_array[0]); //the index of the next page
    //   //alert(step_page_id_array[0] + " "+index+" "+removed_id +"b4 condition");
    //   if(index >=0 && index<page_htmls_array.length && removed_id!=step_page_id_array[0]){
    //     //alert(step_page_id_array[0] + " "+index+" "+removed_id);
    //     var page_html= page_htmls_array[index];
    //     //alert(page_htmls_array.length);
    //     $('#page').html($(page_html.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&#x27;/g,'"')));

    //   }
    //}
   
    //document.getElementById('page').innerHTML=page_html.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&#x27;/g,'"');

    if (steps_ids_array.length ==0){
   //this check handles the case of the last step -> success
      $("#change_id").val(parseInt(deleted_step_id)+1); //to increment the value of the curr step 

      $("#change_time_taken").val(total_time); //sets the value of  the time taken
      $("#change_clicks_count").val(clicks_counter); //update clicks_count in DB
      $(function() { $("#task_result_form").submit(); }); //to update the step_id in the DB, store no. of clicks, success, time_from_Start and time_taken 
    } 
    else {
      $("#change_id").val(steps_ids_array[0]); //to increment the value of the curr step
    }
      $("#start_time").val(curr_time); //set the time_from_start
      $("#change_success").val(step_answer_success); //set successful = true for step_answer
      $("#total_time_taken").val(total_time); //sets the value of  the time taken
      $("#change_clicks").val(clicks_counter); //update clicks_count in DB

        //check if the page was change there wont be an element to highlight
         dehighlight(deleted_component); 

    if(steps_ids_array.length==1){
      $(".desc").fadeOut(500); //description of last step is no longer shown.
    }
    if(steps_components_array.length!=0) {
      //this check handles the last step
            //alert(steps_components_array[0]);
      if(steps_description_array.length>1){
        document.getElementById("description_paragraph").innerHTML=steps_description_array[0];
      }
        highlight(steps_components_array[0]); 
    }

    $(function() { $("#steps_form").submit(); }); //to update the step_id in the DB, store no. of clicks, success, time_from_Start and time_taken
  } else {
    //NO STEPS MODE
  }

}

function times_up(){
  alert("Time's up!!!");
  $('#time_out').show();
  $('#page').fadeOut(500);
  $('.desc').fadeOut(500);
  $('#goal').fadeOut(500);
}

 function update_log(element,event_triggered){
  if(element.type !='text' && element.type !='password' || event_triggered=='change'){

    var current_element_id= element.id;
    var current_element_value = document.getElementById(current_element_id).value;
    var current_click_time = new Date().getHours()+ ":" + new Date().getMinutes()+ ":" + new Date().getSeconds() ; //time at which the action is triggered
    $("#change_action").val(event_triggered);
    $("#change_component_involved").val(current_element_value);
    $("#change_action_time").val(current_click_time);
    $("#change_element_id").val(current_element_id);
    $(function() { $("#log_form").submit(); });
 document.getElementById("description_paragraph").innerHTML="The user "+ event_triggered + document.getElementById(event.target.id).value + " at time " + current_click_time;
  }  
 }
 