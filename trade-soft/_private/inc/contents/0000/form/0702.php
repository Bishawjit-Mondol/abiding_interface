<?
	$id = req('id');
	

	if($id){
		$flag = $qur->execute("DELETE FROM sales WHERE idsales = $id");
		if($flag){
			$qur->execute("COMMIT");
			echo "<h3> Sales Deleted Successfully</h3>";
		}
		else{
			echo "<h3>Failed to Deleted Sales</h3>";
		}
	}
	

?>
