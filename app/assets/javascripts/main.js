$( document ).ready(function() {

	// New Reservation Ajax Sucess events

	$('#new_reservation').bind('ajax:success', function(){
	  this.reset(), // resets the registration form
	  $("#registrations-added").animate({  // animates In the registration confirmation 
	      opacity: 1,
	      marginLeft: "100px"
	    }, {duration:800, easing:'easeOutCubic'}).delay(800);

	  $("#registrations-added").animate({ // animates Out the registration confirmation 
	      marginLeft: "50px",
	      opacity: 0
	    });
	  ;
	});

}); // end ready function

