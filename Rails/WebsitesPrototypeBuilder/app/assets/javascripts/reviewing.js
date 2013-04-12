/*  These Functions are used in the reviewing Pages */

//Using jquery-ui to drag and resize the circle
function draw_circle() {
	$('#drag_resize').css({"display":"block" ,'top' : 0+'px', 'left' : 0+'px'});	
	$('#drag_resize').draggable("enable");  
	$('#choose_area').css({"display":"table-cell"});
	$('#delete_circle').css({"display":"table-cell"});
}

// all the following variables are only used in places function and are only initiallized here to be used by ifram inside the function
var array; 					 // stores the array with divs id's in it 
var topoffset;  		     // stores the top offset of the divs position
var g;                       //used in a loop in places function , had to put it out side the function to be used by iframe
var leftoffset;    			 //stores the left offset of the div's position
var a;            		 	 // array that holds the id's of the divs and removes repetitions from var array
var b;            		  	// array that holds the numbers corresponding to every id in array a
var placest;        		// used to difficiate between question and comments when calling function places
var remove;
var finishans;          // to store the array with answers only
var finishcom;          // to store the array with comments only
function places(af,t) {
   placest=t;
   var m=af;
   m = m.replace('[','');    //filtering the array
   m = m.replace(']',''); 
   m = m.replace(/"/g,'');
   m = m.replace(/ /g,'');
   array = m.split(',');     //end of filtering
   array.sort();             //sorting the array
   a = [];                 //array a remove repeated ids from (array)
   b = [];                 //array b holds corresponding number for each entry in array a
   var prev;               // to be used in the following loop
   
	    //this loop will fill a and b
	    for ( var i = 0; i < array.length; i++ ) {
	        if ( array[i] !== prev ) {
	            a.push(array[i]);
	            b.push(1);
	        } else {
	            b[b.length-1]++;
	        }
	        prev = array[i];
	    }
   var doc = document.getElementById('myiframe').contentWindow.document;     // the element is only accessible through iframe
   var myIframe = document.getElementById("myiframe");
   var script30;                                                            //= myIframe.contentWindow.document.createElement("script");
        //this for loop will put the colored boxes with number of comments/questions in every div with atlease 1 comment/question
	    for(g = a.length - 1; g >= 0; g--)
	    {
	    
	        if(placest===1)  //only for questions
		    {
		    	finishans=a;
	            script30 = myIframe.contentWindow.document.createElement("script");
			    script30.text  = 'var x=document.getElementById(parent.a[parent.g]);parent.topoffset=x.offsetTop;parent.leftoffset=x.offsetLeft;if(parent.b[parent.g+1] != undefined) { var div = document.getElementById("wrap");div.innerHTML=div.innerHTML+"<div class=nom; onClick=parent.finishing('+parent.a[parent.g+1]+',1); style=display:block;float:left;width:20px;height:20px;color:white;left:'+(parent.leftoffset+20)+'px;top:'+parent.topoffset+'px;text-align:center;background-color:rgba(0,0,255,0.5);aria-disabled=false;position:absolute;z-index:1000;display: table-cell;>'+parent.b[parent.g+1]+'</div>";}'; 
			    script30.type = "text/javascript";
			    myIframe.contentWindow.document.body.appendChild(script30);
		    };
		    if(placest===0) //only for comments
		    {
		    	finishcom=a;
			    script30 = myIframe.contentWindow.document.createElement("script");
			    script30.text  = 'var x=document.getElementById(parent.a[parent.g]);parent.topoffset=x.offsetTop;parent.leftoffset=x.offsetLeft;if(parent.b[parent.g+1] != undefined) { var div = document.getElementById("wrap");div.innerHTML=div.innerHTML+"<div class=nom; onClick=parent.finishing('+parent.a[parent.g+1]+',0); style=display:block;float:left;width:20px;height:20px;color:white;left:'+parent.leftoffset+'px;top:'+parent.topoffset+'px;text-align:center;background-color:rgba(0,255,0,0.5);aria-disabled=false;position:absolute;z-index:1000;display: table-cell;>'+parent.b[parent.g+1]+'</div>";}'; 
			    script30.type = "text/javascript";
			    myIframe.contentWindow.document.body.appendChild(script30);
			    //$(p[text!=ll]).remove(); 
		    };	       
	  	};
    //the following two if conditions are only used to insert the last box , which couldn't be done inside the loop and hade to be outside it
    if(placest===0)
    {
    finishcom=a;
    script30 = myIframe.contentWindow.document.createElement("script");
    script30.text  = 'var x=document.getElementById(parent.a[0]);parent.topoffset=x.offsetTop;parent.leftoffset=x.offsetLeft;if(parent.topoffset > 0) { var div = document.getElementById("wrap");div.innerHTML=div.innerHTML+"<div class=nom; onClick=parent.finishing('+parent.a[0]+',0); style=display:block;float:left;width:20px;height:20px;color:white;left:'+parent.leftoffset+'px;top:'+parent.topoffset+'px;text-align:center;background-color:rgba(0,255,0,0.5);aria-disabled=false;position:absolute;z-index:1000;display: table-cell;>'+parent.b[0]+'</div>";}'; 
    script30.type = "text/javascript";
    myIframe.contentWindow.document.body.appendChild(script30);
	};
	if(placest===1)
    {
    finishans=a;	
    script30 = myIframe.contentWindow.document.createElement("script");
    script30.text  = 'var x=document.getElementById(parent.a[0]);parent.topoffset=x.offsetTop;parent.leftoffset=x.offsetLeft;if(parent.topoffset > 0) { var div = document.getElementById("wrap");div.innerHTML=div.innerHTML+"<div class=nom; onClick=parent.finishing('+parent.a[0]+',1); style=display:block;float:left;width:20px;height:20px;color:white;left:'+(parent.leftoffset+20)+'px;top:'+parent.topoffset+'px;text-align:center;background-color:rgba(0,0,255,0.5);aria-disabled=false;position:absolute;z-index:1000;display: table-cell;>'+parent.b[0]+'</div>";}'; 
    script30.type = "text/javascript";
    myIframe.contentWindow.document.body.appendChild(script30);
	};
  
}

//called from function places used to filter the related comments onclick of the little green/blue boxes
function finishing(edeeni,u)
{   
	
   

	
	if(u==0)
	{
        
		    for(g = finishcom.length - 1; g >= 0; g--)
			{
				
			      $('div[id='+finishcom[g]+']').show();
			    
			};

			for(g = finishcom.length - 1; g >= 0; g--)
			{
				if(finishcom[g]!=edeeni)
				{
			      $('div[id='+finishcom[g]+']').hide();
			    };
			};

	};

	if(u==1)
	{
         
           for(g = finishans.length - 1; g >= 0; g--)
			{
				
			      $('div[id='+finishans[g]+']').show();
			    
			};

			for(g = finishans.length - 1; g >= 0; g--)
			{
				if(finishans[g]!=edeeni)
				{
			      $('div[id='+finishans[g]+']').hide();
			    };
			};

	};
    
	
	//alert(placest);
}
function draw_circle2(x,y) {
	$('#drag_resize').css({"display":"block" ,'top' : x+'px', 'left' : y+'px'});
	$('#drag_resize').draggable( "enable");
	$('#choose_area').css({"display":"table-cell"});
	$('#delete_circle').css({"display":"table-cell"});
}
var e;
function lastm(x)
{
    e = $(x).next('.koke').text();
  	var doc = document.getElementById('myiframe').contentWindow.document;     // the element is only accessible through iframe
    var myIframe = document.getElementById("myiframe");
    var script25 = myIframe.contentWindow.document.createElement("script");
	script25.type = "text/javascript";
	script25.text  = 'var x = document.getElementById(parent.e);var y=x.offsetTop;var z=x.offsetLeft;parent.draw_circle2(y-100,z-50);';  // coordinates calculated then circle is drawn around the element.
    myIframe.contentWindow.document.body.appendChild(script25);
}
//this function is used to slide the comments bar
var x=1;
function slideit()
{  x=x+1;
  var m = x%2;
  if(m==0)
  {
    $("#sidebar").hide("slide", {direction: "right"}, 1000);
    setTimeout(function(){ $("#wrapper").css({"padding-right":0+"px"}); },1000);
    setTimeout(function(){ $("#content").css({"text-align":"center"}); },1000);
  }
  else
  {
    $("#sidebar").show("slide", {direction: "right"}, 1000);
    setTimeout(function(){ $("#wrapper").css({"padding-right":320+"px"}); });
    setTimeout(function(){ $("#content").css({"text-align":"right"}); });
  }
}

// Make the notepaper visible and set it position
function create_note() {
	var offset = $('#drag_resize').offset();
	var top_pos =offset.top;
	var left_pos =offset.left;
	var notepaper_top =top_pos + $('#drag_resize').height()/2;
	var notepaper_left =left_pos + $('#drag_resize').width()/2;
	$('.note').css({"display":"block", 'top' : notepaper_top+'px', 'left' : notepaper_left+'px'});
	$('#drag_resize').draggable( "disable");  
	$('#choose_area').css({"display":"none"});
	$('#delete_circle').css({"display":"none"});
}

// delete The selecting circle
function delete_circle() {
	$('#drag_resize').css({"display":"none"});
}

// delete The selecting circle and the notepaper
function delete_all() {
	$('#drag_resize').css({"display":"none"});
	$('.note').css({"display":"none"});
}

// It takes the id and the object from the Iframe and set the assignedpart value to it.
function getSelectedItem(elementId,elementObj){
	var id=elementId;
	var theobj=elementObj;
	document.getElementById('assignedpart').value=elementId;
}

// Send circle location to the Iframe
function selectItem () {
	var element = document.getElementById('drag_resize');
	var isVisible = element.offsetWidth > 0 || element.offsetHeight > 0;
	if(isVisible){
		var offset = $('#drag_resize').offset();
		var posY =offset.top + ($('#drag_resize').height()/2) -51 ;
		var posX =offset.left+ ($('#drag_resize').width()/2);
		window.frames[0].OnMouseMove(posX,posY);
	}
}

// Called when started to add the content to the iframe and make the circle draggable and resizable.
$(document).ready(function() {
	//Load the html from the database through the hidden div with id "html_content"
	var designed_html= $('#html_content').text();
	var doc = document.getElementById('myiframe').contentWindow.document;
	doc.open();
	// Write the fetched html to the iframe with id "myiframe"
	doc.write(designed_html);
	doc.close();

	//selecting the iframe and appeding the script for selecting thr item behind the circle and draw the border around the selected item.
	var myIframe = document.getElementById("myiframe");
	var script = myIframe.contentWindow.document.createElement("script");
	script.type = "text/javascript";
	script.text  = 'var selElem = null;var origBorder = "";function OnMouseMove (circleX,circleY) {var posX = circleX, posY = circleY;var overElem = document.elementFromPoint (posX, posY);if (overElem && overElem.tagName === undefined) {overElem = overElem.parentNode;	}if (selElem) {if (selElem == overElem) {return;}selElem.style.border = origBorder;selElem = null;}if (overElem && overElem.tagName.toLowerCase () != "body" && overElem.tagName.toLowerCase () != "html") {selElem = overElem;	origBorder = overElem.style.border;overElem.style.border = "1px dashed gray";}parent.getSelectedItem(selElem.id,selElem);}';
	myIframe.contentWindow.document.body.appendChild(script);
	// Make the selecting circle resizable and draggable
	$("#drag_resize").resizable({
			maxHeight: 350,
			maxWidth: 350,
			minHeight: 60,
			minWidth: 100,
			animate: true,
			iframe: true,
			modal : true
		}).draggable({
			iframe: true,
			modal : true,
			containment: "#content",
			scroll: false
		});
});