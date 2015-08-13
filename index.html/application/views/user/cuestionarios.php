<div class="page-header">
<h1>Seleccione cuestionario</h1>
</div>

<div class="row">
	<div class="col-xs-1"></div>
	<div class="col-xs-10" id="central">
		<div class="list-group">
		<?php

		foreach ($cuestionarios as $c) {
			echo '<a href="index.php?c=user&m=respuestas&cid='.$c['id'].'" class="list-group-item'; 
			echo '">'.$c['cuestionario'].' - '.$c['porcentaje'].'%</a>';
		}
  		?>
		</div>
	</div>
	<div class="col-xs-1"></div>
</div>