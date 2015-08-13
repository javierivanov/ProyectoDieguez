<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo @$title; ?></title>

    <!-- Bootstrap -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="dist/sticky-footer.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

    <div class="container">
    
    <?php

     if (@$error == TRUE)
      {
        echo '<br /><div class="alert alert-danger" role="alert" id="error_div">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> ';
        echo $mensaje.'</div>';
      }
      if (@$exito == TRUE)
      {
        echo '<br /><div class="alert alert-success" role="alert" id="exito_div">
        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> '.$mensaje.'</div>';
      }

      if (@$info == TRUE)
      {
        echo '<br /><div class="alert alert-info" role="alert" id="info_div">
        <span class="glyphicon glyphicon-flag" aria-hidden="true"></span> '.$mensaje_info.'</div>';
      }
  ?>
  <?php
  if(isset($user)){
    ?>
    <div style="text-align:right; margin-top: 5px">Hola <?php @$user; ?>, <a href="index.php?c=user&m=logout">cerrar sesi&oacute;n?</a></div>
    <?php
  }
  ?>