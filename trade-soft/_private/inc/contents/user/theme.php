<?php
	if($_REQUEST['ab']){
		include 'process/'.req('sub').".php";
	}
	include 'form/'.req('sub').".php";
?>