<?php
if($usertype==1)
{
	$flag = $qur->execute("UPDATE ___users SET status = !status WHERE iduser = ".post('id'));
	if($flag){
		$qur->con->commit();
	}
}
else{
	$qur->con->rollback();
	echo "<br/><h3>Failed to update</h3>";
}
?>
