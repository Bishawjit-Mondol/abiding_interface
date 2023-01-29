<?php 
	
	$label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
	$label_6 =  ($lang == 1 ? "অ্যাকাউন্ট " : "Account "); 
    $label_3 =  ($lang == 1 ? "বিস্তারিত  " : "Details"); 
	$label_8 =  ($lang == 1 ? "ব্যালেন্স" : "Balance ");
	$label_5 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
	$report = ($lang ?  "একাউন্ট ব্যালেন্স" : "A/C Balance");
		
	$d1 = req('d1');
	$d2 = req('d2');
	//$c1 = req('c1') > 0 ?  req('c1') : 0 ;

	$total = 0.00;
	$details = $qur->custom_select_query("SELECT idmestablishment, mestablishment_name, mestablishment_balance, mestablishment_address FROM mestablishment WHERE idmestablishment NOT IN (1,5) ORDER BY mestablishment_type,mestablishment_name ;");
	$n = count($details);
?>
			<?php include('rh_without_date.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?php echo $label_1;?></th>
					  <th><?php echo $label_6;?></th>
					  <th><?php echo $label_3;?></th>
					  <th><?php echo $label_8;?></th>
					 <!-- <th class = 'action'><?php echo $label_5;?></th>
					-->
					</tr>
					</thead>
					<tbody>
					
	<?php for($i=0; $i<$n;$i++){ ?> 
					<tr> 
					  <td><?php echo $inp->cb($i+1);?></td>
					  <td><?php echo $details[$i][1];?></td>
					  <td><?php echo $details[$i][3];?></td>
					  <td><?php echo $inp->cb(two_dec($details[$i][2])); ?></td>  <!--Balance -->
					      <?php $total += $details[$i][2]; ?>	
					 <!-- <td  class = 'action'>
							
						<button type ='button' class='btn btn-info confirm_sal' sal_id = '<?php echo $details[$i][0];?>' >Show</button>
					 </td>
					-->
					</tr>
	<?php } ?>
					<tr>
						<td colspan="3"> Total :</td>
						<td colspan="2"><?php echo $inp->cb(two_dec($total)); ?></td>
					</tr>
				      </tbody>
				      <tfoot>
						<tr>
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
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo ($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : " Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

						</div>
				</div>
				<br/>
                                        	
			
			<?php include('rf.php'); ?>



