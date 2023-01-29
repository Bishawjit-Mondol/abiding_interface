<?
    $flag = true;
	
	$date = post_date('d1');
	
	$v0 = $qur->get_new_id('staff_grant','idstaff_grant');
	$v1 = req('v1');
	$v2 = req('v2');
	$v3 = req('v3');
	$v4 = req('v4');
	

    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = ""; 

    $qur->execute('START TRANSACTION');
    
    $query[0] = 'staff_grant';
    $query[1] = 'isidii';
    $query[2] = array('idstaff_grant','staff_grant_date','idtransaction_head','staff_grant_ammount','staff_grant_status','idstaff'); 
    $query[3] = array( $v0,$date,$v2,$v3,0,$v1);
    if($flag){                
        $flag = $qur->insert_query_by_array($query);
    }
	
	
	$query1[0] = 'staff_grant_details';
    $query1[1] = 'isii';
    $query1[2] = array('idstaff_grant','staff_grant_comments','iduser','idstaff'); 
    $query1[3] = array( $v0,$v4,1,$v1);
    if($flag){                
        $flag = $qur->insert_query_by_array($query1);
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
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do. $date" );
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


