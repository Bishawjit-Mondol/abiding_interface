<?
    $flag = true;
	
//	$date = post_date('d1');
     $v1 = req('v1'); 
	 $v2 = req('v2');
	 $v22 = req('v22'); 	 
	 $v3 = req('v3');
	 $v3x = req('v3x');
	 $v4 = req('v4'); 

	$error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = "";

    $qur->execute('START TRANSACTION');
    
		if($flag){     
        $flag = $qur->execute("UPDATE product SET product_name = '".$v22."', product_mrp = ".$v2." , product_mpp= ".$v3." , product_status = ".req('v4')."   WHERE idproduct = ".$v1);
		
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


