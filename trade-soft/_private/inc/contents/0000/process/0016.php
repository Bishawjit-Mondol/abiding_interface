<?
    $flag = true;
	
	$v0 = $qur->get_new_id('transaction_head','idtransaction_head');
    $v1 = req('v1'); 
	$v2 = req('v2'); 

    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = ""; 

    $qur->execute('START TRANSACTION');
    
    $query[0] = 'transaction_head';
    $query[1] = 'si';
    $query[2] = array('transaction_head_name','idtransaction_head_type'); 
    $query[3] = array($v1,$v2);
    if($flag){                
        $flag = $qur->insert_query_by_array($query);
    }
	if(!$flag){
		$ret_msg = $ret_msg.($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " sss 1" );
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
        $qur->con->rollback(); 
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do." ).''.get_insert_query($query);
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


