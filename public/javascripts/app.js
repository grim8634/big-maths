$(document).ready(function(){
	$( "#quiz1" ).submit(function( event ) {
		$( ".questions li" ).each(function( index ) {
		 	var answer =  $( this ).find('.result').attr('answer');
		 	var submitted = $( this ).find('input').val();
		 	
		 	var res = $( this ).find('.result');
		 	if(answer == submitted) {
		 		res.css('background-image', 'url(/images/tick.png)');
		 	} else {
		 		res.css('background-image', 'url(/images/cross.png)');
		 	}

		 	$( this ).find('.result').show();

		});
	  event.preventDefault();
	});

	$( "#new_questions" ).click( function( event ) {
		location.reload();
	});
});