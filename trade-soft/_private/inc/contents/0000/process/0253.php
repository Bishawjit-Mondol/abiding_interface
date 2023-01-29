<?
    $flag = true;
	
	$date = post_date('d1');
   	$v1 = req('v1'); 
	$v2 = req('v2'); 
	$v3 = req('v3'); 
	$v4 = req('v4'); 
	
	$v2=strtolower(trim($v2));
	$compressed_v3=md5(trim($v3));
	$compressed_v4=md5(trim($v4));
	$det = $qur->custom_select_query("SELECT * FROM ___users WHERE iduser=$idstaff;");
	
	if($compressed_v3==$det[0][3]){
    
		$error = array();
		$ei = 0;
		$link = array();
		$li = 0;
		$ret_msg = "";

		$qur->execute('START TRANSACTION');
		 
			if($flag){
				
				$flag = $qur->execute("UPDATE ___users SET name='$v1', login='$v2', password='$compressed_v4' WHERE iduser=$idstaff");
				$ret_msg = $ret_msg.($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " success 1 </br>" );
			}
	
	}
    else{
        $flag=false;
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " password not matched " ).$ret_msg;
    }
	
	if($flag){
        $qur->con->commit();
        $ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Successfully Done." );
	}
	else{
        $qur->con->rollback(); 
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do " ).$ret_msg;
	}
	
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


