$(function() {
	$( "#quiz1" ).on('submit', function(e) { 
		e.preventDefault();
		var correct = 0;
		var total = 0;
		$( ".questions li" ).each(function( index ) {
		 	var answer =  $( this ).find('.result').attr('answer');
		 	var submitted = $( this ).find('input').val();
		 	
		 	var res = $( this ).find('.result');
		 	if(answer) {
			 	if(answer == submitted) {
			 		res.css('background-image', 'url(/images/tick.png)');
			 		correct++;
			 	} else {
			 		res.css('background-image', 'url(/images/cross.png)');
			 	}
			 	total++;
			 	$( this ).find('.result').show();
			 }
		});

		console.log("You scored " + correct + "/" + total);
		alert("You scored " + correct + "/" + total);
	    
	});

	$( "#new_questions" ).click( function( event ) {
		location.reload();
	});
});