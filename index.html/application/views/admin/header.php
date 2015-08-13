<!DOCTYPE html>
<html lang="en">
  <head>

    <title><?php echo $title; ?></title>

    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/navbar.css" rel="stylesheet">
    <script src="dist/js/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/Chart.min.js"></script>
  </head>

  <body>

    <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">

            <a class="navbar-brand" href="#"><?php echo $project_name; ?></a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="?c=admin">Resultados</a></li>
              <li class=""><a href="?c=admin&m=organizaciones">Organizaciones</a></li>
              <li class=""><a href="?c=admin&m=cuestionarios">Cuestionarios</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="?c=admin&m=logout">Salir admin?<span class="sr-only">(current)</span></a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">

      <?php
      if (@$error == TRUE)
      {
        echo '<div class="alert alert-danger" role="alert">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> ';
        echo @$mensaje.'</div>';
      }
      if (@$exito == TRUE)
      {
        echo '<div class="alert alert-success" role="alert">
        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> '.@$mensaje.'</div>';
      }

      if (@$info == TRUE)
      {
        echo '<div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-flag" aria-hidden="true"></span> '.@$mensaje_info.'</div>';
      }


      ?>

