<?
	$id = req('id');
	

	if($id){
		$flag = $qur->execute("DELETE FROM `transaction` WHERE idtransaction = $id AND transaction_status=0");
		if($flag){
			$qur->execute("COMMIT");
			echo "<h3> Advance cheque Deleted Successfully</h3>";
		}
		else{
			echo "<h3>Failed to Deleted Advance cheque</h3>";
		}
	}
	

?>
