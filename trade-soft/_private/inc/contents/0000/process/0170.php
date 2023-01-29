<?
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "পণ্য " : "Product"); 
    $label_3 =  ($lang == 1 ? "মূল্য  " : "Price");
    $label_4 =  ($lang == 1 ? "পরিমান " : "Quantity");
	$label_5 =  ($lang == 1 ? "মূল্য অনুপাত " : "Price Ratio (%)");
	$label_6 =  ($lang == 1 ? "অন্যান্য খরচ " : "Other Exp");
	$label_7 =  ($lang == 1 ? "ওভারহেড খরচ " : "Overhead Cost");
	$label_8 =  ($lang == 1 ? "প্রকৃত মূল্য " : "Actual Price");
	$label_9 =  ($lang == 1 ? "বিক্রয় মূল্য " : "Sale Price"); 
	$label_10 =  ($lang == 1 ? "ছাড়ের পর " : "After Discount");
	$label_10x =  ($lang == 1 ? "মোট " : "Sub Total");
	
	$label_11 =  ($lang == 1 ? "ওভারহেড হার " : "Overhead Rate (%)");
	$label_12 =  ($lang == 1 ? "পাইপে মূল্যহৃাস " : "Pipe Discount (%)");
	$label_13 =  ($lang == 1 ? "ফিটিংসে মূল্যহৃাস " : "Fitting Discount (%)");
	
	$report = ($lang ?  "আনুমানিক লাভ " : "Profit Estimation");
	
	$v1 = req('v1');

	$pur_cost = $qur->custom_select_query("SELECT purchase_ammount FROM purchase WHERE idpurchase=$v1;");
	$other_exp = $qur->custom_select_query("SELECT SUM(transaction_ammount) FROM
    (SELECT * FROM transaction_other LEFT JOIN transaction_purchase USING(idtransaction) WHERE idpurchase=$v1)as a
     LEFT JOIN `transaction` USING(idtransaction);");
	 
	$details = $qur->custom_select_query("SELECT idproduct, ___find_product_name_except_last(idproduct) ,stock_product_input_price, stock_product_input_qunatity, ___find_product_type(idproduct),product_mrp
  FROM (SELECT idstock_product_input FROM purchase_stock_product_input s WHERE idpurchase = $v1) as a
  LEFT JOIN stock_product_input USING(idstock_product_input) LEFT JOIN product USING(idproduct);");
	
	$n = count($details);
?>
			<?php include('rh_without_date.php'); ?>
			<div class="bs-example table-responsive ">

			<? echo ($lang ?  "মোট ক্রয় মূল্য : ".$pur_cost[0][0] : "Total Purchase Cost : ".$pur_cost[0][0] ).'</br>';?>
			<? echo ($lang ?  "মোট অন্যান্য খরচ : ".-$other_exp[0][0] : "Total Other Expenses : ".-$other_exp[0][0] ).'</br>';?>
			
			  <table class="table table-striped table-hover report-table profit-table">
				       <thead>
					<tr>
					  <th><?=$label_1;?></th>
					  <th><?=$label_2;?></th>
					  <th><?=$label_3;?></th>
					  <th><?=$label_4;?></th>
					  <th><?=$label_5;?></th>
					  <th><?=$label_6;?></th>
					  <th><?=$label_7;?></th>
					  <th><?=$label_8;?></th>
					  <th><?=$label_9;?></th>
					  <th><?=$label_10;?></th>
					  <th hidden >Type</th>
					  <th><?=$label_10x;?></th>
					  
					</tr>
					</thead>
					<tbody>
					
	<?php	 
			for($i=0; $i<$n;$i++){ ?> 
					<tr class='tr-body'>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?php echo $details[$i][1]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][2])); ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][3])); ?> </td>
					  <td><?php $ratio = ($details[$i][2]*$details[$i][3]*100)/$pur_cost[0][0];
								echo $inp->cb(two_dec($ratio));  
						   ?> 
						   <span hidden><?=$ratio; ?></span>
					  </td>
					  <td><?php echo $inp->cb(two_dec(($ratio*(-$other_exp[0][0])/100)/$details[$i][3] ));  ?> </td>
					  <td> </td>
					  <td> </td>
					  <td> <input style='width:80px' type ='text' name ='v4' value='<?=$inp->cb(two_dec($details[$i][5])); ?>' class = 'sale-price' /> </td>
					  <td> </td>
					  <td hidden> <?php echo $details[$i][4]; ?></td>
					  <td> </td>
					  

					</tr>
		<?  } ?>
					<tr>
						<th colspan="10">Total</th>
						<th class="total"></th>		
					</tr> 
					
				    </tbody>
					
				    <tfoot>
						<tr>
							  <td colspan='11'></td>
									
						</tr>
				    </tfoot>
				</table>
				<br/>
				
				<div class="form-group">
				
					<div class = 'col-lg-4'>
						<div class="input-group margin-bottom-sm">
							<span class="input-group-addon"><?php echo $label_11;?> </span>
							<input type = 'text' class = 'form-control overhead' />
						</div>                  
					</div> 
					<div class = 'col-lg-4'>
						<div class="input-group margin-bottom-sm">
							<span class="input-group-addon"><?php echo $label_12;?> </span>
							<input type = 'text' class = 'form-control pipe-rate profit-estimate' />
						</div>                  
					</div>
					<div class = 'col-lg-4'>
						<div class="input-group margin-bottom-sm">
							<span class="input-group-addon"><?php echo $label_13;?> </span>
							<input type = 'text' class = 'form-control fit-rate profit-estimate' />
						</div>                  
					</div>
					
				</div>
				
				
				<br/><br/>
				
				<div class="form-group">
					<div class = 'col-lg-6'>
						<div class="input-group margin-bottom-sm">
							<span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : " Print Report. Per Page :");?> </span>
							<input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
						</div>                  
					</div> 
				</div>
				
			</div>
			<br/>
                                        	
			
			<?php include('rf.php'); ?>



