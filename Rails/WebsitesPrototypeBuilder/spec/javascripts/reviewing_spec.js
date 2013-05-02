describe("reviewing", function() {
  it("testing if it slides down onclick", function() {
    $('.lilbuttonc').click();
    expect('.nom').not.toBeVisible();
  });
  it("testing sliding div to go to who_are_we on click", function() {
    $('.sw').click();
    expect($('<div id="questions">')).toExist();
  });
  it("testing sliding div to go to glimpse on click", function() {
    $('.coms').click();
    expect($('.ui-resizable')).toExist();
  });
  it("testing sliding div to go to slide on click", function() {
    $('.hideans').click();
    expect($('.answers2')).toExist();
  });
});