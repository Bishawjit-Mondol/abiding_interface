<?php 
	
	$label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রয় আই. ডি." : "Date"); 
	$label_6 =  ($lang == 1 ? "তারিখ " : "Account "); 
    $label_3 =  ($lang == 1 ? "তারিখ " : "Details"); 
    $label_4 =  ($lang == 1 ? "মূল্য" : " Amount ");
	$label_5 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
	$label_7 =  ($lang == 1 ? "পদক্ষেপ " : "Cheque Matured Date");
	$report = ($lang ?  " আগাম চেক " : "Advance cheque");
		
	$d1 = req('d1');
	$d2 = req('d2');
	//$opening_bl = 0.00; 
	$total = 0.00;
	$details = $qur->custom_select_query("SELECT idtransaction, transaction_date, ___find_me_name(idmestablishment), ___find_transaction_head(idtransaction), ___find_transaction_with(idtransaction), transaction_ammount,transaction_cheque, transaction_cheque_date
    FROM `transaction` LEFT JOIN mestablishment USING(idmestablishment)
    LEFT JOIN transaction_details USING(idtransaction) WHERE transaction_status=0 AND transaction_type=2;");
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?php echo $label_1;?></th>
					  <th width='125'><?php echo $label_2;?></th>
					  <th><?php echo $label_6;?></th>
					  <th><?php echo $label_3;?></th>
					  <th><?php echo $label_7;?></th>
					  <th><?php echo $label_4;?></th>
					  <th width='160' class = 'action'><?php echo $label_5;?></th>
					</tr>
					</thead>
					<tbody>
					
					<!--<tr>
						<td colspan='4'>Opening Balance </td>
						<td colspan='2'><?php echo $inp->cb(two_dec($opening_bl)); ?></td>
						<td></td>
					</tr> -->
	<?php for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?php echo $inp->cb($i+1);?></td>
					  <td><?php echo dateconvert($details[$i][1]);?></td>
					  <td><?php echo $details[$i][2];?></td>
					  <td><?php echo $details[$i][3]." :   [".$details[$i][6]."]  ".$details[$i][4];?></td>
					  <td><?php echo dateconvert($details[$i][7]);?></td>
					  <td><?php echo $inp->cb(two_dec($details[$i][5]));
							$total += $details[$i][5]; ?>
					  </td>
					  <td  class = 'action'>
							<button type ='button'  class='inactive page-loader box-entry link0137 btn btn-info confirm__<?php echo $details[$i][0];?>' data =  "&id=<?php echo $details[$i][0]; ?>&ln=<?php echo $lang; ?>" ><?php echo ($lang ? " নিশ্চিত করুন " : " Confirm");?></button>
							<button type ='button'  class='inactive page-loader box-entry link0163 btn btn-info confirm__<?php echo $details[$i][0];?>' data =  "&id=<?php echo $details[$i][0]; ?>&ln=<?php echo $lang; ?>" ><?php echo ($lang ?  "মুছে ফেলুন" : "Delete");?></button>
							
					 </td>

					</tr>
	<?php } ?>
					<tr>
						<td colspan="5"> Total :</td>
						<td colspan="2"><?php echo $inp->cb(two_dec($total)); ?></td>
					</tr>
				      </tbody>
				      <tfoot>
						<tr>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td  class = 'action'>
							 </td>
									
						</tr>
				      </tfoot>
				</table>
				<br/>
				<div class="form-group">
						<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo ($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : "Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

						</div>
				</div>
				<br/>
                                        	
			
			<?php include('rf.php'); ?>



