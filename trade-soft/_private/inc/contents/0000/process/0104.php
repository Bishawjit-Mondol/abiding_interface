<?
    $flag = true;
	
	$date = req_date('d1');
    $v1 = req('v1'); 
	$v2 = req('v2');
	$v3 = req('v3');
	
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = ""; 

    $qur->execute('START TRANSACTION');
    
    $query[0] = 'incenvice_reciver';
    $query[1] = 'iss'; 
    $query[2] = array('idcompany','incentive_reciver_name','incenvice_reciver_remarks'); 
    $query[3] = array( $v2, $v1, $v3 );
    if($flag){                
        $flag = $qur->insert_query_by_array($query);
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
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do" );
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


