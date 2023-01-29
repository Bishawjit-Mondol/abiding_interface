<?php
	if(isset($_POST['ab'])){
			include 'process/'.req('sub').'.php';
	}
    include 'form/'.req('sub').'.php';
?>


