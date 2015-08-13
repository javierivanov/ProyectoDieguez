    </div>

    <footer class="footer">
      <div class="container">
        <p class="text-muted"><?php echo @$footer; ?></p>
      </div>
    </footer>

    <script src="dist/js/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <?php
    if (@is_array(@$js_files))
    {
    	foreach ($js_files as $value) {
    		echo '<script src="'.$value.'"></script>';
    	}
    }
    ?>
    
  </body>
</html>