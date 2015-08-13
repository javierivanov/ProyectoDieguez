<h2>Resultados</h2>




<div class="row">
    <div class="col-xs-2" style="margin-top: 100px">
    <p>Cuestionario:</p>
        <div class="dropdown">
            <button type="button" class="btn btn-link" data-toggle="dropdown"><span id="cuestionario"></span> <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                <?php
                foreach ($cuestionarios as $c) {
                    echo '<li><a href="#" onclick="filtrarCuestionario('.$c['id'].', \''.$c['nombre'].'\');" role="button">'.$c['nombre'].'</a></li>';
                }
                ?>
            </ul>
        </div>
        <br />
        <p>Organizaci&oacute;n:</p>
        <div class="dropdown">
            <button type="button" class="btn btn-link" data-toggle="dropdown"><span id="organizacion"></span> <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                <?php
                foreach ($organizaciones as $c) {
                    echo '<li><a href="#" role="button" onclick="filtrarOrganizacion('.$c['id'].', \''.$c['nombre'].'\');">'.$c['nombre'].'</a></li>';
                }
                ?>
            </ul>
        </div>
        <br />
        <p>Filtro:</p>
        <div class="dropdown">
            <button type="button" class="btn btn-link" data-toggle="dropdown">Filtrar por <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                <li><a href="#" role="button">Categor&iacute;as</a></li>
                <li><a href="#" role="button">Normas</a></li>
            </ul>
        </div>
    </div>
    <div class="col-xs-10" id="res_c">
        <canvas id="resultados" width="700" height="500"></canvas>
    </div>

</div>
<p>
*Valores en porcentajes
</p>

<script type="text/javascript">
var ctx = $("#resultados").get(0).getContext("2d");

var filtro = 'categoria';
var oid = <?php echo $organizaciones[0]['id']; ?>;
var oid_nombre = "<?php echo $organizaciones[0]['nombre']; ?>";
var cuid = <?php echo $cuestionarios[0]['id']; ?>;
var cuid_nombre = "<?php echo $cuestionarios[0]['nombre']; ?>";
var chart;

function setLabels()
{
    $("#cuestionario").text(cuid_nombre);
    $("#organizacion").text(oid_nombre);
    console.log("hola");
}

function filtrarCuestionario(cuidd, nombre)
{
    cuid = cuidd;
    cuid_nombre = nombre;
    $.getJSON("index.php?c=admin&m=get_resultados&cuid="+cuidd+"&oid="+oid)
  .done(function(data) {
    $("#resultados").remove();
    $("#res_c").append('<canvas id="resultados" width="700" height="500"></canvas>');
    ctx = $("#resultados").get(0).getContext("2d");
    chart = new Chart(ctx).Radar(data);
  });
  setLabels();
}

function filtrarOrganizacion(oidd, nombre)
{
    oid = oidd;
    oid_nombre = nombre;
    $.getJSON("index.php?c=admin&m=get_resultados&cuid="+cuid+"&oid="+oidd)
  .done(function(data) {
    $("#resultados").remove();
    $("#res_c").append('<canvas id="resultados" width="700" height="500"></canvas>');
    ctx = $("#resultados").get(0).getContext("2d");
    chart = new Chart(ctx).Radar(data);
  });
  setLabels();
}

function firstRun()
{
    $.getJSON("index.php?c=admin&m=get_resultados&cuid=<?php echo $cuestionarios[0]['id']; ?>&oid=<?php echo $organizaciones[0]['id']; ?>")
  .done(function(data) {
    console.log(data);
    chart = new Chart(ctx).Radar(data);
  });
  setLabels();
}

firstRun();
</script>

