<?
    if($idstaff == 0 ){
	$qur->execute("INSERT IGNORE INTO ___user_menu (SELECT 0,idsubmenu,1 FROM ___sub_menu s);");
    }
    $qur->execute('START TRANSACTION');

    $query1 = "SELECT (SELECT name_2 FROM ___sub_menu WHERE page = '".$_GET['sub']."') as page , (SELECT CONCAT(name, ' (', login , ')' ) FROM ___users u WHERE iduser = $idstaff )  as staff;";

    $query2 = "UPDATE ___users SET status = 0 WHERE iduser = $idstaff";

    $det = $qur->custom_select_query($query1);

    $des = "Suspended ".$det[0][1]." account for trying to access on ".$det[0][0]." page.";    

    $query[0] = '___logfile';
    $query[1] = 'is';
    $query[2] = array('iduser', 'description'); 
    $query[3] = array($idstaff,$des);

    $flag = $qur->insert_query_by_array($query);
    if($flag){
	$flag = $qur->execute($query2);
    }
   
    if($flag){
	if($idstaff != 0){
        	$qur->con->commit();
	}
    }
    else{
        $qur->con->rollback(); 
    }
?>
<? if($ln){ ?>
<h1 class = 'red'>এই পেইজে প্রবেশের চেষ্টার জন্য অাপনার একাউন্ট সাসপেন্ড করা হল।</h1>
<? }else{ ?>
<h1 class = 'red'>Your Account Is Suspended For Trying to Access This page.</h1>
<? } ?>

