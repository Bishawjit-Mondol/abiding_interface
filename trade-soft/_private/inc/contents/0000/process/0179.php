<?
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "বিস্তারিত" : "Description ");
	$label_3 =  ($lang == 1 ? "টাকা " : "Amount"); 
	$label_4 =  ($lang == 1 ? "ব্যালেন্স " : "Balance");
	
	$report = ($lang ?  "মোট ক্রয় তথ্য" : "Total Purchase Statement");
	$d1 = req('d1');
	$d2 = req('d2');

	$purchase = $qur->custom_select_query("SELECT 'Purchase' description, SUM(purchase_ammount) amount
	FROM purchase LEFT JOIN purchase_details USING(idpurchase)
	WHERE purchase_status=1 AND purchase_issales_return=0 AND purchase_date BETWEEN '$d2' AND '$d1';");
	
	$purchase_rt = $qur->custom_select_query("SELECT 'Purchase Return' description, SUM(sales_ammount) amount
	FROM sales LEFT JOIN sales_details USING(idsales)
	WHERE sales_status=2 AND sales_ispurchase_return=1 AND sales_date BETWEEN '$d2' AND '$d1';");
  
	$tran = $qur->custom_select_query("SELECT 'Total Payment' description, SUM(transaction_ammount) amount
	FROM transaction_company LEFT JOIN `transaction` USING(idtransaction)
	WHERE (idtransaction_head=13 OR idtransaction_head=16) AND transaction_status=1 AND transaction_date BETWEEN '$d2' AND '$d1';");
	
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
					  
					</tr>
					</thead>
					<tbody>
					
	<?php	$pur=0; $pur_rt=0; $tran_amount=0; ?>
					<tr>
					  <td><?=$inp->cb(1);?></td> 
					  <td><?php echo $purchase[0][0]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($purchase[0][1])); ?> </td>
					</tr>
					<tr>
					  <td><?=$inp->cb(2);?></td> 
					  <td><?php echo $purchase_rt[0][0]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($purchase_rt[0][1])); ?> </td>
					</tr>
					<tr>
					  <td><?=$inp->cb(3);?></td> 
					  <td><?php echo "Net Purchase" ?> </td>
					  <td><?php echo $inp->cb(two_dec($purchase[0][1]-$purchase_rt[0][1])); ?> </td>
					</tr>
					<tr>
					  <td><?=$inp->cb(4);?></td> 
					  <td><?php echo $tran[0][0]; ?> </td>
					  <td><?php echo $inp->cb(two_dec( -$tran[0][1] )); ?> </td>
					</tr>
					
					<tr> 
						<th colspan="2">Balance</th>
						<th><?php echo $inp->cb(two_dec(-(-($purchase[0][1]-$purchase_rt[0][1]+$tran[0][1])) )); ?> </th>
					</tr>
					
				    </tbody>
					
				    <tfoot>
						<tr>
							  <td colspan='3'></td>
									
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



