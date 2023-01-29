<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    
    $label_3 =  ($lang == 1 ? "তারিখ " : "Date"); 
    
    
    $label_4 =  ($lang == 1 ? "বর্ণনা" : "Description");
	
     $label_6a =  ($lang == 1 ? " দিতেহবে" : "Payable");
	$label_6b =  ($lang == 1 ? " পাবে " : "Receivable");
	$label_6c =  ($lang == 1 ? "মূল্য" : "Balance");
	$label_7 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
	$report = ($lang ?  "বিক্রেতার খতিয়ান" : "Supplier  Ledger");
	$d1 = req('d1');
	$d2 = req('d2');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	
	$pay = 0.00;
	$rec = 0.00;
	
	$det_ob = $qur->custom_select_query("SELECT ___find_company_opening_balance($c1, '".$d2."');");
	//echo "SELECT ___find_company_opening_balance($c1, '".$d2."');";
	$bl = $det_ob[0][0];
	
	
	$details = $qur->custom_select_query("CALL ___show_client_supplier_ledger($c1,'".$d2."','".$d1."')");
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?=$label_1;?></th>
					  <th><?=$label_3;?></th>
					  <th><?=$label_4;?></th>
					  <th><?=$label_6a;?></th>
					  <th><?=$label_6b;?></th>
					  <th><?=$label_6c;?></th>
					  
					  <!-- <th class = 'action'><?=$label_7;?></th> -->
					</tr>
					</thead>
					<tr>
						<td colspan='5'> Opening Balance  :</td>
						<td><?=$inp->cb(two_dec($bl));?></td>
									
					</tr>
					
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?php echo dateconvert($details[$i][1]); ?> </td>
					  <td>
						<?php 
			
						if($details[$i][4]==1){
							echo ($lang ? 'পণ্য বিক্রয় করা হয়েছিল' : 'Product was sold : ').$details[$i][5];

						}
						elseif($details[$i][4]==2){
							echo ($lang ? 'পন্য ক্রয় করা হয়েছিল' : 'Product was purchased  : ').$details[$i][5];
						}
						elseif($details[$i][4]==3){
							echo ($lang ? 'পন্য ক্রয় করা হয়েছিল' : 'Product was returned  : ').$details[$i][5];
						}
						elseif($details[$i][4]==4){
							echo ($lang ? 'পন্য ক্রয় করা হয়েছিল' : 'Product was purchase returned  : ').$details[$i][5];
						}
						elseif($details[$i][4]==5){
							echo ($lang ? 'টাকা / চেক নেওয়া হয়েছিল' : 'Transaction received  : ').$details[$i][5];

						}
						elseif($details[$i][4]==6){
							echo ($lang ? 'টাকা / চেক দেওয়া হয়েছিল' : 'Transaction paid  : ').$details[$i][5];
						}?>
					  </td>
					  
					  <td class="tdcell-ra-p"><?php echo $inp->cb(two_dec($details[$i][2])); $pay += $details[$i][2]; ?> </td>
					  <td class="tdcell-ra-p"><?php echo $inp->cb(two_dec($details[$i][3])); $rec += $details[$i][3]; ?> </td>
					  <td>  
						<?php $bl = $bl - $details[$i][2] + $details[$i][3];  
							  echo $inp->cb(two_dec($bl)); ?>
					  </td>
					  
					</tr>
	<? } ?>
					<tr>
						<th colspan="3">Total</th>
						<th class="tdcell-ra-p"><?php echo $inp->cb(two_dec($pay)); ?></th>
						<th class="tdcell-ra-p"><?php echo $inp->cb(two_dec($rec)); ?></th>
						<th class="tdcell-ra-p"><?php echo $inp->cb(two_dec($bl)); ?></th>		
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
							  <td></td>
							  <!-- <td  class = 'action'> -->
							 </td>
									
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



