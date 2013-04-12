function showPopup() {
  $(".popup-darkscreen").fadeIn(400);
}

function hidePopup() {
  $(".popup-darkscreen").hide();
}

function init(){
  setTabs();
  setEffects();
  setRemoteFunc();
  $('.card').addClass('selected-card');
  $('.group').addClass('selected-group');
}

function setTabs(){
  $('#cards-tab').click(function (){
    $('#groups-wrapper').fadeOut(300, function (){
      $('#cards-wrapper').fadeIn(300);
    });
    $('.active').removeClass('active');
    $('#cards-tab').addClass('active');
  });

  $('#groups-tab').click(function (){
    $('#cards-wrapper').fadeOut(300, function (){
      $('#groups-wrapper').fadeIn(300);
    });
    $('.active').removeClass('active');
    $('#groups-tab').addClass('active');
  });
}

function setEffects(){
  $(".card").click(function (){
    changeSelected(this, 'card');
  });

  $(".group").click(function (){
    changeSelected(this, 'group');
  });

  $(document).keypress(handleKeyPress);
}

function handleKeyPress(event){
  if (event.which == 13){
    if ($('#cards-wrapper').css('display') != 'none'){
      if ($('.selected-card').hasClass('new-card')){
        $("#add-button-card").click();
      }
    } else if ($('.selected-group').hasClass('new-group')){
      $("#add-button-group").click();
    }
    return;
  }

  moveSelection(event, ($('#cards-wrapper').css('display') != 'none') ? 'card' : 'group');
}

function moveSelection(event, element){
  var newCard;
  switch(event.keyCode){
    case 37: 
      newCard = $(".selected-"+element+'[display!=none]').next();
      break;
    case 38:
      newCard = $(".selected-"+element+'[display!=none]');  
      for (var i = 0; i < 14; i++)
        newCard = $(newCard).prev();
      break;
    case 39:
      newCard = $(".selected-"+element+'[display!=none]').prev();
      break;
    case 40:
      newCard = $(".selected-"+element+'[display!=none]');
      for (var i = 0; i < 14; i++)
        newCard = $(newCard).next();
      break;
    default:
      return;
  }

  //var newCard = $(".card[card-index="+selectedIndex+"]");
  if (newCard.length){
    changeSelected(newCard, element);
  }
}

function changeSelected(newCard, element){
  var mainCard = $("#main-"+element).stop();
  $(".selected-"+element).removeClass("selected-"+element);
  $(newCard).addClass("selected-"+element);

  $(mainCard).hide(300, function (){
    checkAddButton(element)
    $("#title-"+element).text($(newCard).attr("title"));
    $("#description-"+element).text($(newCard).attr("description"));
  });
  $(mainCard).show(300);
}

function checkAddButton(element){
  if ($(".selected-"+element).hasClass('new-'+element)){
    $("#add-button-"+element).show();
    $('#error-'+element).text("Click the plus button to add a new card.");
    if (element == "group") {
      $("#add-title-group").show();
      $("#add-description-group").show();
    }

  
  } else {
    $("#add-button-"+element).hide();
    $('#error-'+element).text("you can edit the details of this card.");
    if (element == "group") {
      $("#add-title-group").hide();
      $("#add-description-group").hide();
    }
  
  }
}

function setRemoteFunc(){

  $('#add-button-group').click(function (){
    var params = $.param({
      title: $('#add-title-group').text(),
      desc: $('#add-description-group').text()
    });
    $.ajax("/cardortsreviewer/create_group?" + params);
  });
}
