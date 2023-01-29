<?php
    if(req('ulp') && req('ulpr') && req('ufn') && req('uli') && req('uct')){
		if(req('ulp')==req('ulpr')){
			$id = $qur->get_new_id('___users', 'iduser');
			
			$qur->execute('START TRANSACTION');
			
			$flag = $qur->insert_query('___users', 'isssi', array('iduser','name','login','password','level'), array($id,req('ufn'),req('uli'),md5(req('ulp')),req('uct')));
			
			if($flag){
				$flag = $qur->execute("INSERT IGNORE INTO ___user_menu (SELECT $id, idsubmenu, 0 FROM ___sub_menu)");
			 }
			    
			echo "<br/>";
			if($flag){
				$qur->execute('COMMIT');
				echo "<h3 class='green'>User Successfully Added</h3><br/>";
				unset($_REQUEST['uli'],$_REQUEST['ulp'],$_REQUEST['ulpr'],$_REQUEST['uct']);

			}
			else{
				$qur->execute('ROLLBACK');
				echo "<h3 class='red'>Could not Add User</h3><br/>";
			}
		}
		else{
			echo "<h3 class='red'>Password does not match</h3><br/>";
		}
    }
	else
	{
		echo "<h3 class='red'>Please Fill All Fields</h3><br/>";
	}
    
?>
