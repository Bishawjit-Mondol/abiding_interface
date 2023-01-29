<?
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "তারিখ " : "Date"); 
    $label_3 =  ($lang == 1 ? "বিস্তারিত" : "Description ");
	$label_4 =  ($lang == 1 ? "আই ডি " : "ID"); 
    $label_5 =  ($lang == 1 ? "ক্রয়" : "Purchase");
    $label_6 =  ($lang == 1 ? "প্রদান" : "Payment");
    $label_7 =  ($lang == 1 ? "ক্রয় ফেরত" : "Purchase Return");
	$label_8 =  ($lang == 1 ? "ব্যালেন্স " : "Balance");

	$v1 = req('v1') > 0 ?  req('v1') : 0;
	$d1 = req('d1');
	$d2 = req('d2');
	
	$com_name = $qur->custom_select_query("SELECT ___find_company_name($v1);");
	//$report = ($lang ?  "কোম্পানির নাম".$com_name[0][0] : "Company Name ".$com_name[0][0] );
	$report = ($lang ?  $com_name[0][0]." এর খতিয়ান" : "Ledger of ".$com_name[0][0] );
	
	$det_ob = $qur->custom_select_query("SELECT ___find_previous_purchase_balance($v1, '$d2');");
	$bl = $det_ob[0][0]; 

	$details = $qur->custom_select_query("SELECT * FROM (
  SELECT purchase_date `date`, 'Purchase' description, idpurchase id,  purchase_ammount p_amount, 0 tran, 0 pr_amount
  FROM purchase LEFT JOIN purchase_details USING(idpurchase)
  WHERE purchase_status=1 AND purchase_issales_return=0 AND idcompany=$v1 AND purchase_date BETWEEN '$d2' AND '$d1'

  UNION

  SELECT transaction_date `date`, CONCAT(if(transaction_type=1,'Cash ','Cheque '),if(transaction_ammount>0,'Received','Payment')) description, idtransaction id, 0 p_amount, transaction_ammount tran, 0 pr_amount
  FROM transaction_company LEFT JOIN `transaction` USING(idtransaction)
  WHERE (idtransaction_head=13 OR idtransaction_head=16) AND transaction_status=1 AND idcompany=$v1 AND transaction_date BETWEEN '$d2' AND '$d1'

  UNION

  SELECT sales_date `date`, 'Purchase Return' description, idsales, 0 p_amount, 0 tran, sales_ammount pr_amount  FROM sales
  LEFT JOIN sales_details USING(idsales)
  WHERE sales_status=2 AND sales_ispurchase_return=1 AND idcompany=$v1 AND sales_date BETWEEN '$d2' AND '$d1'
 )as b ORDER BY `date`; ");
	
	$n = count($details);
?>
			<?php include('rh.php'); ?>
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
					  <th><?=$label_7;?></th>
					  <th><?=$label_8;?></th>
					  
					</tr>
					</thead>
					<tbody>
					  <tr>
						<td></td>
						<td></td>
						<td colspan='5'> B / F  :</td>
						<td><?=$inp->cb(-two_dec($bl));?></td>			
					  </tr>
					
	<?php	$pur=0; $pur_rt=0; $pay=0; $total=$bl; 
			for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td> 
					  <td><?php echo dateconvert($details[$i][0]); ?> </td>
					  <td><?php echo $details[$i][1]; ?> </td>
					  <td><?php echo $details[$i][2]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][3])); $pur += $details[$i][3]; ?> </td>
					  <td><?php echo $inp->cb(two_dec(-$details[$i][4])); $pay += $details[$i][4]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][5])); $pur_rt += $details[$i][5]; ?> </td>
					  <td><?php 
							    $total += (-$details[$i][3] - $details[$i][4] + $details[$i][5]);
								echo $inp->cb(two_dec(-$total)); 
							?> 
					  </td>
					  

					</tr>
		<?  } ?>
					  <tr> 
						<th colspan="4">Total</th>
						<th><?php echo $inp->cb(two_dec($pur)); ?></th>
						<th><?php echo $inp->cb(two_dec(-$pay)); ?></th>
						<th><?php echo $inp->cb(two_dec($pur_rt)); ?></th>
						<th><?php echo $inp->cb(two_dec(-$total)); ?></th>
					  </tr>
					
				    </tbody>
					
				    <tfoot>
						<tr>
							  <td colspan='8'></td>
									
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



