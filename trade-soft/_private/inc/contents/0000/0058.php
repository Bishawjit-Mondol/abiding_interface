<?
    if($usertype==1){
		$qur->execute('START TRANSACTION');
		$flag = $qur->execute("DELETE FROM sales WHERE idsales = ".req('id'));
		if($flag){
			echo "1";
			$qur->execute('COMMIT');
		}
		else{
			echo "2";
		}
	}	
	else{
		echo "3";
	}

?>
