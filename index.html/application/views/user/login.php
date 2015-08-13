    <div class="page-header">
    <h1>Registro de usuarios</h1>
    </div>
    
    
    <div class="row">
	    <div class="col-xs-2"></div>
	    <div class="col-xs-8">
	    	<div class="panel panel-success">
		    <div class="panel-heading">Iniciar sesi&oacute;n</div>
		  		<div class="panel-body">
		    		<?php echo form_open('c=user&m=do_login'); ?>
		    		<input type="text" name="user" class="form-control" placeHolder="Usuario" style="margin-bottom: -1px;border-bottom-right-radius: 0;border-bottom-left-radius: 0;" />
		    		<input type="password" name="passwd" class="form-control" placeHolder="Password"  style="border-top-left-radius: 0;border-top-right-radius: 0;" />
		    		<br />
		    		<button type="submit" class="btn btn-default btn-info">
		    			Conectar
		    		</button>
		    		</form>
		  		</div>
		    </div>
	    </div>
	    <div class="col-xs-2"></div>
    </div>