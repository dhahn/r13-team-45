$(document).on("change", "#bill_interval", function(){
  var recurrence = $("#bill_interval option:selected").text();
  if(recurrence == 'Weekly' || recurrence == 'Monthly'){
    $("#on_interval_change").val("t");
    $("#specific_day_of").show();
    if(recurrence == 'Weekly'){
      $('#weekly_specific_day_of').removeClass("hidden");
      $('#monthly_specific_day_of').children("select").first().attr("name","nothing");
      $('#monthly_specific_day_of').addClass("hidden");
    }
    else if(recurrence == 'Monthly'){
      $('#monthly_specific_day_of').removeClass("hidden");
      $('#weekly_specific_day_of').children("select").first().attr("name","nothing");
      $('#weekly_specific_day_of').addClass("hidden");
    }
  } else {
    $("#on_interval_change").val("f");
    $('#weekly_specific_day_of').children("select").first().attr("name","nothing");
    $('#weekly_specific_day_of').addClass("hidden");
    $('#monthly_specific_day_of').children("select").first().attr("name","nothing");
    $('#monthly_specific_day_of').addClass("hidden");
  }
});

$(document).on("click", '.bill .amount', function(){
	var bill_id = $(this).data("bill-id");
	$.ajax({
		url: '/bills/' + bill_id + '.json',
		data: { bill: {value: ($(this).data("value") + 1)} },
		type: 'PUT',
		success: function(response) {
			var bill = $("*[data-bill-id=" + response["id"] + "]");
			$(bill).data("value", response["value"]);
			$(bill).toggleClass("line-through");
		}
	});
});
