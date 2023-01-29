<?php
	$css =  req('newcss');
	$flag = $qur->execute("UPDATE ___users SET css = ".$css." WHERE iduser = ".$idstaff);
	if($flag){
		$qur->con->commit();
		echo "<br/><h3 class='green'>Successfully Updated</h3><br/>";
	}
	else{
		$qur->con->rollback();
		echo "<h2 class='red'>Theme Update Failed</h2><br/>";
	}
?>
