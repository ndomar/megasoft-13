
var x =1;
function changeBg() {
var y;
  if(x==1)
  {
  	y = "url(bg1.jpg)";
  	x=2;
  }else if (x==2)
  {
  	y="url(bg.jpg)";
  	x=1;
  }
        document.body.style.backgroundImage = y;
		alert("Changed Background !!");
}
