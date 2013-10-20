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
