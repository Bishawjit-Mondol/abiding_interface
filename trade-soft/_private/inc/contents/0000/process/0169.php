<?
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "লেনদেনের খাত " : "Transaction Head"); 
    $label_3 =  ($lang == 1 ? "টাকা" : "Amount ");

	$report = ($lang ?  "খাত অনুসারে খরচ " : "Expense Overhead");
	$d1 = req('d1');
	$d2 = req('d2');

	$details = $qur->custom_select_query("SELECT idtransaction_head, transaction_head_name, SUM(transaction_ammount)
FROM `transaction` LEFT JOIN transaction_head USING(idtransaction_head)
WHERE transaction_ammount<0 AND transaction_status=1 AND transaction_date BETWEEN '$d2' AND '$d1' 
GROUP BY idtransaction_head ORDER BY transaction_head_name;");
	
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			<? echo ($lang ?  dateconvert($d2)." থেকে ".dateconvert($d1)." তারিখের রিপোর্ট" : "Report From ".dateconvert($d2)." To ".dateconvert($d1) );?>
			
			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?=$label_1;?></th>
					  <th><?=$label_2;?></th>
					  <th><?=$label_3;?></th>
					</tr>
					</thead>
					<tbody>
					
	<?php 	$total=0; 
			for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td> 
					  <td><?php echo $details[$i][1]; ?> </td>
					  <td><?php echo $inp->cb(two_dec(-$details[$i][2])); $total += $details[$i][2]; ?> </td>

					</tr>
		<?  } ?>
					  <tr> 
						<th colspan="2">Total</th>
						<th><?php echo $inp->cb(two_dec(-$total)); ?></th>
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



