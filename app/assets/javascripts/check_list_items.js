//I guess I need a comment
$(document).on("click",'.checklist .item', function(){
  $.ajax({
    url: '/check_list_items/'+$(this).data("item-id")+'.json',
    data: { check_list_item: {value: ($(this).data("value") + 1)} },
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
