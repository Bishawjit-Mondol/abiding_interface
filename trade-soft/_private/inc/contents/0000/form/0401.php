<?
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "তারিখ " : "Date"); 
    $label_3 =  ($lang == 1 ? "বিস্তারিত" : "Description ");
	$label_4 =  ($lang == 1 ? "আই ডি " : "ID");
    $label_5 =  ($lang == 1 ? "বিক্রয়" : "Sales");
    $label_6 =  ($lang == 1 ? "গ্রহন " : "Received");
    $label_7 =  ($lang == 1 ? "বিক্রয় ফেরত" : "Sales Return");
	$label_8 =  ($lang == 1 ? "ব্যালেন্স " : "Balance");

	$v1 = req('id') > 0 ?  req('id') : 0;
	$d1 = '3000-01-01';
	$d2 = '1970-01-01';

	$com_name = $qur->custom_select_query("SELECT ___find_company_name($v1);");

	$report = ($lang ?  $com_name[0][0]." এর খতিয়ান" : "Sales Ledger of ".$com_name[0][0] );
	
	$det_ob = $qur->custom_select_query("SELECT ___find_previous_sales_balance($v1, '$d2');");
	$bl = $det_ob[0][0];

	$details = $qur->custom_select_query(" SELECT * FROM (
  SELECT sales_date `date`, CONCAT(product_catagory_name,' Sales') description, idsales id,  sales_ammount s_amount, 0 tran, 0 sr_amount
  FROM sales LEFT JOIN sales_details USING(idsales) LEFT JOIN (SELECT * FROM product_catagory WHERE idproduct_catagory_parent IS NULL)as a USING(idproduct_catagory)
  WHERE sales_status=2 AND sales_ispurchase_return=0 AND idcompany=$v1 AND sales_date BETWEEN '$d2' AND '$d1'

  UNION

  SELECT transaction_date `date`, CONCAT(if(transaction_type=1,'Cash ','Cheque '),if(transaction_ammount>0,'Received','Payment')) description, idtransaction id, 0 s_amount, transaction_ammount tran, 0 sr_amount
  FROM transaction_company LEFT JOIN `transaction` USING(idtransaction)
  WHERE (idtransaction_head=14 OR idtransaction_head=15 ) AND transaction_status=1 AND idcompany=$v1 AND transaction_date BETWEEN '$d2' AND '$d1'

  UNION

  SELECT transaction_date `date`, CONCAT(if(transaction_type=1,'Cash ','Cheque '),if(transaction_ammount>0,'Received','Payment')) description, idtransaction id, 0 s_amount, 0 as tran, transaction_ammount as sr_amount
  FROM transaction_company LEFT JOIN `transaction` USING(idtransaction)
  WHERE (idtransaction_head=86) AND transaction_status=1 AND idcompany=$v1 AND transaction_date BETWEEN '$d2' AND '$d1'

  UNION

  SELECT purchase_date `date`, CONCAT(product_catagory_name,' Sales Return') description, idpurchase, 0 s_amount, 0 tran, purchase_ammount sr_amount  FROM purchase
  LEFT JOIN purchase_details USING(idpurchase) LEFT JOIN (SELECT * FROM product_catagory WHERE idproduct_catagory_parent IS NULL)as a USING(idproduct_catagory)
  WHERE purchase_status=1 AND purchase_issales_return=1 AND idcompany=$v1 AND purchase_date BETWEEN '$d2' AND '$d1'
 )as b ORDER BY `date`;");

	
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">
			  <h4><? echo $report; ?></h4>
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
						<td><?=$inp->cb(two_dec($bl));?></td>			
					  </tr>
					
	<?php	$sales=0; $sales_rt=0; $receive=0; $total=$bl; 
			for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td> 
					  <td><?php echo dateconvert($details[$i][0]); ?> </td>
					  <td><?php echo $details[$i][1]; ?> </td>
					  <td><?php echo $details[$i][2]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][3])); $sales += $details[$i][3]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][4])); $receive += $details[$i][4]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][5])); $sales_rt += $details[$i][5]; ?> </td>
					  <td><?php 
							    $total += ($details[$i][3] - $details[$i][4] - $details[$i][5]);
								echo $inp->cb(two_dec($total)); 
							?> 
					  </td>
					  

					</tr>
		<?  } ?>
					  <tr> 
						<th colspan="4">Total</th>
						<th><?php echo $inp->cb(two_dec($sales)); ?></th>
						<th><?php echo $inp->cb(two_dec($receive)); ?></th>
						<th><?php echo $inp->cb(two_dec($sales_rt)); ?></th>
						<th><?php echo $inp->cb(two_dec($total)); ?></th>
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



