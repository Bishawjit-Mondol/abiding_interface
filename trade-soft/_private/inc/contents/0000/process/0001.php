<?
    $flag = true;
	
	$date = post_date('d1');
	$v0 = $qur->get_new_id('company','idcompany');
    $v1 = req('v1'); 
	$v2 = req('v2'); 
	$v3 =  1000000000;//req('v3'); 
	$v4 = 0;//req('v4'); 
	$v5 = req('v5'); 
	$v6 = req('v6');
	$v7 = req('v7');
	$v8 = req('v8');
 
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = "";

    $qur->execute('START TRANSACTION');
    
    $query[0] = 'company';
    $query[1] = 'isddssi';
    $query[2] = array( 'idcompany','company_name' , 'company_balance', 'company_creditlimit', 'company_phone', 'company_address', 'company_type' ); 
    $query[3] = array($v0, $v1, $v2, $v3, $v6, $v5, 1 );  // company_type=1 means client company_type=2 means supplier
    if($flag){                
        $flag = $qur->insert_query_by_array($query);
		$ret_msg = $ret_msg.($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " success 1 </br>" );
    }
	
	$query1[0] = 'company_details';
    $query1[1] = 'idssds';
    $query1[2] = array( 'idcompany','company_ob' , 'company_contactperson', 'company_contactperson_phone', 'company_comission', 'company_reg_date'); 
    $query1[3] = array($v0, $v2, $v7, $v8, $v4, $date );
	
	/**print query**		
				$table = $query1[0];
				for($a=0; $a<count($query1[2]); $a++){
					$col = $col.', '.$query1[2][$a];
					if($query1[1][$a] == 's')
						$value = $value.', '."'".$query1[3][$a]."'";
					else
						$value = $value.', '.$query1[3][$a];
				}
				$col = substr($col, 1);
				$value = substr($value, 1);
				$print_query = "INSERT INTO $table ($col) VALUES ($value) $q;";
		
				$ret_msg = "</br>".$ret_msg."</br> ".$print_query;
	/*****/ 
	
    if($flag){                
        $flag = $qur->insert_query_by_array($query1);
		$ret_msg = $ret_msg.($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " success 2 </br>" );
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
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do " ).$ret_msg;
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


