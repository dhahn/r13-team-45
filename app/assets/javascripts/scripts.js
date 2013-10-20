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

  $('.checklist .item').click(function(){
    $.ajax({
      url: '/check_list_items/'+$(this).data("item-id")+'.json',
      data: { check_list_item: {value: ($(this).data("value") + 1)} },
      type: 'PUT',
      success: function(response) {
        $(this).data("value", response["value"]);
        if(response["value"] == 1 && $(this).hasClass("line-through")){
          $(this).addClass("line-through");
        } else if(response["value"] == 0 && !$(this).hasClass("line-through")){
          $(this).removeClass("line-through");
        }
      }
    });
  });

  $(".increment-poll span").click(function(){
    var $valueSpan = $(this).parent().siblings(".value");
    var $valueSpanNumber = parseInt($valueSpan.html());
    $valueSpan.html($valueSpanNumber + 1);
  });

});
