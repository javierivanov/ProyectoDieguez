<script type="text/javascript">
	var cid = <?php echo @$cid; ?>;
</script>
<div class="page-header">
<h1>Cuestionario</h1>
</div>

<div class="progress">
  <div class="progress-bar progress-bar-striped active" id="porcentaje" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
  <span id="porcentaje_t"></span>
  </div>
</div>
<div class="row">
	<div class="col-xs-12" id="central">
		<div class="panel panel-default" id="preguntas">
			<div class="panel-heading">
				<h4 id="cat"></h4>
			</div>
			<div class="panel-body">
			<h5 id="sub_cat"></h5>
			<p id="codigo"></p>
				<p id="pregunta">
                    
				</p>
			</div>
			<div class="modal-footer" id="footer_panel">
        		<button type="button" class="btn btn-default" data-dismiss="modal" id="no">No</button>
        		<button type="button" class="btn btn-primary" id="si">Si</button>
      		</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="end_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Fin del cuestionario</h4>
      </div>
      <div class="modal-body">
        Has respondido el cuestionario en su totalidad, gracias!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="fin_btn">Volver</button>
      </div>
    </div>
  </div>
</div>



<!-- NO MODAL -->


<div class="modal fade" id="stopDialog" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Otro usuario se encuentra respondiendo el cuestionario.</h4>
      </div>
      <div class="modal-body">
        <p>Vuelva a intentarlo mas tarde, o espere.</p>
      </div>
    </div>
  </div>
</div>