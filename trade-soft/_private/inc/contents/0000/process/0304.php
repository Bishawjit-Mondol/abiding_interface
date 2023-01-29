<?

    $flag = true;
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = "";
    $server_validation = false;
	$status = 0; 
	

    $id = req('c1') > 0 ? req('c1')  : 0;  
	$v3 = req('v3');  
	$d1 = req('d1');  
	$d2 = post_date('d2'); 
	$d3 = req('d3');
	$d4 = req('d4'); 
	$d5 = req('d5');  
	$v9 = req('v9');  
	$v10 = post_date('v10');  
	$v11 = req('v11');
	$v12 = req('v12');  
	$v13 = req('v13');  
	$v14 = req('v14'); 
	$d6 = post_date('d6');
	
	$v2 = req('v2');
	$v4 = req('v4');

    $flag = $qur->execute("UPDATE staff_details 
							SET staff_comments = '$d1', 
								staff_reg_date = '$d2', 
								staff_comission = $d3, 
								staff_mobile = '$d4', 
								father_name = '$v9', 
								dob = '$v10', 
								education = '$v11', 
								permantnt_address = '$v12', 
								nid = '$v13', 
								reference = '$v14', 
								staff_joining_date = '$d6'
							WHERE idstaff = $id;");
							
	$ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success1" )."UPDATE staff_details 
							SET staff_comments = '$d1', 
								staff_reg_date = '$d2', 
								staff_comission = $d3, 
								staff_mobile = $d4, 
								father_name = $v9, 
								dob = $v10, 
								education = $v11, 
								permantnt_address = $v12, 
								nid = $v13, 
								reference = $v14, 
								staff_joining_date = $d6
							WHERE idstaff = $id;";
	
    if($flag){
		$flag = $qur->execute("UPDATE staff  
								SET staff_name = '$v2',
									idpost = $v4
								WHERE idstaff = $id;");
								
		$ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success2" );
	}

    if($flag){
        $qur->con->commit();
        $ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Successfully Done." )."UPDATE staff  
								SET staff_name = $v2,
									idpost = $v4
								WHERE idstaff = $id;";

    }
    else{
        $qur->con->rollback(); 
        $smsg = $qur->custom_select_query("SELECT @software_error");
        $ret_msg = $ret_msg.($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do ." )."".$msg."".$smsg[0][0];
    }
	
    unset($query);
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
    die();
?>
