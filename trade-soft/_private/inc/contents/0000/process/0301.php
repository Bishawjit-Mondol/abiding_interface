<?

    $flag = true;
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = "";
    $server_validation = false;
	$status = 0; 
	
	if(req('submit_type')=='1'){
		  $status = 1;
	}
	if(req('submit_type')=='2'){
		  $status = 0;
	}


/*---------------------------------------------------------------------------------------*/
/* অনুবাদ 0" : " idstaff_grant এর মান ডাটাবেজ থেকে অানা হচ্ছে */
/*---------------------------------------------------------------------------------------*/

    $v1 = $qur->get_new_id('staff_grant','idstaff_grant');   

/*---------------------------------------------------------------------------------------*/
/* অনুবাদ 0" : " idstaff_grant এর মান ডাটাবেজ থেকে অানা শেষ হয়েছে */
/*---------------------------------------------------------------------------------------*/



/*---------------------------------------------------------------------------------------*/
/* staff_grant টেবিলে ডাটা প্রবেশ করানো শুরু হয়েছে */
/*---------------------------------------------------------------------------------------*/

    
    $query[0] = 'staff_grant';
    $query[1] = 'isidii';
    $query[2] = array( 'idstaff_grant' , 'staff_grant_date' , 'idtransaction_head' , 'staff_grant_ammount' , 'staff_grant_status' , 'idstaff' ); 
    $query[3] = array( $v1 ,  post_date('vd'),  post('v2'),  post('v4'),  $status,  post('c1') );

    if($flag){  
	
        $flag = $qur->insert_query_by_array($query);
    }
/*---------------------------------------------------------------------------------------*/
/* staff_grant টেবিলে ডাটা প্রবেশ করানো শেষ হয়েছে */
/*---------------------------------------------------------------------------------------*/

    if($flag){
        $qur->con->commit();
        $ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Successfully Done." );

/*---------------------------------------------------------------------------------------*/
/*  নতুন লিংকের নাম, এডিশনাল ডাটা ও পেজ নাম্বার দেওয়া হচ্ছে */
/*---------------------------------------------------------------------------------------*/




/*---------------------------------------------------------------------------------------*/
/*  নতুন লিংকের নাম, এডিশনাল ডাটা ও পেজ নাম্বার দেওয়া শেষ হয়েছে */
/*---------------------------------------------------------------------------------------*/


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
