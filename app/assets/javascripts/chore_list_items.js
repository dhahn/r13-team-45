// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on("click",'.chorelist .item', function(){
  var item_id = $(this).data("item-id");
  var controller = $(this).data("controller");
  $.ajax({
    url: '/'+controller+'/'+ item_id +'.json',
    data: { chore_list_item: {value: ($(this).data("value") + 1)} },
    type: 'PUT',
    success: function(response) {
      var item = $("*[data-item-id="+response["id"]+"]"); 
      $(item).data("value", response["value"]);
      var line_item = $(item).children(".value");
      if(response["value"] == 1 && !$(line_item).hasClass("line-through")){
        $(line_item).addClass("line-through");
      } else if(response["value"] == 0 && $(line_item).hasClass("line-through")){
        $(line_item).removeClass("line-through");
      }
    }
  });
});
