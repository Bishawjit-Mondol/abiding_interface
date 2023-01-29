<?
     $flag = true;

	 $date = req_date('d1');
	//$date2 = req('d2');

	 $h1 = req('h1');
	 $h2 = req('h2'); 
	 $date_time = "$date $h1:$h2:00";
	 $c1 = req('c1');
	 echo $c2 = req('c2'); 
	
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = ""; 

	/* 
$q=$qur->custom_select_query("select * from staff_attendance where idstaff= $c1 AND date_time = $date AND type=1;");
	if($q){
		
	}elseif($){
	
	}	
$mydate = strtotime($_POST['date']);
$myfinaldate = date("d-m-y", $mydate);
   */
   
    $qur->execute('START TRANSACTION');
    if($flag){  
    $query1[0] = 'staff_attendance';
    $query1[1] = 'isi';
    $query1[2] = array( 'idstaff', 'date_time', 'type'); 
    $query1[3] = array( $c1, $date_time ,$c2 );  
                   
		$flag = $qur->insert_query_by_array($query1);
		$ret_msg = $ret_msg.($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success=1 </br>" );
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


