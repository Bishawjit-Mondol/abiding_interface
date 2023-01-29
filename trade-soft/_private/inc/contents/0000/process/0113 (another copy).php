<?php 
	
	$label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "তারিখ" : "Date");  
	$label_6 =  ($lang == 1 ? "অ্যাকাউন্ট" : "Account "); 
    $label_3 =  ($lang == 1 ? "বিস্তারিত " : "Details"); 
    $label_4 =  ($lang == 1 ? "পাওয়া গেছে " : "Received");
	$label_7 =  ($lang == 1 ? "দেওয়া হয়েছে " : "Paid ");
	$label_8 =  ($lang == 1 ? "ব্যালেন্স" : "Balance ");
	$label_5 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
	$report = ($lang ?  " একাউন্ট লেজার " : " A/C Ledger");
	$bl_figure = false;

	$d1 = req('d1');
	$d2 = req('d2');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$c2 = req('c2') > 0 ?  req('c2') : 0 ;

	if($c1 > 0 && $c2 == 0){
		$bl_figure = true;

	}	
	$det_ob = $qur->custom_select_query("SELECT ___find_mestablishment_opening_balance(  $c1 , '".$d2."' )");
	//echo "SELECT ___find_mestablishment_opening_balance(  $c1 , '".$d2."' )";
	$opening_bl = $det_ob[0][0];
	if($c2>0){
		$opening_bl = 0;
	}
	
	$total = $opening_bl;

	$details = $qur->custom_select_query("CALL ___show_cash_bank_statement( $c1 , $c2 , '".$d2."','".$d1."')");
	//echo "CALL ___show_cash_bank_statement( $c1 , $c2 , '".$d2."','".$d1."')";
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?php echo $label_1;?></th>
					  <th width='160'><?php echo $label_2;?></th>
					  <th><?php echo $label_6;?></th>
					  <th><?php echo $label_3;?></th>
					  <th><?php echo $label_7;?></th>
					  <th><?php  echo $label_4;  ?></th>
					  
					  <th><?php  if($bl_figure){ echo $label_8; } ?></th>
				      <th width='150' class = 'action'><?php echo $label_5;?></th>
					</tr>
					</thead>
					<tbody>
					
			<?php if($bl_figure){    ?>
					<tr>
						<td colspan='6'><?php echo($lang == 1 ? " শুরুতে ব্যালেন্স " : "B/F");?></td>
						<td colspan='2'><?php  echo $inp->cb(two_dec($opening_bl)); ?></td>
						<td></td>
						<td></td>
					</tr>
			<?php   } ?>
			
	<?php for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?php echo $inp->cb($i+1);?></td>
					  <td><?php echo dateconvert($details[$i][1]);?></td>
					  <td><?php echo $details[$i][2];?></td>
					  <td><?php echo $details[$i][3]." :  ".$details[$i][4];?></td>
					  <td><?php echo $inp->cb(two_dec($details[$i][6]));  //  Paid
							$total -= $details[$i][6]; ?>
					  </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][5])); //  Received
							$total += $details[$i][5]; ?>
					  </td>

					  <td><?php if($c2==0){ echo $inp->cb(two_dec($total)); } ?></td>  <!--Balance -->

					  <td  class = 'action'>
							
						<button type ='button' class='btn btn-info inactive page-loader box-entry link0153' data="&id=<? echo  $details[$i][0];?>" >Show</button>
						<? if( $details[$i][7]!=7 && $usertype==1 ){ ?>
							<button type ='button' class='btn btn-info inactive page-loader box-entry link0700' data="&id=<? echo  $details[$i][0];?>" >Delete</button>
					  	<? } ?>
					  </td>
					 
					</tr>
	<?php } ?>
					<tr>
						<td colspan="6"><?php echo($lang == 1 ? " মোট " : "Total");?></td>
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



