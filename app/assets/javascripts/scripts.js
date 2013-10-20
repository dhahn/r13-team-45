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

  $("#bill_interval").change(function(){
    var recurrence = $("#bill_interval option:selected").text();
    if(recurrence != 'Once'){
      $("#on_interval_change").val("t");
    } else {
      $("#on_interval_change").val("f");
    }
    
  });
});
