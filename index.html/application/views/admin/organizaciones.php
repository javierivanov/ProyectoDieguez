<h3>Organizaciones</h3>




<div class="row">
  <div class="col-xs-8">

<div class="panel panel-default">
  <div class="panel-heading">Lista de organizaciones</div>
  <table class="table">
    <tr>
    <td><b>#</b></td> <td><b>Nombre</b></td> <td><b>Mail</b></td> <td><b>Usuarios</b></td> <td><b>Opciones</b></td>
    </tr>
    <?php foreach ($organizaciones as $org) {
	echo '<tr><td>'.$org['id'].'</td> <td>'.$org['nombre'].'</td> <td>'.$org['mail'].'</td>';
	
  ?>
  <td>
  <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Usuarios<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                <?php
                  foreach ($usuarios as $user) {
                      if ($user['oid'] == $org['id'])
                      {
                        echo '<li><a href="?c=admin&m=usuarios&uid='.$user['id'].'">'.$user['user'].'</a></li>';
                      }
                    }
                ?>
                  <li><a href="#" onclick="$('#modal<?php echo $org['id']; ?>').modal();"><strong>Nuevo usuario</strong></a></li>
                </ul>
              </li>
            </td>
  <td>
    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#eliminar" data-id="<?php echo $org['id']; ?>">Eliminar</button>
  </td>
  </tr>
  <?php	
	}
	?>
  </table>
</div>

  </div>
  <div class="col-xs-4">



<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  A&ntilde;adir Organizaci&oacute;n
</button> 


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Agregar organizaci&oacute;n</h4>
      </div>
      <?php
        	echo form_open('c=admin&m=add_organizacion');
        ?>
      <div class="modal-body">
            <input type="text" class="form-control" placeholder="Nombre" name="nombre" >
            <br />
            <input type="text" class="form-control" placeholder="Mail" name="mail" >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="submit	" class="btn btn-primary">A&ntilde;adir</button>
      </div>
      </form>
    </div>
  </div>
</div>



<?php

foreach ($organizaciones as $org) {
  ?>

  <div class="modal fade" id="modal<?php echo $org['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Agregar Usuario</h4>
      </div>
      <?php
          echo form_open('c=admin&m=add_usuario');
        ?>
      <div class="modal-body">
          <input type="hidden" value="<?php echo $org['id']; ?>" name="oid">
          <label>A&ntilde;adir usuario a organizaci&oacute;n <u><?php echo $org['nombre']; ?></u></label>
            <input type="text" class="form-control" placeholder="Usuario" name="user" >
            <br />
            <input type="password" class="form-control" placeholder="Password" name="passwd" >
            <br />
            <input type="password" class="form-control" placeholder="Repetir Password" name="repasswd" >
            <br>
            <input type="text" class="form-control" placeholder="Nombres" name="nombre" >
            <br>
            <input type="text" class="form-control" placeholder="Apellidos" name="apellidos" >
            <br>
            <input type="text" class="form-control" placeholder="Cargo" name="cargo" >
            <br>
            <input type="text" class="form-control" placeholder="Email" name="mail" >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="submit  " class="btn btn-primary">A&ntilde;adir</button>
      </div>
      </form>
    </div>
  </div>
</div>


  <?php
}

?>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="eliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Eliminar la organizacion?</h4>
      </div>
      <div class="modal-body">
        Realmente desea eliminar la organizaci&oacute;n?, esto eliminar&aacute; toda la informaci&oacute;n asociada.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="el_btn">Eliminar</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
  
$('#eliminar').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var oid = button.data('id');
  $("#el_btn").click(function(){
    location.href="index.php?c=admin&m=delete_organizacion&oid="+oid;
  })
});

</script>
