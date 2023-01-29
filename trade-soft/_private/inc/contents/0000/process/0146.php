<?php 


    	$label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "ক্রেতা " : "Client"); 
	$label_3 =  ($lang == 1 ? "গুদাম " : "Godown");   

	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_5 =  ($lang == 1 ? "মূল্যছাড় " : "Discount");   
	$label_6 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s = ($lang?"যোগ করুন":"Add");
	
	$flag = false;
	
	$id =req('id'); 
	$ch_date =req('ch_date');
	$qur->execute("SET @software_ln = $lang");
	
		
		
		$flag = $qur->execute( "UPDATE sales SET sales_status=1 WHERE idsales= $id;" ); 
		if($flag){
			$flag = $qur->execute("UPDATE stock_product_output set stock_product_output_status = 1 WHERE idstock_product_output IN (SELECT idstock_product_output FROM sales_stock_product_output s WHERE idsales = $id)");
		}
		if($flag){
			$flag = $qur->execute("UPDATE sales_details SET sales_details_chalan_date= '".$ch_date."' WHERE idsales= $id;");
		}
		
		if($flag){   ?>
			<script type = 'text/javascript'>
			$(".confirm_sale_<?php echo $id; ?>").hide('slide');
			</script>
    	  <?php   }

	

  	if($flag){
		$qur->execute( "COMMIT" );
		echo ($lang ?   " --- " : "Success :  ");

 	 } else 
		{ $error = $qur->custom_select_query("SELECT @software_error"); 
     			echo ($lang ?   " ব্যর্থ হয়েছে " : "Failed To Do :  ").$error[0][0];
		}
?>



