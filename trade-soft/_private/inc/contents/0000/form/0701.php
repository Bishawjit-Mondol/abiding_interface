<?
	$id = req('id');
	

	if($id){
		//echo "DELETE FROM purchase WHERE idpurchase = $id";
		$flag = $qur->execute("DELETE FROM purchase WHERE idpurchase = $id");
		if($flag){
			$qur->execute("COMMIT");
			echo "<h3>Purchase Successfully Deleted</h3>";
		}
		else{
			echo "<h3>Failed to Deleted Purchase</h3>";
		}
	}
	

?>
