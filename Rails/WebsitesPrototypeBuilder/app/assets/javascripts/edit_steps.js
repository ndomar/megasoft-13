$(function(){
  $('#cursorSwitch').click(function(event){
    $("#notice").show();
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
  $("#embedded").click(function(event){
    var cursor = $('#cursorSwitch');
    if(cursor.hasClass("cursorPressed")){
      var allow = { "A":1, "IMG":1, "INPUT":1, "BUTTON":1 }; 
      if(allow[event.target.tagName]){
        var id = event.target.id;
        select(id);
      }
      else{
        dehighlight($("#component_id").val());
      }
    }
  });
});

$(function(){
  $("#stepList").find('tr').not(':first').hover(function(event){
    var cursor = $('#cursorSwitch');
    if(!cursor.hasClass("cursorPressed")){
      var id = event.target.id;
      var element = $("#"+event.target.id);
      if(element!=null){
        highlight(element.id);
      }
    }
  });
});

/*$(function(){
  $("#embedded").find('input').click(function(event){
    var cursor = $('#cursorSwitch');
    if(cursor.hasClass("cursorPressed")){
      var id = event.target.id;
      select(id);
    }
  });
});
*/

function stepHighlight(id){
  var cursor = $('#cursorSwitch');
  if(!cursor.hasClass("cursorPressed")){
    var element = $("#"+id);
    if(element!=null){
      highlight(id);
    }
  }
}

function stepDeHighlight(id){
  var cursor = $('#cursorSwitch');
  if(!cursor.hasClass("cursorPressed")){
    var element = $("#"+id);
    if(element!=null){
      dehighlight(id);
    }
  }
}

function select(id){
  dehighlight($("#component_id").val());
  $("#add_step").show();
  $("#notice").hide();
  highlight(id);
  $("#component_id").val(id);
}

function save(task_id, page_id){
  var params = $.param({
    id: task_id,
    page_id:  page_id,
    component: $("#component_id").val(),
    "event" : $("input:radio[name=events_list]:checked").val(),
    description: $("#step_description").val()
  });
  $.ajax("/tasks/new_step/?" + params);
  $("#add_step").hide();
  dehighlight($("#component_id").val());
}

function highlight(id){
  //var element= document.getElementById(id);
  var selected = $('#'+id);
  if(selected != null && !selected.hasClass("highlighting")){
    selected.toggleClass("highlighting");
  }

}
 
function dehighlight(id){
  var selected = $('#'+id);
  if(selected != null && selected.hasClass("highlighting")){
    selected.toggleClass("highlighting");
  }
  //element.style.boxShadow= 'none';
  //element.style.border=1;
 } 


function cli(selected){
  var point=$(selected).text();
  callChild(point);
  return false;
}

function updateHtml() {
  updateH();
  disableLinks();
  enableImages();
}

function callChild(name){
var iframe_doc = document.getElementById("preview_mode").contentDocument;
var all_anchors = iframe_doc.getElementsByTagName("a");

for(var i=0;i<all_anchors.length;i++){
  anchors_string=all_anchors[i]+"";
  anchors_array= anchors_string.split("/");
  var value= anchors_array[anchors_array.length-1];
  var name_low= name.toLowerCase();
  if(value.indexOf(name_low)==0){
    all_anchors[i].click();
    updateHtml();
   return;}
  }
}

$(document).ready(function(){
  $("#embedded").find('a').click(function(event){
    //alert("sfsfcffffrgdfg");
    // window.setTimeout("updateHtml()",1);
  });   
 });




function updateH() {
  //var frameHtml = window.frames['preview_mode'].document.documentElement.innerHTML;
  var frameHtml = document.getElementById("preview_mode").contentDocument.documentElement.innerHTML;
  document.getElementById('embedded').innerHTML=frameHtml;
}

function disableLinks(){
  $("#embedded a").each(function(){
    $(this).attr('href','#');
    $(this).attr('onclick','return cli(this);');  
  });
}

function enableImages(){
  //alert(projectid);
  $("#embedded img").each(function(){
    $(this).attr('src',"/"+projectid+"/images/myimage.jpg"); 
  });
}


