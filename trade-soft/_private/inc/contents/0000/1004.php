<?
//This page just give balance of provided account by id;
?>
<?
	$id = req('id')/1;
	$d = $qur->custom_select_query("SELECT point_account_current_balance FROM point_account p WHERE idpoint_account = ".$id);
	echo sprintf("%.2f",$d[0][0]);
?>
 
