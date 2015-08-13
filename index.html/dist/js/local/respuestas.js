function firstRun () {
	$("#preguntas").hide();
$.getJSON( "index.php?c=user&m=get_pregunta&cid="+cid, 
function(data) {
	if (data['fin'] == 1)
	{
		$("#porcentaje").width("100%");
  		$("#porcentaje_t").text("100%");
  		$("#preguntas").animate({opacity: 0},400,"linear",function(){
  			$('#end_modal').modal();
  		});
	}
	else
	{
		$("#pregunta").text(data['pregunta']);
		$("#cat").text(data['categoria']);
		$("#sub_cat").text(data['sub_categoria']);
		$("#codigo").text(data['codigo']);
		$("#porcentaje").width(data['porcentaje']+"%");
  		$("#porcentaje_t").text(data['porcentaje']+"%");
	}
	$("#preguntas").show();
});

}

function update_p () {
$.getJSON( "index.php?c=user&m=get_pregunta&cid="+cid, 
function(data) {
	if (data['fin'] == 1)
	{
		$("#porcentaje").width("100%");
  		$("#porcentaje_t").text("100%");
  		$("#preguntas").animate({opacity: 0},400,"linear",function(){
  			$('#end_modal').modal();
  		});
	}
	else
	{
		$("#pregunta").text(data['pregunta']);
		$("#cat").text(data['categoria']);
		$("#sub_cat").text(data['sub_categoria']);
		$("#codigo").text(data['codigo']);
		$("#porcentaje").width(data['porcentaje']+"%");
		$("#porcentaje_t").text(data['porcentaje']+"%");
  		$("#preguntas").animate({
				opacity: 1,
				height: "toggle"
			},400, "linear");
	}
});

}



$("#si").click(function(){
	$("#preguntas").animate({
		opacity: 0,
			height: "toggle"}, 400, "linear", function(){
				$.get("index.php?c=user&m=responder_pregunta&resp=1&cid="+cid).done(function ()
					{
						update_p();
					});
			});
});


$("#no").click(function(){
	$("#preguntas").animate({
		opacity: 0,
			height: "toggle"}, 400, "linear", function(){
				$.get("index.php?c=user&m=responder_pregunta&resp=0&cid="+cid).done(function ()
					{
						update_p();
					});
			});
});

setInterval(function(){
	console.log('interval');
	$.getJSON('index.php?c=user&m=get_status').done(function (data){
		if (!data['status'])
		{
			$("#stopDialog").modal({keyboard: false});
		}
	});
}, 20000);

$("#fin_btn").click(function(){
	$('#end_modal').modal('hide');
	setTimeout(function() {
      location.href="index.php?c=user";
}, 1000);
});

firstRun();