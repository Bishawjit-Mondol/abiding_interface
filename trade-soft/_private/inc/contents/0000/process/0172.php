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
   $n=200;
   

	if(req('submit_type')=='1'){
		$status = '1';
	}
	if(req('submit_type')=='2'){
		$status = '0';
	}
 
    $v1 = $qur->get_new_id('purchase','idpurchase');   
    $cat = req('cat_id')?req('cat_id') : 'null';
    $p1 = 0;
    $v2 = req('v2');
    $purchase_dollar_rate = req('purchase_dollar_rate');
    
								
     if($flag){          
		 
		$query1[0] = 'purchase';
		$query1[1] = 'iisdi';
		$query1[2] = array( 'idpurchase' , 'idcompany' , 'purchase_date' , 'purchase_ammount' ,  'purchase_status');
			
		$query1[3] = array($v1,  $v2,  req_date('d1'),  0,   0);

        $flag = $qur->insert_query_by_array($query1); 
        $ret_msg = $ret_msg . " LOOp11 14".$qur->queryPrint($query1)."<br/>"; 
        
    }

    $pv1 = $qur->get_new_id('stock_product_input','idstock_product_input');      
    $total = 0;
    $i = 0;
    for($i=0; $i<$n; $i++){
		if(post('purchase_product_'.$i)){
			
			$querya[$i][0] = 'stock_product_input';
			$querya[$i][1] = 'isiddiii';
			$querya[$i][2] = array( 'idstock_product_input' , 'stock_product_input_date' , 'idproduct' , 'stock_product_input_qunatity' , 'stock_product_input_price' , 'idpestablishment' , 'stock_product_input_type' , 'stock_product_input_status' ); 
			$querya[$i][3] = array($pv1,  req_date('d1'),  post('purchase_product_'.$i),  post('purchase_quantity_'.$i),  post('purchase_cost_'.$i)*$purchase_dollar_rate,  post('v3'),  1,  $status );
			$total = $total + ( post('purchase_quantity_'.$i)*post('purchase_cost_'.$i)*$purchase_dollar_rate);
			if($flag){                
				$flag = $qur->insert_query_by_array($querya[$i]);
			     $ret_msg = $ret_msg . " LOOp 2 $i <br/>".$qur->queryPrint($querya[$i]); 
			}
    
			$queryb[$i][0] = 'purchase_stock_product_input';
			$queryb[$i][1] = 'ii';
			$queryb[$i][2] = array( 'idpurchase' , 'idstock_product_input' ); 
			$queryb[$i][3] = array( $v1 ,  $pv1++ );

			if($flag){                
				$flag = $qur->insert_query_by_array($queryb[$i]);
			    $ret_msg = $ret_msg . " LOOp 3 $i <br/>".$qur->queryPrint($queryb[$i]);
			}				

		}

	}

    
    if($flag){                
		

			$queryax[0] = 'purchase_details';
			$queryax[1] = 'idsiiiididssdi';
			$queryax[2] = array( "idpurchase", "purchase_discount_f_rate",  "purchase_comments", "purchase_issales_return", "iduser", "idstaff",  "idproduct_catagory", "purchase_transport", "idpestablishment", "purchase_discount_p_rate", "purchase_details_billing_date", "purchase_details_chalan_date","purchase_dollar_rate","purchase_ischina"); 
			$queryax[3] = array($v1, post('purchase_discount_fitt') , post('purchase_comments') , 0 , $idstaff ?$idstaff: 0  , post('purchase_by') , $cat , post('purchase_trns')*$purchase_dollar_rate , post('v3') , post('purchase_discount_pipe'), req_date('d1'), req_date('d1'), $purchase_dollar_rate, 1 );

			$qxy = $qur->queryPrint($queryax); 
			$flag = $qur->execute($qxy);
			$ret_msg = $ret_msg . " LOOp (44)<br/>".$qur->queryPrint($queryax);     
			if($flag){
				$ret_msg = $ret_msg . "OK 3";     
			}
			else{
				$ret_msg = $ret_msg . "OKF 3";     
			}

    } 
	
    if($flag){
		$qurxis = "SELECT product_type, cost, (purchase_discount_p_rate/100)*cost FROM (
SELECT product_type, cost FROM (
SELECT product_type, cost FROM (
SELECT idproduct, product_type, SUM(stock_product_input_qunatity* stock_product_input_price) as cost FROM purchase_stock_product_input  LEFT JOIN stock_product_input USING(idstock_product_input) LEFT JOIN product USING(idproduct) WHERE idpurchase = $v1 GROUP BY product_type
) as a
UNION
(SELECT 1 , 0)
UNION
(SELECT 2 , 0)
) as a GROUP BY product_type
) as a
LEFT JOIN (
SELECT 1 as product_type, purchase_discount_p_rate FROM purchase_details WHERE idpurchase = $v1
UNION
SELECT 2, purchase_discount_f_rate FROM purchase_details WHERE idpurchase = $v1
)as b USING(product_type)";
		$dx = $qur->custom_select_query($qurxis);
		$qrxi1 = "UPDATE purchase_details SET purchase_discount_f_ammount = ".$dx[1][2]." , purchase_discount_p_ammount = ".$dx[0][2]." WHERE idpurchase = $v1";
		$qrxi2 = "UPDATE purchase SET purchase_ammount = ".($dx[0][1] + $dx[1][1] + (post('purchase_trns')*$purchase_dollar_rate) - $dx[0][2] - $dx[1][2] ).", purchase_status = ".$status." WHERE idpurchase = $v1";
		if($flag){
			$flag = $qur->execute($qrxi1);
		}
		if($flag){
			$flag = $qur->execute($qrxi2);
		}

	}

    $pay = $total;
	
	if( $flag && req('v4')!="" ){                	
		//$p4 = (req('v4') != "" ? req('v4') : "PCODE-".$v1);
		$p4 = req('v4');
		
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
        $link[$li++]['type'] = 'inactive page-loader box-entry link0212 btn btn-info';

/*---------------------------------------------------------------------------------------*/
/*  নতুন লিংকের নাম, এডিশনাল ডাটা ও পেজ নাম্বার দেওয়া শেষ হয়েছে */
/*---------------------------------------------------------------------------------------*/


    }
    else{
		
        $qur->con->rollback(); 
        $smsg = $qur->custom_select_query("SELECT @software_error");
        $ret_msg = $ret_msg.$smsg[0][0];
    }
	
    unset($query);
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
    die();
?>
