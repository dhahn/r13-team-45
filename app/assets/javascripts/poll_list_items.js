//I guess I need a comment
$(document).on("click",".polllist .increment-poll span", function(){
  var user_id = $(this).parent().parent().data("user-id");
  var item_id = $(this).parent().parent().data("poll-list-item-id");
  var value_span = $(this).parent().siblings(".value");
  $.ajax({
    url: '/poll_list_items/'+item_id+'.json',
    data: { poll_list_item: {value: (parseInt(value_span.html()) + 1), users_voted: user_id} },
    type: 'PUT',
    success: function(response) {
      value_span.html(response["item"]["value"]);
      $.each(response["other_items"], function( index, value) {
        var item = $("*[data-poll-list-item-id="+value["id"]+"]"); 
        $(item).children(".value").html(value["value"]);
      })
      //logic to add user's picture
    },
    failure: function(response){
      //logic to display alert of why it failed
    }
  });
});
