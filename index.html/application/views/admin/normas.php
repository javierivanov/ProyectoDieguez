<h2>Normas</h2>


<div class="row">
	<div class="col-xs-8">
		<div class="panel panel-default">
		  <div class="panel-heading">Lista de normas</div>
		  <table class="table">
		    <tr>
		    	<td><b>#</b></td>
		    	<td><b>Norma</b></td>
		    </tr>
        <?php

        foreach ($normas as $c) {
          echo '<tr>';
          echo '<td>'.$c['id'].'</td>';
          echo '<td>'.$c['norma'].'</td>';
          echo '</tr>';
        }

        ?>
		  </table>
		</div>
	</div>
	<div class="col-xs-4">
	</div>
</div> <!-- end row -->
