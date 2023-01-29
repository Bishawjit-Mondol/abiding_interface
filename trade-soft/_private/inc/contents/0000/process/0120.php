<?php 
	
	$label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "তারিখ " : "Date"); 
	$label_6 =  ($lang == 1 ? " নগদ " : "Cash "); 
    $label_3 =  ($lang == 1 ? " বর্ণনা " : "Details"); 
    $label_4 =  ($lang == 1 ? " পাওনা " : "Receivable ");
	$label_7 =  ($lang == 1 ? " দেনা " : "Payable ");
	$label_8 =  ($lang == 1 ? " ব্যালেন্স " : "Balance ");
	$label_5 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
	$report = ($lang ?  " দেখুন" : " Show");
		
	$d1 = req('d1');
	$d2 = req('d2');
	//$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$total = 0.00;
	$details = $qur->custom_select_query("CALL ___show_pro_cash_statement( 0,'".$d2."','".$d1."')");
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?php echo $label_1;?></th>
					  <th><?php echo $label_2;?></th>
					  <th><?php echo $label_6;?></th>
					  <th><?php echo $label_3;?></th>
					  <th><?php echo $label_4;?></th>
					  <th><?php echo $label_7;?></th>
					  <th><?php echo $label_8;?></th>
					  <th class = 'action'><?php echo $label_5;?></th>
					</tr>
					</thead>
					<tbody>
					
	<?php for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?php echo $inp->cb($i+1);?></td>
					  <td><?php echo dateconvert($details[$i][1]);?></td>
					  <td><?php echo $details[$i][2];?></td>
					  <td><?php echo $details[$i][3]." :  ".$details[$i][4];?></td>
					  <td><?php echo $inp->cb(two_dec($details[$i][5])); //  Received
							$total += $details[$i][5]; ?>
					  </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][6]));  //  Paid
							$total -= $details[$i][6]; ?>
					  </td>
					  <td><?php echo $inp->cb(two_dec($total)); ?></td>  <!--Balance -->
					  <td  class = 'action'>
							<button type ='button'  class='inactive page-loader box-entry link0124 btn btn-info confirm_trn_<?php echo $details[$i][0];?>' data =  "&id=<?php echo $details[$i][0]; ?>&ln=<?php echo $lang; ?>" ><?php echo ($lang == 1 ? " নিশ্চিত করুন " : " Confirm");?></button> 
					  </td>

					</tr>
	<?php } ?>
					<tr>
						<td colspan="6"><?php ($lang ?  " মোট " : "Total");?></td>
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
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i> <?php echo ($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : " Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

						</div>
				</div>
				<br/>
                                        	
			
			<?php include('rf.php'); ?>



