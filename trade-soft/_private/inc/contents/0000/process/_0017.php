<?php 

    $flag = true;
	
	$date = post_date('d1');
	$date2 = post_date('d2');

	$v0 = $qur->get_new_id('transaction','idtransaction');
    $v1 = req('v1');
	$v2 = req('v2'); 
	$v3 = req('v3'); 
	$v4 = req('v4'); 
	$v5 = req('v5'); 
	$v6 = req('v6');
	$v7 = req('v7');
	$v8 = req('v8'); 
	$v9 = req('v9'); 
	$v10 = req('v10'); 

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

    $qur->execute('START TRANSACTION');
	if($flag && $v1 == 1 && $v6 == 2){  
    $query1[0] = 'transaction';
    $query1[1] = 'isidiiiii';
    $query1[2] = array('idtransaction','transaction_date','idmestablishment','transaction_ammount','idtransaction_head','transaction_type','transaction_status','idstaff','iduser'); 
    $query1[3] = array( $v0, $date, 1, $v5*$v1, $v3, $v6, $status, 1, 1);  // transaction_type means 'method'
             								   //  idmestablishment=1(default) when "cheque || receive"    
        $flag = $qur->insert_query_by_array($query1);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=1 </br>" ).$qur->queryPrint($query1);;
		unset($query1);
    }    
	elseif($flag){  
    $query1[0] = 'transaction';
    $query1[1] = 'isidiiiii';
    $query1[2] = array('idtransaction','transaction_date','idmestablishment','transaction_ammount','idtransaction_head','transaction_type','transaction_status','idstaff','iduser'); 
    $query1[3] = array( $v0, $date, $v4, $v5*$v1, $v3, $v6, $status, 1, 1);  // transaction_type means 'method'
             								     //      
        $flag = $qur->insert_query_by_array($query1);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=1 </br>" ).$qur->queryPrint($query1);;
		unset($query1);
    }
	if($flag){  
    $query2[0] = 'transaction_company';
    $query2[1] = 'ii';
    $query2[2] = array('idtransaction','idcompany'); 
    $query2[3] = array( $v0, $v2);
                   
        $flag = $qur->insert_query_by_array($query2);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=2 </br>" ).$qur->queryPrint($query2);
		unset($query2);
    }
	
	
	/*******          Transaction Details ******/
	if($flag && $v6==2){  
	
		if($v1 == 1) {
			$query3[0] = 'transaction_details';
			$query3[1] = 'isssss';
			$query3[2] = array('idtransaction','transaction_cheque','transaction_cheque_date','transaction_bank','transaction_branch','transaction_comments'); 
			$query3[3] = array( $v0, $v8, $date2, $v7, $v9, $v10 );
                   
			$flag = $qur->insert_query_by_array($query3);
			$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=3 </br>" ).$qur->queryPrint($query3);
		}
		
		else { 
			$det = $qur->custom_select_query( " SELECT  CONCAT(cheque_leaf_pre, cheque_leaf_sl) FROM cheque_leaf WHERE idcheque_leaf=$v8; "); 
			$query4[0] = 'transaction_details';
			$query4[1] = 'isssss';
			$query4[2] = array('idtransaction','transaction_cheque','transaction_cheque_date','transaction_bank','transaction_branch','transaction_comments'); 
			$query4[3] = array( $v0, $det[0][0], $date2, $v7, $v9, $v10 );
                   
			$flag = $qur->insert_query_by_array($query4);
			$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=4 </br>" ).$qur->queryPrint($query4);
	
			if($flag){
				$query5[0] = 'transaction_cheque_leaf';
				$query5[1] = 'ii';  
				$query5[2] = array( 'idtransaction', 'idcheque_leaf' ); 
				$query5[3] = array( $v0, $v8 );
                   
				$flag = $qur->insert_query_by_array($query5);
				$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=5 </br>" ).$qur->queryPrint($query5);
			}
		
			if($flag){
				$queryx = "UPDATE cheque_leaf  SET cheque_leaf_status = 1 WHERE idcheque_leaf = ".$v8 ;
				$flag = $qur->execute($queryx);
				$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=6 </br>" ).''.$queryx;
			}
		} 
		
    }
	elseif($flag && $v6==1){ 
		$query6[0] = 'transaction_details';
		$query6[1] = 'is';
		$query6[2] = array('idtransaction','transaction_comments'); 
		$query6[3] = array( $v0, $v10 );
                   
		$flag = $qur->insert_query_by_array($query6);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=6 </br>" ).$qur->queryPrint($query6);
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
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do." ).$ret_msg;
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>



