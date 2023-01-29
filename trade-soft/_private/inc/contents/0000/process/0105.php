<?php
    $flag = true;
	
	$date = req_date('d1');
	
	$date2 = req_date('d2');
	$date3 = req_date('d3');

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
	$v11 = req('v11');
	$v12 = req('v12');
	$v55 = req('v55');
	
	if(req('submit_type')=='1'){
		$status = '1';
	}
	if(req('submit_type')=='2'){
		$status = '0';
	}
	
	
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = ""; 

    $qur->execute('START TRANSACTION'); //var_dump($v5);

	

    /***   FOR Withdraw ***/
	if($flag){  
		$query1[0] = 'transaction';
		$query1[1] = 'isidiiii'; 
		$query1[2] = array('idtransaction','transaction_date','idmestablishment','transaction_ammount','idtransaction_head','transaction_type','transaction_status','iduser'); 
		$query1[3] = array( $v0, $date, $v1, -$v55, 23, $v3, $status, 1);  //transaction_type means 'method'
																     //idtransaction_head = 23 for withdraw (fixed)
        $flag = $qur->insert_query_by_array($query1);           
        $ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=1 </br>".$qur->queryPrint($query1) );
    }
	
	if($flag && $v3==2){  
		$det = $qur->custom_select_query( " SELECT  CONCAT(cheque_leaf_pre, cheque_leaf_sl) FROM cheque_leaf WHERE idcheque_leaf=$v7; "); 
		$query2[0] = 'transaction_details';
		$query2[1] = 'isssss';
		$query2[2] = array('idtransaction','transaction_cheque','transaction_cheque_date','transaction_bank','transaction_branch', 'transaction_comments'); 
		$query2[3] = array( $v0, $det[0][0], $date2, $v5, $v9, $v11 );
                   
		$flag = $qur->insert_query_by_array($query2);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=2 </br>" .$qur->queryPrint($query2) );
		
		if($flag){ 
			$query3[0] = 'transaction_cheque_leaf';
			$query3[1] = 'ii';  
			$query3[2] = array( 'idtransaction', 'idcheque_leaf' ); 
			$query3[3] = array( $v0, $v7 );
                   
			$flag = $qur->insert_query_by_array($query3);
			$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=3 </br>" .$qur->queryPrint($query3) );
		}
		
		if($flag){
			$queryx = "UPDATE cheque_leaf  SET cheque_leaf_status = 1 WHERE idcheque_leaf = ".$v7;
			$flag = $qur->execute($queryx);
			$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=4 </br>" ).$queryx;
		}
		
    }
	elseif($flag && $v3==1){ 
		$query6[0] = 'transaction_details';
		$query6[1] = 'is';
		$query6[2] = array('idtransaction','transaction_comments'); 
		$query6[3] = array( $v0, $v11 );
                   
		$flag = $qur->insert_query_by_array($query6);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=6 </br>" ).$qur->queryPrint($query6);
	}
	

	

	/***   FOR Deposit***/
	if($flag){  
		$query5[0] = 'transaction';
		$query5[1] = 'isidiiii';
		$query5[2] = array('idtransaction','transaction_date','idmestablishment','transaction_ammount','idtransaction_head','transaction_type','transaction_status','iduser'); 
		$query5[3] = array( $v0+1, $date, $v2, $v55, 53, $v4, $status, 1);  //transaction_type means 'method'
																     //idtransaction_head = 53 for deposit (fixed)	
		$flag = $qur->insert_query_by_array($query5);           
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=5 </br>" .$qur->queryPrint($query5) );
    }
	
	if($flag && $v4==2){  
		$det = $qur->custom_select_query( " SELECT  CONCAT(cheque_leaf_pre, cheque_leaf_sl) FROM cheque_leaf WHERE idcheque_leaf=$v8; "); 
		$query6[0] = 'transaction_details';
		$query6[1] = 'isssss';
		$query6[2] = array('idtransaction','transaction_cheque','transaction_cheque_date','transaction_bank','transaction_branch', 'transaction_comments'); 
		$query6[3] = array( $v0+1, $det[0][0], $date3, $v6, $v10, $v12 );
		
		
        $flag = $qur->insert_query_by_array($query6);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=6 </br>" .$qur->queryPrint($query6) );
		
		if($flag){ 
			$query7[0] = 'transaction_cheque_leaf';
			$query7[1] = 'ii';  
			$query7[2] = array( 'idtransaction', 'idcheque_leaf' ); 
			$query7[3] = array( $v0+1, $v8 );
                   
			$flag = $qur->insert_query_by_array($query7);
			$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=7 </br>" .$qur->queryPrint($query7) );
		}
		
		if($flag){
			$queryy = "UPDATE cheque_leaf  SET cheque_leaf_status = 1 WHERE idcheque_leaf = ".$v8;
			$flag = $qur->execute($queryy);
			$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=8 </br>" .$queryy );
		}

    }
	elseif($flag && $v4==1){ 
		$query6[0] = 'transaction_details';
		$query6[1] = 'is';
		$query6[2] = array('idtransaction','transaction_comments'); 
		$query6[3] = array( $v0+1, $v12 );
                   
		$flag = $qur->insert_query_by_array($query6);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=6 </br>" ).$qur->queryPrint($query6);
	}
	

	
	
	
	if($flag){  
    $query9[0] = 'fund_transfer';
    $query9[1] = 'ii';
	$query9[2] = array('idtransaction_deposite','idtransaction_withdraw'); 
    $query9[3] = array( $v0+1, $v0); 
			
        $flag = $qur->insert_query_by_array($query9);           
        $ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=9 </br>" .$qur->queryPrint($query9) );
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


