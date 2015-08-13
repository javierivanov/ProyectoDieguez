function runFirst () {
	setTimeout(function() {
      $("#exito_div").animate({
      	 opacity: 0.0,
      }, 500, "linear", function ()
      {
      	$(this).remove();
      });
	}, 5000);
}


runFirst();