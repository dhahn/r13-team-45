$(document).ready(function(){

  $("#menu-button").click(function(){
    var menu = $("#main-nav-menu");
    if(menu.hasClass("open")){
      menu.removeClass("open");
      $("#page-wrap").removeClass("open");
    } else {
      menu.addClass("open");
      $("#page-wrap").addClass("open");
    }
  });

  $(".value, .chorelist .value").click(function(){
    if($(this).hasClass("line-through")){
      $(this).removeClass("line-through");
    } else {
      $(this).addClass("line-through");
    }
  });

  // $(".increment-poll span").click(function(){
  //   var $valueSpan = $(this).parent().siblings(".value");
  //   var $valueSpanNumber = parseInt($valueSpan.html());
  //   $valueSpan.html($valueSpanNumber + 1);
  // });

  $('.increment-poll span').click(function(){
    var user_id = $(this).parent().parent().data("user-id");
    var item_id = $(this).parent().parent().data("item-id");
    var value_span = $(this).parent().siblings(".value");
    $.ajax({
      url: '/poll_list_items/'+item_id+'.json',
      data: { poll_list_item: {value: (parseInt(value_span.html()) + 1), users_voted: user_id} },
      type: 'PUT',
      success: function(response) {
        value_span.html(response["item"]["value"]);
        $.each(response["other_items"], function( index, value) {
          var item = $("*[data-item-id="+value["id"]+"]"); 
          $(item).children(".value").html(value["value"]);
        })
        //logic to add user's picture
      },
      failure: function(response){
        //logic to display alert of why it failed
      }
    });
  });

});
