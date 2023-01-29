<?php

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রয় আই. ডি." : "Date"); 
    $label_3 =  ($lang == 1 ? "তারিখ " : "Account"); 
    $label_4 =  ($lang == 1 ? "ক্রেতা " : "Head");    
    $label_5 =  ($lang == 1 ? "থেকে" : "With");
    $label_6 =  ($lang == 1 ? "মূল্য" : "Received");
	$label_7 =  ($lang == 1 ? "পদক্ষেপ " : "Paid");
	$label_8 =  ($lang == 1 ? "মূল্য" : "Balance");
	$label_9 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
	
	$d1 = req('d1');
	$d2 = req('d2');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$c2 = req('c2')> 0 ?  req('c2') : 0;
	
	$previous_bal = $qur->custom_select_query("SELECT ___find_mestablishment_ob($id,'".$d2."');");
	$details = $qur->custom_select_query("CALL ___show_cash_bank_statement($c1,$c2,'".$d2."','".$d1."')");
	$n = count($details);
?>
			<?php //include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?php echo $label_1;?></th>
					  <th><?php echo $label_2;?></th>
					  <th><?php echo $label_3;?></th>
					  <th><?php echo $label_4;?></th>
					  <th><?php echo $label_5;?></th>
					  <th><?php echo $label_6;?></th>
					  <th><?php echo $label_7;?></th>
					  <th><?php echo $label_8;?></th>
					  <th class = 'action'><?php echo $label_9;?></th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td colspan='4'><?php echo ($lang?"সাবেক":"Previous Balance");?></td>
						<td colspan='4'><?php echo cb( $inp,two_dec($previous_bal[0][0]) ); ?></td>
						<td> </td>
					</tr>
	<?php for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?php echo $inp->cb($i+1);?></td>
					  <td><?php echo dateconvert($details[$i][1]);?></td>
					  <td><?php echo $details[$i][2];?></td>
					  <td><?php echo $details[$i][3];?></td>
					  <td><?php echo $details[$i][4];?></td>
					  <td><?php echo $details[$i][5];?></td>
					  <td><?php echo $details[$i][6];?></td>
					  <td><?php echo 'Balance'; ?></td>
					  <td  class = 'action'>
							<button type ='button' class='btn btn-info confirm_sal' sal_id = '<?php echo $details[$i][0];?>' > Show </button>
					  </td>

					</tr>
	<? } ?>
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
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i> Print Report. Per Page : </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

						</div>
				</div>
				<br/>
                                        	
			
			<?php include('rf.php'); ?>



