<?
    $flag = true;
	
	$date = post_date('d1');
	$v0 = $qur->get_new_id('mestablishment','idmestablishment');
    $v1 = req('v1'); 
	$v2 = req('v2');
	$v3 = req('v3');
	$v4 = req('v4');
	$v5 = req('v5');
	$v6 = req('v6');
	
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = " "; 

    $qur->execute('START TRANSACTION'); 
    
	$det = $qur->custom_select_query( " SELECT bank_name_en FROM bank WHERE idbank= $v1;"); 
	
    $query1[0] = 'mestablishment';
    $query1[1] = 'isdis';
    $query1[2] = array('idmestablishment','mestablishment_name','mestablishment_balance','mestablishment_type','mestablishment_address'); 
    $query1[3] = array($v0,$det[0][0],$v3,2,$v5);
    if($flag){                
        $flag = $qur->insert_query_by_array($query1);
		$ret_msg = $ret_msg.'</br> 1';
    }
	$query2[0] = 'mestablishment_details';
    $query2[1] = 'isss';
    $query2[2] = array('idmestablishment','mestablishment_ob','mestablishment_reg_date','mestablishment_comments'); 
    $query2[3] = array($v0, $v3, $date, $v6);
    if($flag){                
        $flag = $qur->insert_query_by_array($query2);
		$ret_msg = $ret_msg.'</br> 2';
    }
	$query3[0] = 'mestablishment_bank';
    $query3[1] = 'issi';
    $query3[2] = array('idmestablishment','mestablishment_ac', 'mestablishment_branch', 'idbank'); 
    $query3[3] = array($v0,$v2,$v4, $v1);
    if($flag){                
        $flag = $qur->insert_query_by_array($query3);
		$ret_msg = $ret_msg.'</br> 3';
    }
	//$ret_msg = $ret_msg.''.get_insert_query($query3);

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


