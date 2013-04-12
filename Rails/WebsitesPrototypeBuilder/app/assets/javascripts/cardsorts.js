function showPopup() {
  $(".popup-darkscreen").fadeIn(400);
}

function hidePopup() {
  $(".popup-darkscreen").hide();
}

function init(){
  setCardEffects();
  setRemoteFunc();
}

function setCardEffects(){
  $(".card").click(function (){
    changeSelectedCard(this);
  });

  $(document).keypress(moveSelection);
  $("#main-card").keypress(function (event){
    if (event.which == 13 && $('.selected-card').hasClass('new-card'))
      $("#add-button").click();
  });
}

function moveSelection(event){
  var selectedIndex = parseInt($(".selected-card").attr('card-index'));
  var newCard;
  switch(event.keyCode){
    case 37: 
      newCard = $(".selected-card").next();
      break;
    case 38:
      newCard = $(".selected-card");  
      for (var i = 0; i < 14; i++)
        newCard = $(newCard).prev();
      break;
    case 39:
      newCard = $(".selected-card").prev();
      break;
    case 40:
      newCard = $(".selected-card");
      for (var i = 0; i < 14; i++)
        newCard = $(newCard).next();
      break;
    default:
      return;
  }

  //var newCard = $(".card[card-index="+selectedIndex+"]");
  if (newCard.length){
    changeSelectedCard(newCard);
  }
}

function changeSelectedCard(newCard){
  var mainCard = $("#main-card").stop();
  $(".selected-card").removeClass("selected-card");
  $(newCard).addClass("selected-card");

  $(mainCard).hide(300, checkAddButton);
  $("#title").val($(newCard).attr("title"));
  $("#description").val($(newCard).attr("description"));
  $(mainCard).show(300);
}

function checkAddButton(){
  if ($(".selected-card").hasClass('new-card')){
    $("#add-button").show();
  } else {
    $("#add-button").hide();
  }
}

function setRemoteFunc(){
  $('#add-button').click(function (){
    var params = $.param({
      title: $('#title').val(),
      desc: $('#description').val()
    });
    $.ajax("/cardsorts/create?" + params);
  });
}