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

	$(".checklist .value, .chorelist .value").click(function(){
		if($(this).hasClass("line-through")){
			$(this).removeClass("line-through");
		} else {
			$(this).addClass("line-through");
		}
	});

	$(".increment-poll span").click(function(){
		var $valueSpan = $(this).parent().siblings(".value");
		var $valueSpanNumber = parseInt($valueSpan.html());
		$valueSpan.html($valueSpanNumber + 1);
	});

});