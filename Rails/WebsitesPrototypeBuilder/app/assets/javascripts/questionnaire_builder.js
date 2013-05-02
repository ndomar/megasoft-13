var toggle =true;
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

function channgeView(question){
	var value=$(question).nextAll('input').val();
	if(toggle&&value!=null){
		view_Answerarea(question);
		$(question).removeClass("shadow");
		$(question).siblings('.add_choice').css({"visibility":"hidden"});
		$(question).nextAll('input').attr("disabled", true);
		$(question).closest('.qquestion').find($("input")).each(function() {
			if($(this)!=null&& $(this).attr('id').indexOf('choices') !== -1){
				$(this).attr("disabled", true);
				$(this).siblings('.choice_to_delete').css({"visibility":"hidden"});
			}
	  });
		toggle=false;
	}else{		
		$(question).addClass("shadow");
		$(question).siblings('.add_choice').css({"visibility":"visible"});
		hide_Answerarea(question);
		$(question).nextAll('input').attr("disabled", false);
	$(question).closest('.qquestion').find($("input")).each(function() {
		if($(this)!=null){
			$(this).attr("disabled", false);
			$(this).siblings('.choice_to_delete').css({"visibility":"visible"});
		}
		});
		toggle=true;
	}
}

function deselectAll(){
	$('#qbuilder').find($(".qquestion")).each(function() {
		$(this).removeClass("selected");
	});
}

function channgeViews(question){
	var value=$(question).nextAll('input').val();
	if(toggle&&value!=null){
		view_Answerarea(question);
		$(question).nextAll('input').css({"display":"none"});
		$(question).siblings('.question_view').css({"display":"inline-block"});
		$(question).siblings('.question_view').text(value+" - ");
		var temp='';
		$(question).siblings('.choices_view').empty();
		$(question).closest('.qquestion').find($("input")).each(function() {
	  	temp=$(this).val();
			if($(this)!=null&&temp!='false'&& $(this).attr('id').indexOf('choices') !== -1){
				$(this).css({"display":"none"});
				$(this).siblings('.choice_to_delete').css({"display":"none"});
				$(this).siblings('.box').css({"display":"none"});
				$(this).siblings('.circle').css({"display":"none"});
				$(question).siblings('.choices_view').append('<p>'+temp+"-"+'</p>');
			}
	    temp='';
	  });
		toggle=false;
	}else{
		hide_Answerarea(question);
		$(question).siblings('.question_view').text("");
		$(question).siblings('.question_view').css({"display":"none"});
		$(question).nextAll('input').css({"display":"inline-block"});
	$(question).closest('.qquestion').find($("input")).each(function() {
		if($(this)!=null&&temp!='false'){
			$(this).css({"display":"inline-block"});
			$(this).siblings('.choice_to_delete').css({"display":"inline-block"});
			delayed_refresh(question);}
		});
		toggle=true;
	}
}

function view_Answerarea(question){
	var selection =$(question).nextAll('select').val();
	$(question).nextAll('select').css({"display":"none"});
	$(question).siblings('.answer_view').empty();
	if(selection==1){
		$(question).siblings('.answer_view').append('<div class="input_text"></div>');
	}else if(selection==2){
		$(question).siblings('.answer_view').append('<div class="paragraph_text"></div>');
	}
}

function hide_Answerarea(question){
	$(question).nextAll('select').css({"display":"inline-block"});
	$(question).siblings('.answer_view').empty();
	var selection =$(question).nextAll('select').val();
	var select=$(question).nextAll('select');
	texts(select,selection);
}


function texts(select,value){
	$(select).siblings('.choices_view').empty();
	if(value==1){
		$(select).siblings('.choices_view').append('<div class="input_text"></div>');
	}else if(value==2){
		$(select).siblings('.choices_view').append('<div class="paragraph_text"></div>');
	}
}

function check(select,value){
	texts(select,value);
	if(value==3||value==4){		
		$(select).siblings('.fields').remove();
		for(var i=2;i<value;i++){
   		$(select).siblings('.add_choice').click();
   	}
		$(select).siblings('.add_choice').css({"display":"block"});
    $(select).closest('.fields').find('.choice_to_delete').css({"display":"none"});
		if(value==3){
    	$(select).closest('.fields').find('.circle').css({"display":"inline-block"});
    	$(select).closest('.fields').find('.box').css({"display":"none"});
		}else{
    	$(select).closest('.fields').find('.circle').css({"display":"none"});
    	$(select).closest('.fields').find('.box').css({"display":"inline-block"});
		}
	}else{
		$(select).siblings('.add_choice').css({"display":"none"});
		$(select).siblings('.fields').remove();
	}
}

function delayed_refresh(link){
	var value =$(link).siblings('select').val();
	var select=$(link).siblings('select');
	if(value==3){
		$(select).closest('.fields').find('.circle').css({"display":"inline-block"});
		$(select).closest('.fields').find('.box').css({"display":"none"});
	}else if(value==4){
		$(select).closest('.fields').find('.circle').css({"display":"none"});
		$(select).closest('.fields').find('.box').css({"display":"inline-block"});
	}
}

function refresh(link){
	setTimeout(function(){delayed_refresh(link);}, 0.01);
}

$(document).on('nested:fieldAdded:qquestions', function(event){
	questions_num++;
	$(".question_to_delete").css({"display":"inline-block"});
});

$(document).on('nested:fieldRemoved:qquestions', function(event){
	questions_num--;
	if(questions_num<=1)
		$(".question_to_delete").css({"display":"none"});
});
