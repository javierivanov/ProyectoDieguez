<h2>Categor&iacute;as</h2>


<div class="row">
	<div class="col-xs-8">
		<div class="panel panel-default">
		  <div class="panel-heading">Lista de categor&iacute;as</div>
		  <table class="table">
		    <tr>
		    	<td><b>#</b></td>
		    	<td><b>Categoria</b></td>
		    </tr>
        <?php

        foreach ($categorias as $c) {
          echo '<tr>';
          echo '<td>'.$c['id'].'</td>';
          echo '<td>'.trim($c['categoria'],'\'').'</td>';
          echo '</tr>';
        }

        ?>
		  </table>
		</div>
	</div>
	<div class="col-xs-4">
	</div>
</div> <!-- end row -->
