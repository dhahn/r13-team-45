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

});