function highlight(id)
{
// A function that highlights a certain component given it's id
var element= document.getElementById(id);
element.style.border='none';
element.style.boxShadow="0px 0px 6px 2px orange";
}
 
 //A function that de-highlight's a certain component given its id
 function dehighlight(id){
  var element = document.getElementById(id);
  element.style.boxShadow= 'none';
  element.style.borderStyle='solid';
  element.style.borderWidth='1px';
  element.style.borderColor='#CCCCCC';
 } 


