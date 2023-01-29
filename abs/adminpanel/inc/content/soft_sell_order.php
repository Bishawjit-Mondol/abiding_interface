<h1>Orders</h1>
<?php
	$q=mysql_query("SELECT * FROM sells WHERE status=0 ORDER BY id DESC");
	include("inc/sell_display.php");
?>