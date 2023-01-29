<?
    $flag = true;
	
	$date = post_date('d1');
	$v0 = $qur->get_new_id('mestablishment','idmestablishment');
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
    
    $query[0] = 'mestablishment';
    $query[1] = 'isdis';
    $query[2] = array('idmestablishment','mestablishment_name','mestablishment_balance','mestablishment_type','mestablishment_address'); 
    $query[3] = array( $v0,$v1,$v2,3,$v3);
    if($flag){                
        $flag = $qur->insert_query_by_array($query);
	$ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " success 1 </br>" );
    }
    $query[0] = 'mestablishment_details'; 
    $query[1] = 'isss';
    $query[2] = array('idmestablishment','mestablishment_ob','mestablishment_reg_date','mestablishment_comments'); 
    $query[3] = array($v0,$v2,$date,$v4);
    if($flag){                
        $flag = $qur->insert_query_by_array($query);
	$ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " success 1 </br>" );
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
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do" ).$ret_msg;
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


