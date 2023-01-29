<?
    $flag = true;
	
	$date = post_date('d1');

	$v0 = $qur->get_new_id('stock_adjustment','idstock_adjustment');
    $v1 = req('v1');
	$v2 = req('v2'); 
	$v3 = req('v3'); 
	

    $error = array();
    $ei = 0;
    $link = array();
    $li = 0;
    $ret_msg = ""; 

    $qur->execute('START TRANSACTION');
    if($flag){  
    $query[0] = 'stock_adjustment';
    $query[1] = 'issii';
    $query[2] = array('idstock_adjustment','stock_adjustment_date','stock_adjustment_comments','iduser','idstaff'); 
    $query[3] = array($v0,$date,$v3,1,1);
                  
        $flag = $qur->insert_query_by_array($query);
    }
	if($v2==1){

		$psi = $qur->get_new_id('stock_product_input','idstock_product_input'); 
		
		$n = 10;

		for($i=0; $i<$n; $i++){
			
			
			$product = post("trn_product_".$i);
			$ammount = post("trn_quantity_".$i);
			
			if( $flag && $ammount > 0 ){		

				$query1[$i][0] = 'stock_product_input';
				$query1[$i][1] = 'isiddiii';
				$query1[$i][2] = array('idstock_product_input', 'stock_product_input_date', 'idproduct', 'stock_product_input_qunatity', 'stock_product_input_price','idpestablishment', 'stock_product_input_type','stock_product_input_status'); 
				$query1[$i][3] = array($psi, $date, $product, $ammount, 0,$v1, 3, 1);

				$query2[$i][0] = 'stock_adjustment_stock_product_input';
				$query2[$i][1] = 'ii';
				$query2[$i][2] = array('idstock_adjustment', 'idstock_product_input'); 
				$query2[$i][3] = array($v0, $psi );

				if($flag){                
				$flag = $qur->insert_query_by_array($query1[$i]);
				}
				if($flag){
				$flag = $qur->insert_query_by_array($query2[$i]);
				}
				
				$psi++;		
			}	
					
		}

    }	
		else
	{

		$pso = $qur->get_new_id('stock_product_output','idstock_product_output'); 
		
		$n = 10;

		for($i=0; $i<$n; $i++){
			
			
			$product = post("trn_product_".$i);
			$ammount = post("trn_quantity_".$i);
			
			if( $flag && $ammount > 0 ){		

				$query1[$i][0] = 'stock_product_output';
				$query1[$i][1] = 'isiddiii';
				$query1[$i][2] = array('idstock_product_output', 'stock_product_output_date', 'idproduct', 'stock_product_output_qunatity', 'stock_product_output_price','idpestablishment', 'stock_product_output_type','stock_product_output_status'); 
				$query1[$i][3] = array($pso,$date,$product, $ammount,0, $v1, 3,1);

				$query2[$i][0] = 'stock_adjustment_stock_product_output';
				$query2[$i][1] = 'ii';
				$query2[$i][2] = array('idstock_adjustment', 'idstock_product_output'); 
				$query2[$i][3] = array($v0, $pso );

				if($flag){                
				$flag = $qur->insert_query_by_array($query1[$i]);
				}
				if($flag){
				$flag = $qur->insert_query_by_array($query2[$i]);
				}
				
				$pso++;		
			}	
					
		}

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
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Failed to do" ); //.''.get_insert_query($query1[0]);
    }
    unset($query);    
    $return_array['result'] = $flag;
    $return_array['return_msg'] = $ret_msg;
    $return_array['return_error'] = $error;
    $return_array['return_link'] = $link;
    echo json_encode($return_array);
?>


