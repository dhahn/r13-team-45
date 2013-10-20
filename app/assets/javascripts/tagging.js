// $(document).on('load', "textarea", function() {
//   var value = $(this).val();
//   var tagname_pattern = /(?:^|\s)@(\w+)(?=\s|$|\.|\?|!|&|,|<)/g;
//   var query = value.match(tagname_pattern);
//   if(query){
//     $.ajax({
//       type: "GET",
//       url: "/taggable_users.json",
//       data: { q: query },
//       dataType: "json",
//       success: function(response) {
//         $.each(response, function( index, value) {
//           $("textarea").val($("textarea").val().replace("@"+value,"<span class='tagname'>@"+value+"</span>"));
//         })
//       }
//     });
//   }
// });
