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
	  $status = '1';
  }
  if(req('submit_type')=='2'){
	  $status = '0';
  }
 
    $v1 = $qur->get_new_id('purchase','idpurchase');   
    $cat = req('cat_id')?req('cat_id') : 'null';
    $p1 = 0;
    
     if($flag){          
		 
		$query1[0] = 'purchase';
		$query1[1] = 'iisdi';
		$query1[2] = array('idpurchase', 'idcompany', 'purchase_date', 'purchase_ammount', 'purchase_status'); 
		$query1[3] = array($v1,  post('v2'),  req_date('d1'),  0,  0 );
        $flag = $qur->insert_query_by_array($query1);
        //$msg = $msg.$qur->queryPrint($query1);
        unset($query1);
        
        
    }
    $pv1 = $qur->get_new_id('stock_product_input','idstock_product_input');      
    $total = 0;
    $querya = array();
    for($i=0; $i<$n; $i++,$pv1++){
		if(post('purchase_product_'.$i)){
			
			$query2[0] = 'stock_product_input';
			$query2[1] = 'isiddiii';
			$query2[2] = array( 'idstock_product_input' , 'stock_product_input_date' , 'idproduct' , 'stock_product_input_qunatity' , 'stock_product_input_price' , 'idpestablishment' , 'stock_product_input_type' , 'stock_product_input_status' ); 
			$query2[3] = array($pv1,  req_date('d1'),  post('purchase_product_'.$i),  post('purchase_quantity_'.$i),  post('purchase_cost_'.$i),  post('v3'),  7,  $status );
			$total = $total + ( post('purchase_quantity_'.$i)*post('purchase_cost_'.$i));
			if($flag){              
				
					$flag = $qur->insert_query_by_array($query2);
				    //$msg = $msg.$qur->queryPrint($query2);
					unset($query2);
			}
    
			$queryb3[0] = 'purchase_stock_product_input';
			$queryb3[1] = 'ii';
			$queryb3[2] = array( 'idpurchase' , 'idstock_product_input' ); 
			$queryb3[3] = array( $v1 ,  $pv1 );

			if($flag){                
						$flag = $qur->insert_query_by_array($queryb3);
				        //$msg = $msg.$qur->queryPrint($queryb3);
						unset($queryb3);
			}				

		}

	}
    
    if($flag){                
		
		$query = "INSERT INTO purchase_details (";
		$query = $query . "`idpurchase` , `purchase_discount_rate` , `purchase_discount_ammount` , `purchase_comments` , `purchase_issales_return` , `iduser` , `idstaff` ,  `idproduct_catagory` , `purchase_transport` , `idpestablishment`";
		$query = $query . ") VALUES (";
		$query = $query . $v1 .", ". post('purchase_discount') .", ". post('purchase_discount')*($total/100)." ,'". post('purchase_comments') ."',  1, ". ($idstaff?  $idstaff : 'null') .",  ".post('purchase_by').",  ".$cat.",  ".post('purchase_trns')." ,  ".post('v3')." ) ;";
		
        $flag = $qur->execute($query);
        $msg = $msg.(" ".$query);
        unset($query);
        
    } 
    $pay = $total - (post('purchase_discount')*($total/100)) + req('purchase_trns');
    
    $queryx = "UPDATE purchase SET purchase_ammount = ".$pay.", purchase_status = $status WHERE idpurchase = ".$v1;
    if($flag){
		$flag = $qur->execute($queryx);
        //$msg = $msg.$qur->queryPrint($queryx);
        unset($queryx);

	}


    if($flag){                	
		$p4 = (req('v4') != "" ? req('v4') : "PCODE-".$v1);
		
		$q[0] = 'purchase_code';
		$q[1] = 'is';
		$q[2] = array( 'idpurchase' , 'purchase_code' ); 
		$q[3] = array( $v1,  $p4 );
		
        $flag = $qur->insert_query_by_array($q);
        //$msg = $msg.$qur->queryPrint($q);
        unset($q);

    }	




     
     
     
    if($flag){
        $qur->con->commit();
        $ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Successfully Done." );

/*---------------------------------------------------------------------------------------*/
/*  নতুন লিংকের নাম, এডিশনাল ডাটা ও পেজ নাম্বার দেওয়া হচ্ছে */
/*---------------------------------------------------------------------------------------*/


        $link[$li]['label']   = $link_label1 = ($lang ?  "বিল দেখান" : "Show Bill" );
        $link[$li]['address'] = $addr_exten1 = "&&id=".$v1."&&ln=".req('ln')."&&rtype=2";
        $link[$li++]['type'] = 'inactive page-loader box-entry link0139 btn btn-info';

/*---------------------------------------------------------------------------------------*/
/*  নতুন লিংকের নাম, এডিশনাল ডাটা ও পেজ নাম্বার দেওয়া শেষ হয়েছে */
/*---------------------------------------------------------------------------------------*/


    }
    else{
		
        $qur->con->rollback(); 
        $smsg = $qur->custom_select_query("SELECT @software_error");
        $ret_msg = $ret_msg.$smsg[0][0].$msg;
    }
	
    unset($query);
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
    die();
?>
