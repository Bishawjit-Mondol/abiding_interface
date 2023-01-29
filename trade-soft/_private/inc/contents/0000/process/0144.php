<?
    $flag = true;
	
	$date = post_date('d1');
	$v0 = req('v0'); 
    $v1 = req('v1'); 
	//$v2 = req('v2'); 
	//$v3 = ;req('v3'); 
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
    
	if($flag){  
		$flag = $qur->execute("UPDATE company SET company_name = '".$v1."', company_phone= '".$v6."', company_address= '".$v5."'  WHERE idcompany = ".$v0);
		$ret_msg = "UPDATE company SET company_name = '".$v1."', company_phone= '".$v6."', company_address= '".$v5."'  WHERE idcompany = ".$v0;
	}
	if($flag){  
		$flag = $qur->execute("UPDATE company_details SET company_contactperson = '".$v7."', company_contactperson_phone = '".$v8."' , company_comission= ".$v4.", company_reg_date= '".$date."' WHERE idcompany = ".$v0);
		$ret_msg = "UPDATE company_details SET company_contactperson = '".$v7."', company_contactperson_phone = '".$v8."' , company_comission= ".$v4.", company_reg_date= '".$date."' WHERE idcompany = ".$v0;
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


