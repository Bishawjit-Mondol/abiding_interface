<?
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "কোম্পানি " : "Company"); 
    $label_3 =  ($lang == 1 ? "বিক্রয়" : "Sales ");
	$label_4 =  ($lang == 1 ? "গ্রহন " : "Received");
    $label_5 =  ($lang == 1 ? "বিক্রয় ফেরত" : "Sales Return");
	$label_6 =  ($lang == 1 ? "ব্যালেন্স " : "Balance");
	
	$report = ($lang ?  "সকল বিক্রয় তথ্য" : "All Sales Statement");
	$d1 = req('d1');
	$d2 = req('d2');

	$details = $qur->custom_select_query("SELECT idcompany, ___find_company_name(idcompany) COMPANY, SUM(s_amount), SUM(tran), SUM(sr_amount), ___find_previous_sales_balance(idcompany, '0000-01-01')
FROM (
  SELECT idcompany, SUM(sales_ammount) s_amount, 0 tran, 0 sr_amount FROM sales
  LEFT JOIN sales_details USING(idsales) WHERE sales_status=2 AND sales_ispurchase_return=0 GROUP BY idcompany
  UNION
  SELECT idcompany, 0 s_amount, 0 tran, SUM(purchase_ammount) sr_amount FROM purchase
  LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_status=1 AND purchase_issales_return=1 GROUP BY idcompany
  UNION
  SELECT idcompany, 0 s_amount, SUM(transaction_ammount) tran, 0 sr_amount
  FROM transaction_company LEFT JOIN `transaction` USING(idtransaction) WHERE (idtransaction_head=14 OR idtransaction_head=15) AND transaction_status=1 GROUP BY idcompany

  )as a GROUP BY idcompany ORDER BY COMPANY;");
	
	$n = count($details);
?>
			<?php include('rh_without_date.php'); ?>
			<div class="bs-example table-responsive ">
			  
			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?=$label_1;?></th>
					  <th><?=$label_2;?></th>
					  <th><?=$label_3;?></th>
					  <th><?=$label_4;?></th>
					  <th><?=$label_5;?></th>
					  <th><?=$label_6;?></th>
					  
					</tr>
					</thead>
					<tbody>
					
	<?php	$sales=0; $sales_rt=0; $receive=0; $total=0; 
			for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td> 
					  <td><?php echo $details[$i][1]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][2]+$details[$i][5])); $sales += ($details[$i][2]+$details[$i][5]); ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][3])); $receive += $details[$i][3]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][4])); $sales_rt += $details[$i][4]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][2]+$details[$i][5] - $details[$i][3] - $details[$i][4])); 
							    $total += ($details[$i][2]+$details[$i][5] - $details[$i][3] - $details[$i][4]);
							?> 
					  </td>
					  

					</tr>
		<?  } ?>
					  <tr> 
						<th colspan="2">Total</th>
						<th><?php echo $inp->cb(two_dec($sales)); ?></th>
						<th><?php echo $inp->cb(two_dec($receive)); ?></th>
						<th><?php echo $inp->cb(two_dec($sales_rt)); ?></th>
						<th><?php echo $inp->cb(two_dec($total)); ?></th>
					  </tr>
					
				    </tbody>
					
				    <tfoot>
						<tr>
							  <td colspan='6'></td>
									
						</tr>
				    </tfoot>
				</table>
				<br/>
				
				
				<div class="form-group">
						<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : "Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>      

						</div>
				</div>
				<br/>
                                        	
			
			<?php include('rf.php'); ?>



