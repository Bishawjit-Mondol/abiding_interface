<h1>Daily Expenses</h1>
<?
	include("inc/single_date.php");
	$q=mysql_query("SELECT * FROM payments WHERE amount<0 AND date='".$date."'");
	include("inc/revenue_display.php");
?>