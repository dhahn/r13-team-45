$(document).on("change", "#bill_interval", function(){
  var recurrence = $("#bill_interval option:selected").text();
  if(recurrence == 'Weekly' || recurrence == 'Monthly'){
    $("#on_interval_change").val("t");
    $("#specific_day_of").show();
    if(recurrence == 'Weekly'){
      $('#weekly_specific_day_of').removeClass("hidden");
      $('#monthly_specific_day_of').children("select").first().attr("name","nothing").addClass("hidden");
    }
    else if(recurrence == 'Monthly'){
      $('#weekly_specific_day_of').children("select").first().attr("name","nothing").addClass("hidden");
      $('#monthly_specific_day_of').removeClass("hidden");
      //attr("name","nothing")
    }
  } else {
    $("#on_interval_change").val("f");
    $('#weekly_specific_day_of').children("select").first().attr("name","nothing").addClass("hidden");
    $('#monthly_specific_day_of').children("select").first().attr("name","nothing").addClass("hidden");
  }
});
