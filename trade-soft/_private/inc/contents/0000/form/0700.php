<?
	$id = req('id');
   /* 1 mean with company, 2 mean with staff , 3 mean with propiter, 4 mean with other */
   /* 5 loan, 6 incentive reciver , 7 fund transfer */
	$transaction_type = $qur->custom_select_query("SELECT ___FIND_TRANSACTION_TYPE($id);");

	$transaction_type = $transaction_type[0][0];
	if($transaction_type == 7){

	}
	else{
		$flag = $qur->execute("DELETE FROM transaction WHERE idtransaction = $id");
		if($flag){
			$qur->execute("COMMIT");
			echo "<h3>Successfully Deleted</h3>";
		}
		else{
			echo "<h3>Failed to Deleted</h3>";
		}
	}
	

?>
