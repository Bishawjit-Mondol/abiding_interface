<?php
	include("inc/sell_action.php");
	$sells_id=$_REQUEST['sells_id'];
	$q=mysql_query("SELECT * FROM sells WHERE id='".$sells_id."'");
	include("inc/sell_display.php");
?>