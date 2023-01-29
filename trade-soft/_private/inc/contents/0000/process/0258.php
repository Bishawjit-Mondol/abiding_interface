<?
    $flag = true;
    $v1 = req('v1'); 
    $v2 = req('v2'); 
	
	$v0 = $qur->get_new_id('pestablishment','idpestablishment');
	
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = ""; 

    $qur->execute('START TRANSACTION');
    
    $query[0] = 'pestablishment';
    $query[1] = 'iss';
    $query[2] = array( 'idpestablishment','pestablishment_name', 'pestablishment_address'); 
    $query[3] = array( $v0 , $v1 , $v2 );
    if($flag){                
        $flag = $qur->insert_query_by_array($query);
    }
	
	 if($flag){                
		$query2[0] = 'pestablishment_type';
		$query2[1] = 'ii';
		$query2[2] = array( 'idpestablishment', 'pestablishment_type'); 
		$query2[3] = array( $v0 , 2 );
    
		$flag = $qur->insert_query_by_array($query2);
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


