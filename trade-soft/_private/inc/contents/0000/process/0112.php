<?php 
    $flag = true;
	
	$date = post_date('d1');
	$v0 = $qur->get_new_id('cheque_leaf', 'idcheque_leaf');
    $v1 = req('v1'); 
	$v2 = req('v2');
	$v3 = req('v3');
	$v4 = req('v4');
	
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = " "; 

    $qur->execute('START TRANSACTION');  
	
	for(  $i=$v3;  $i<=$v4;  $i++, $v0++ ){ 
				
		$len = strlen( $v3 );    
		$leaf = sprintf("%0".$len."d",  $i );		
/*
		$leaf = $i; 
		if( strlen( $i ) < strlen( $v3 ) ){
			$d = strlen( $v3 ) - strlen( $i );
			for( $k=0;  $k<$d;  $k++ ){
				$leaf = '0'.$leaf;
			}
		}
*/

	    $query1[0] = 'cheque_leaf';
		$query1[1] = 'iissi';
		$query1[2] = array( 'idcheque_leaf','idbank','cheque_leaf_pre','cheque_leaf_sl', 'cheque_leaf_status' ); 
		$query1[3] = array( $v0, $v1, $v2, $leaf, 0 );
		if($flag){                
			$flag = $qur->insert_query_by_array($query1);
			$ret_msg = $ret_msg."</br>  $leaf";
			//$flag = false;
		}
		
	}

	
    if($flag){
        $qur->con->commit();
        $ret_msg = ($lang ?  "??????? ??????? ??????" : "Successfully Done." );
		/*
        $link[$li]['label']   = $link_label1 = ($lang ?  "? ????? ????" : "Link 1" );
        $link[$li]['address'] = $addr_exten1 = "&&prm1=xyz&&prm2=abc&&ln=".req('ln');
        $link[$li++]['type'] = 'primary divloader entry link0008';
		 
		*/
    }
    else{
        $qur->con->rollback(); 
        $ret_msg = ($lang ?  " ??:???, ?????? ????? ?" : " Failed to do" ).$ret_msg;
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


