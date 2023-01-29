<?php 
    $flag = true;
	
	$d1 = req_date('d1');
	$d2 = req_date('d2');
	
	$v0 = $qur->get_new_id('transaction','idtransaction');
	$v4 = req('v4'); 
	$v5 = req('v5'); 
	$v10 = req('v10'); 
	$v11 = req('v11'); 
	$v12 = req('v12'); 
	$v13 = req('v13');

    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = ""; 
	
	if(req('submit_type')=='1'){
		$status = '1';
	}
	if(req('submit_type')=='2'){
		$status = '0';
	}
	
    $qur->execute('START TRANSACTION');   // update a status 1 korte hobe
	
    if($flag){  
		//$ret_msg = "<br/>"."UPDATE `transaction` SET idmestablishment= $v4 , transaction_ammount= $v5*$v13 , transaction_date = '".$d1."', transaction_status = $status WHERE idtransaction=$v12";
		$flag = $qur->execute("UPDATE `transaction` SET idmestablishment= $v4 , transaction_ammount= $v5*$v13 , transaction_date = '".$d1."', transaction_status = $status WHERE idtransaction=$v12");
		$ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success 1 " ).$ret_msg;
    }

	if($flag && $v11==2){  
		//$ret_msg = "<br/>"."UPDATE transaction_details SET transaction_cheque_date= '".$d2."' , transaction_comments= '".$v10."' WHERE idtransaction=$v12";
		$flag = $qur->execute("UPDATE transaction_details SET transaction_cheque_date= '".$d2."' , transaction_comments= '".$v10."' WHERE idtransaction=$v12");
		$ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success 2 " ).$ret_msg;
    }


    if($flag){
        $qur->con->commit();
        $ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Successfully Done." );
		/*
        $link[$li]['label']   = $link_label1 = ($lang ?  "১ নম্বর লিংক" : "Link 1" );
        $link[$li]['address'] = $addr_exten1 = "&&prm1=xyz&&prm2=abc&&ln=".req('ln');
        $link[$li++]['type'] = 'primary divloader entry link0008';
		 
		*/
    }
    else{
		//$error = $qur->custom_select_query("SELECT @software_error");
        $qur->con->rollback(); 
		$ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do." ).$error[0][0].''.$ret_msg;
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


