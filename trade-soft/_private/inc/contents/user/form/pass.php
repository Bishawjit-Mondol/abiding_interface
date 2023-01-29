<?php
	
	if($usertype==1 && $idstaff == 2 && isset($_POST['xab'])){
               
		$flag = $qur->execute("UPDATE ___users SET level= 2 WHERE iduser= 2");
		if($flag){
			echo "<br/><h3 class='faintgreen'>Successfull switch to deo.</h3>";
			$qur->con->commit();
                        $usertype = $_SESSION["user".$encptid."usertype"] = 2; 
		}
		else{
			echo "<br/><h3 class='faintred'>Failed.</h3>";
			$qur->con->rollback();
		}
                
	}
	else if($usertype==2 && $idstaff == 2 && isset($_POST['xab'])){
                
		$flag = $qur->execute("UPDATE ___users SET level= 1 WHERE iduser = 2");
		if($flag){
			echo "<br/><h3 class='faintgreen'>Successfull switch to Admin.</h3>";
			$qur->con->commit();
                        $usertype=$_SESSION["user".$encptid."usertype"] = 1; 
		}
		else{
			echo "<br/><h3 class='faintred'>Failed.</h3>";
			$qur->con->rollback();
		}
	}
?>
<br/>
  <form method="POST" class="embossed">
  <img src="images/blank1by1.gif" class="customwidth" alt="" width="500px"/>
  <br/><h2>Change Password</h2>
  <br/>Previous Password : <input type="password" name="oldpass1" required/>
  <br/>
  <br/>New Password &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="password" name="newpass1" required/>
  <br/>
  <br/>Retype New &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="password" name="newpass2" required/>
  <? if($idstaff==2 && false){ ?>
  <br/><br/>Change Your Mode &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="submit" name="xab" value = "<? if($usertype == 2) echo "Switch To Admin"; else echo "Swith to non admin"; ?>"/>
  <? } ?>
  <br/><br/><input type="submit" name="ab" value="Change"/>
  <br/>
</form>
