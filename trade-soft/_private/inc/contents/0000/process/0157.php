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
   $n=150;
   

	
  if(req('submit_type')=='1'){
	  $status = 2;
  }
  if(req('submit_type')=='2'){
	  $status = 0;
  }
 
    $v1 = $qur->get_new_id('sales','idsales');   
    $cat = req('cat_id')?req('cat_id') : 'null';
    $p1 = 0;
    $v2 = req('v2');
    
											
     if($flag){          
		 
		$query1[0] = 'sales';
		$query1[1] = 'iisdii';
		$query1[2] = array( 'idsales' , 'idcompany' , 'sales_date' , 'sales_ammount' , 'idsales_type' , 'sales_status');
			
		$query1[3] = array($v1,  $v2,  req_date('d1'),  0,  post('v4'), 1);

        $flag = $qur->insert_query_by_array($query1); 
        $ret_msg = $ret_msg . " LOOp 14".$qur->queryPrint($query1)."<br/>"; 
        
    }
    $pv1 = $qur->get_new_id('stock_product_output','idstock_product_output');      
    $total = 0;
    $i = 0;
    for($i=0; $i<$n; $i++){
		if(post('sales_product_'.$i)){
			
			$querya[$i][0] = 'stock_product_output';
			$querya[$i][1] = 'isiddiii';
			$querya[$i][2] = array( 'idstock_product_output' , 'stock_product_output_date' , 'idproduct' , 'stock_product_output_qunatity' , 'stock_product_output_price' , 'idpestablishment' , 'stock_product_output_type' , 'stock_product_output_status' ); 
			$querya[$i][3] = array($pv1,  req_date('d1'),  post('sales_product_'.$i),  post('sales_quantity_'.$i),  post('sales_cost_'.$i),  post('v3'),  1,  1 );
			$total = $total + ( post('sales_quantity_'.$i)*post('sales_cost_'.$i));
			if($flag){                
				$flag = $qur->insert_query_by_array($querya[$i]);
			     $ret_msg = $ret_msg . " LOOp 2 $i <br/>".$qur->queryPrint($querya[$i]); 
			}
    
			$queryb[$i][0] = 'sales_stock_product_output';
			$queryb[$i][1] = 'ii';
			$queryb[$i][2] = array( 'idsales' , 'idstock_product_output' ); 
			$queryb[$i][3] = array( $v1 ,  $pv1++ );

			if($flag){                
				$flag = $qur->insert_query_by_array($queryb[$i]);
			    $ret_msg = $ret_msg . " LOOp 3 $i <br/>".$qur->queryPrint($queryb[$i]);
			}				

		}

	}
    
    if($flag){                

			$queryax[0] = 'sales_details';
			$queryax[1] = 'idsiiisididss';
			$queryax[2] = array( "idsales", "sales_discount_f_rate",  "sales_comments", "sales_ispurchase_return", "iduser", "idstaff", "sales_delivery_address", "idproduct_catagory", "sales_transport", "idpestablishment", "sales_discount_p_rate", "sales_gps_a", "sales_gps_b" ); 
			$queryax[3] = array( $v1, post('sales_discount_fitt') , post('sales_comments') , 1 , $idstaff ? $idstaff : 0  , post('sales_by') ,  post('sales_dlv')  ,$cat , post('sales_trns') , post('v3') , post('sales_discount_pipe') , post('loca'), post('locb') );

			
			$flag = $qur->execute($qur->queryPrint($queryax));
			//$flag = true;
			$ret_msg = $ret_msg . " LOOp (44)<br/>".$qur->queryPrint($queryax);     
			if($flag){
				$ret_msg = $ret_msg . "OK 3";     
			}
			else{
				$ret_msg = $ret_msg . "OKFফফ 3";     
			}

    } 
    if($flag){
		$qurxis = "SELECT product_type, cost, (sales_discount_p_rate/100)*cost FROM (
SELECT product_type, cost FROM (
SELECT product_type, cost FROM (
SELECT idproduct, product_type, SUM(stock_product_output_qunatity* stock_product_output_price) as cost FROM sales_stock_product_output  LEFT JOIN stock_product_output USING(idstock_product_output) LEFT JOIN product USING(idproduct) WHERE idsales = $v1 GROUP BY product_type
) as a
UNION
(SELECT 1 , 0)
UNION
(SELECT 2 , 0)
) as a GROUP BY product_type
) as a
LEFT JOIN (
SELECT 1 as product_type, sales_discount_p_rate FROM sales_details WHERE idsales = $v1
UNION
SELECT 2, sales_discount_f_rate FROM sales_details WHERE idsales = $v1
)as b USING(product_type)";
		$dx = $qur->custom_select_query($qurxis);
		$qrxi1 = "UPDATE sales_details SET sales_discount_f_ammount = ".$dx[1][2]." , sales_discount_p_ammount = ".$dx[0][2]." , sales_details_billing_date = '".req_date('d1')."', sales_details_chalan_date = '".req_date('d1')."' WHERE idsales = $v1";
		$qrxi2 = "UPDATE sales SET sales_ammount = ".($dx[0][1] + $dx[1][1] + post('sales_trns') - $dx[0][2] - $dx[1][2]   ).", sales_status =".$status." WHERE idsales = $v1";
		if($flag){
			$flag = $qur->execute($qrxi1);
			$ret_msg = $ret_msg . " OK 30 <br/>".$qrxi1;
		}
		if($flag){
			$flag = $qur->execute($qrxi2);
			$ret_msg = $ret_msg . " OK 31 <br/>".$qrxi2;
		}

	}

    $pay = $total;
    
     
    if($flag){
        $qur->con->commit();
        $ret_msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Successfully Done." );

/*---------------------------------------------------------------------------------------*/
/*  নতুন লিংকের নাম, এডিশনাল ডাটা ও পেজ নাম্বার দেওয়া হচ্ছে */
/*---------------------------------------------------------------------------------------*/


        $link[$li]['label']   = $link_label1 = ($lang ?  "বিল দেখুন" : "Show Bill" );
        $link[$li]['address'] = $addr_exten1 = "&&id=".$v1."&&ln=".req('ln')."&&rtype=2";
        $link[$li++]['type'] = 'inactive page-loader box-entry link0332 btn btn-info';

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
