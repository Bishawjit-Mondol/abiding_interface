<?php
    $flag = true;
    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = "";
    $server_validation = true;
    $msg = "";
	$status = 0; 
	$n=50;
	if(req('submit_type')=='1'){
	  $status = 1;
	}
	if(req('submit_type')=='2'){
	  $status = 0;
	}
 

	$qur->execute('START TRANSACTION');
 
    $flag = $qur->execute("DELETE FROM sales WHERE idsales = ".req('sid'));
	if($flag){
		$flag = $qur->execute("DELETE FROM stock_product_output WHERE idstock_product_output IN (SELECT idstock_product_output FROM sales_stock_product_output WHERE idsales = ".req('sid')." )");
	}
	$v1 = req('sid');   
    $cat = req('cat_id') ? req('cat_id') : 'null';
    $p1 = 0;
   
     if($flag){          
		 
		$query1[0] = 'sales';
		$query1[1] = 'iisdii';
		$query1[2] = array( 'idsales' , 'idcompany' , 'sales_date' , 'sales_ammount' , 'idsales_type' , 'sales_status' ); 
		$query1[3] = array($v1,  post('v2'),  req_date('d1'),  0,  post('v4'),  0 );

        $flag = $qur->insert_query_by_array($query1);
        $ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success 1 " ).$ret_msg;
    }
    $pv1 = $qur->get_new_id('stock_product_output','idstock_product_output');      
    $total = 0;
    for($i=0; $i<$n; $i++){
		if(post('sales_product_'.$i)){
			
			$querya[$i][0] = 'stock_product_output';
			$querya[$i][1] = 'isiddiii';
			$querya[$i][2] = array( 'idstock_product_output' , 'stock_product_output_date' , 'idproduct' , 'stock_product_output_qunatity' , 'stock_product_output_price' , 'idpestablishment' , 'stock_product_output_type' , 'stock_product_output_status' ); 
			$querya[$i][3] = array($pv1,  req_date('d1'),  post('sales_product_'.$i),  post('sales_quantity_'.$i),  post('sales_cost_'.$i),  post('v3'),  1,  $status );
			$total = $total + ( post('sales_quantity_'.$i)*post('sales_cost_'.$i));
			if($flag){                
				$flag = $qur->insert_query_by_array($querya[$i]);
				$ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success 2 " ).$ret_msg;
			}
    
			$queryb[$i][0] = 'sales_stock_product_output';
			$queryb[$i][1] = 'ii';
			$queryb[$i][2] = array( 'idsales' , 'idstock_product_output' ); 
			$queryb[$i][3] = array( $v1 ,  $pv1++ );

			if($flag){                
				$flag = $qur->insert_query_by_array($queryb[$i]);
				$ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success 3 " ).$ret_msg;
			}				

		}

	}
    
    if($flag){                
		
		$query = "INSERT INTO sales_details (";
		$query = $query . "`idsales` , `sales_discount_rate` , `sales_discount_ammount` , `sales_comments` , `sales_ispurchase_return` , `iduser` , `idstaff` , `sales_delivery_address` , `idproduct_catagory` , `sales_transport` , `idpestablishment`";
		$query = $query . ") VALUES (";
		$query = $query . $v1 .", ". post('sales_discount') .", ". post('sales_discount')*($total/100)." ,'". post('sales_comments') ."',  0, ". ($idstaff?  $idstaff : 'null') .",  ".post('sales_by').", '  " . post('sales_dlv')."    ' ,".$cat.",  ".post('sales_trns')." ,  ".post('v3')." ) ;";
		
        $flag = $qur->execute($query);          /////// some problem...
		$ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success 4 " ).$ret_msg;
   } 
   
    $pay = $total - (post('sales_discount')*($total/100)) + req('sales_trns');
    
    $queryx = "UPDATE sales SET sales_ammount = ".$pay.", sales_status = $status WHERE idsales = ".$v1;
    if($flag){
		$flag = $qur->execute($queryx);
		$ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Success 5 " ).$ret_msg;
	}



     
     $msg=$msg."TEST IS ".$flag;
     
    if($flag){
        $qur->con->commit();
        $ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Successfully Done." );

/*---------------------------------------------------------------------------------------*/
/*  নতুন লিংকের নাম, এডিশনাল ডাটা ও পেজ নাম্বার দেওয়া হচ্ছে */
/*---------------------------------------------------------------------------------------*/


        $link[$li]['label']   = $link_label1 = ($lang ?  "বিল দেখান" : "Show Bill" );
        $link[$li]['address'] = $addr_exten1 = "&&id=".$id_sales."&&ln=".req('ln');
        $link[$li++]['type'] = 'primary divloader entry link0021';

/*---------------------------------------------------------------------------------------*/
/*  নতুন লিংকের নাম, এডিশনাল ডাটা ও পেজ নাম্বার দেওয়া শেষ হয়েছে */
/*---------------------------------------------------------------------------------------*/


    }
    else{
		
        $qur->con->rollback(); 
        $smsg = $qur->custom_select_query("SELECT @software_error");
        $ret_msg = $ret_msg.$smsg[0][0].$query;
    }
	
    unset($query);
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
    die();
?>
