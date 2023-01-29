<?
    $flag = true;
    $v2 = $qur->get_new_id('unite','idunite');  
 
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = "";
   	


    if( post('v1') == null){
	$error[$ei++]=post('v1').($lang ?  " খালি রাখা হয়েছে" : " is blank." );
        $flag = false;

    }

    $qur->execute('START TRANSACTION');
    
    $query[0] = 'unite';
    $query[1] = 'is';
    $query[2] = array( 'idunite' , 'unite_name' ); 
    $query[3] = array($v2,  post('v1') );

    if($flag){                
        $flag = $qur->insert_query_by_array($query);
    }

    if($flag){
        $qur->con->commit();
        $ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Successfully Done." );
	
    }
    else{
        $qur->con->rollback(); 
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do." );
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


