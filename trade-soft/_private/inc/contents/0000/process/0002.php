<?
	
    $flag = true;
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = "";
    $server_validation = true;


/*---------------------------------------------------------------------------------------*/
/* অনুবাদ 0" : " idstaff এর মান ডাটাবেজ থেকে অানা হচ্ছে */
/*---------------------------------------------------------------------------------------*/

    $v1 = $qur->get_new_id('staff','idstaff');   

/*---------------------------------------------------------------------------------------*/
/* অনুবাদ 0" : " idstaff এর মান ডাটাবেজ থেকে অানা শেষ হয়েছে */
/*---------------------------------------------------------------------------------------*/



/*---------------------------------------------------------------------------------------*/
/* staff টেবিলে ডাটা প্রবেশ করানো শুরু হয়েছে */
/*---------------------------------------------------------------------------------------*/

    
    $query[0] = 'staff';
    $query[1] = 'isdi';
    $query[2] = array( 'idstaff' , 'staff_name' , 'staff_balance' , 'idpost' ); 
    $query[3] = array( $v1,  req('v2'),  req('v3'),  req('v4') );

    if($flag){                
        $flag = $qur->insert_query_by_array($query);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success 11." );
        unset($query);
    }

	if($flag){
		$query1[0] = 'staff_details';
		$query1[1] = 'idssdsdssssss';
		$query1[2] = array( 'idstaff' , 'staff_ob' , 'staff_comments' , 'staff_reg_date' , 'staff_comission' , 'staff_mobile' ,'staff_sallary','father_name', 'dob', 'education', 'permantnt_address', 'nid', 'reference'); 
		$query1[3] = array( $v1,  req('v3'),  req('d1'),  post_date('d2'),  req('d3'),  req('d4'), req('d5'),  req('v9'),  post_date('v10'),  req('v11'),  req('v12'),  req('v13'),  req('v14'));
		$flag = $qur->insert_query_by_array($query1);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success 22." ).$qur->queryPrint($query1);
		unset($query1);
	}	

/*---------------------------------------------------------------------------------------*/
/* staff টেবিলে ডাটা প্রবেশ করানো শেষ হয়েছে */
/*---------------------------------------------------------------------------------------*/

  

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
