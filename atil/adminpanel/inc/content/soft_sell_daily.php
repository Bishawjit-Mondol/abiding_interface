<h1>Daily Sell</h1>
<?php
	include("inc/single_date.php");
	$q=mysql_query("SELECT * FROM sells WHERE  status>0 AND status<4 AND date='".$date."' ORDER BY id DESC");
	include("inc/sell_display.php");
?>