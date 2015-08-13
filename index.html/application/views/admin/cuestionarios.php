<h2>Cuestionarios</h2>


<div class="row">
	<div class="col-xs-8">
		<div class="panel panel-default">
		  <div class="panel-heading">Lista de cuestionarios</div>
		  <table class="table">
		    <tr>
		    	<td><b>#</b></td>
		    	<td><b>Cuestionario</b></td>
		    	<td><b>Fecha</b></td>
		    	<td><b>Opciones</b></td>
		    </tr>
        <?php

        foreach ($cuestionarios as $c) {
          echo '<tr>';
          echo '<td>'.$c['id'].'</td>';
          echo '<td>'.$c['nombre'].'</td>';
          echo '<td>'.$c['fecha'].'</td>';


          echo '<td><button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#Modal" data-id="'.$c['id'].'">
          Eliminar
        </button></td>';
          echo '</tr>';
        }

        ?>
		  </table>
		</div>
	</div>
	<div class="col-xs-4">
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addCuestionarioModal">
  			A&ntilde;adir Cuestionario
		</button> 
	</div>
</div> <!-- end row -->


<!-- Modal -->
<div class="modal fade" id="addCuestionarioModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Subir cuestionario</h4>
      </div>
      <?php
        	echo form_open_multipart('c=admin&m=add_cuestionario');
        ?>
      <div class="modal-body">
      		<div class="alert alert-info" role="alert">
          Seleccione archivo XLS, <a href="files/Formato_cuestionario.xls" class="alert-link">ver formato de archivo de ejemplo</a>.
          El sistema leer&aacute; la planilla con las preguntas y generar&aacute; la base de datos autom&aacute;ticamente.
          </div>
            <input type="text" class="form-control" placeholder="Cuestionario" name="cuestionario" >
            <br />
            <input type="file" class="form-control" placeholder="Archivo XLS" name="userfile" >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="submit	" class="btn btn-primary">Subir</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- eliminar cuestionario -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="Modal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <?php
          echo form_open('c=admin&m=delete_cuestionario');
        ?>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
        <h4 class="modal-title" id="Modal">Desea eliminar?</h4>
      </div>
      <div class="modal-body">
        
          <div class="form-group">
          <div class="alert alert-warning" role="alert">Realmente desea eliminar este cuestionario?, Se eliminar&aacute;n todas las preguntas y respuestas asociadas.</div>
            <input type="hidden" name="id" id="id">
          </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Eliminar</button>
      </div>
      </form>
    </div>
  </div>
</div>




<script type="text/javascript">
  
  $('#Modal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget)
  var caid = button.data('id')

  jQuery("#id").val(caid);
})
</script>