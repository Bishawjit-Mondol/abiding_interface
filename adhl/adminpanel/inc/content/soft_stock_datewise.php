<h1>Datewise Stock</h1>
<?php
	include("inc/double_date.php");
	$q=mysql_query("SELECT stock_update.*, text_data.id, text_data.heading FROM stock_update LEFT JOIN text_data ON (stock_update.text_data_id=text_data.id) WHERE date between '".$date1."' AND '".$date2."' ORDER BY date DESC");
	include("inc/stock_update_display.php");
?>