<h1>Daily Purchase</h1>
<?php
	include("inc/single_date.php");
	$q=mysql_query("SELECT * FROM sells WHERE status=4 AND date='".$date."' ORDER BY id DESC");
	include("inc/sell_display.php");
?>