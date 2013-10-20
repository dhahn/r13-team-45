$(document).ready( function() {

	function getCurrentRoomTagNames() {
		$.ajax({
			url: "/taggable_users",
			dataType: "json",
			success: function(response) {
				console.log( response );
			}
		});
	}

	$( "textarea" ).on('keyup', function() {
		if( /.*\s\@/.test( $(this).val() ) ) {
			getCurrentRoomTagNames();
		}
	});
});
