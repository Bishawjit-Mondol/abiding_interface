<br/>
<?php
	$oldpass1 =  req('oldpass1');
	$newpass1 =  req('newpass1');
	$newpass2 =  req('newpass2');
	if(md5($oldpass1)!=$pass){
		echo "<h3 class='faintred'>Wrong Password.</h3>";
	}
	elseif($newpass1!=$newpass2){
		echo "<h3 class='faintred'>Retyped password Mismatch.</h3>";
	}
	else{
		
		$flag = $qur->execute("UPDATE ___users SET password='".md5($newpass1)."' WHERE iduser=".$idstaff);
		if($flag){
			$_SESSION["user".$encptid."pass"]=md5($newpass1);
			echo "<h3 class='faintgreen'>Password Changed.</h3>";
			$qur->con->commit();
		}
		else{
			echo "<h3 class='faintred'>Failed to Change Password.</h3>";
			$qur->con->rollback();
		}
	}
?>
