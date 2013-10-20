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
