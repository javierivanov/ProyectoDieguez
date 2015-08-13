<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Login de administraci&oacute;n</title>

    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->

  </head>

  <body>
<center>
    <div style="width: 30%;">
<?php echo form_open('c=admin&m=do_login', array('class' => 'form-signin', 'role' => 'form')); ?>
        <h2>Inicio de sesi&oacute;n administraci&oacute;n</h2>
        <br />
        <input type="text" id="user" class="form-control" name="user" placeholder="Usuario" required autofocus>
        <br />
        <input type="password" id="passwd" name="passwd" class="form-control" placeholder="Password" required>
        <div class="checkbox">
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
      </form>

    </div> <!-- /container -->
</center>
  </body>
</html>

