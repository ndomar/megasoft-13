<<<<<<< HEAD
var questions_num=1;
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

function check(select,value){
	if(value==3||value==4){		
		$(select).siblings('.fields').remove();
		for(var i=2;i<value;i++){
   		$(select).siblings('.add_choice').click();
   	}
		$(select).siblings('.add_choice').css({"display":"block"});
    $(select).closest('.fields').find('.choice_to_delete').css({"display":"none"});
	}else{
		$(select).siblings('.add_choice').css({"display":"none"});
		$(select).siblings('.fields').remove();
	}
}

$(document).on('nested:fieldAdded:qquestions', function(event){
	questions_num++;
	$(".question_to_delete").css({"display":"block"});
});

$(document).on('nested:fieldRemoved:qquestions', function(event){
	questions_num--;
	if(questions_num<=1)
		$(".question_to_delete").css({"display":"none"});
=======
var questions_num=1;
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

function check(select,value){
	if(value==3||value==4){		
		$(select).siblings('.fields').remove();
		for(var i=2;i<value;i++){
   		$(select).siblings('.add_choice').click();
   	}
		$(select).siblings('.add_choice').css({"display":"block"});
    $(select).closest('.fields').find('.choice_to_delete').css({"display":"none"});
	}else{
		$(select).siblings('.add_choice').css({"display":"none"});
		$(select).siblings('.fields').remove();
	}
}

$(document).on('nested:fieldAdded:qquestions', function(event){
	questions_num++;
	$(".question_to_delete").css({"display":"block"});
});

$(document).on('nested:fieldRemoved:qquestions', function(event){
	questions_num--;
	if(questions_num<=1)
		$(".question_to_delete").css({"display":"none"});
>>>>>>> master
});