describe("Homepage", function() {
  it("testing if it slides down onclick", function() {
  	$('.login_image').click();
    expect($('<div class="login_form">')).toBe(true);
  });
  it("testing sliding div to go to who_are_we on click", function() {
  	$('.center').click();
    expect($('<div id="who_are_we">')).toExist();
  });
  it("testing sliding div to go to glimpse on click", function() {
  	$('.left').click();
    expect($('<div id="glimpse">')).toExist();
  });
  it("testing sliding div to go to slide on click", function() {
  	$('.right').click();
    expect($('<div id="slide">')).toExist();
  });
});

