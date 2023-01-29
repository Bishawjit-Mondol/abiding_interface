<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
  
	$label_3 =  ($lang == 1 ? "কর্মচারীর নাম" : "Employee name");
    $label_4 =  ($lang == 1 ? "উপস্থিতি সময় " : "Entry time"); 
    $label_5 =  ($lang == 1 ? " বাহির হওয়ার সময় " : "Exit time");

   
	 $d1 = req('d1');
	 $d2 = req('d2');
	 $c1 = req('c1') > 0 ?  req('c1') : 0 ;
	
	$qq = "CALL ___show_employee_attendance( $c1 ,'$d2', '$d1' );";
	$details = $qur->custom_select_query($qq);
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
					  <th><?=$label_5;?></th>
					  
					</tr>
					</thead>
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?php echo $inp->cb($i+1);?></td>
					  <td><?php echo $details[$i][0];?></td>
					  <td><?php echo $details[$i][1];?></td>
					  <td><?php echo $details[$i][2];?></td>
					  
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



