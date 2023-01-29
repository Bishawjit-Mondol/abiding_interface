<h1>Datewise Purchase</h1>
<?php
	include("inc/double_date.php");
	$q=mysql_query("SELECT * FROM sells WHERE status=4 AND date BETWEEN '".$date1."' AND  '".$date2."' ORDER BY id DESC");
	include("inc/sell_display.php");	
?>