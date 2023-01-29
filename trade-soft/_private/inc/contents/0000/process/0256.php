<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "আই. ডি." : "Employee ID"); 
    $label_3 =  ($lang == 1 ? "কর্মচারী/কর্মকর্তা" : "Employee Name");
    $label_4 =  ($lang == 1 ? "দেনা" : "Payable");
    $label_5 =  ($lang == 1 ? "পাওনা" : "Receivable");
    $report = ($lang ?  " কর্মচারী ব্যালেন্স " : " Employee balance");
    
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$pay = 0.00;
	$rec = 0.00;
	
	if($c1>0){
	$details = $qur->custom_select_query("SELECT idstaff,concat(staff_name,' : ', post_name), staff_balance FROM staff left join post using(idpost) where idstaff=$c1;");
	}else{
	$details = $qur->custom_select_query("SELECT idstaff,concat(staff_name,' : ', post_name), staff_balance FROM staff left join post using(idpost);");
	}
	$n = count($details);
?>
			<?php include('rh_without_date.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				    <thead>
					<tr>
					  <th><?=$label_1;?></th>
					  <th><?=$label_2;?></th>
					  <th><?=$label_3;?></th>
					  <th><?=$label_4;?></th>
					  <th><?=$label_5;?></th>
					 
					</tr>
					</thead>
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$inp->cb($details[$i][0]);?></td>
					  <td><?=$details[$i][1];?></td>
					  <td class="tdcell-ra-p"><? if($details[$i][2]>0){ echo $inp->cb(two_dec($details[$i][2])); $pay += $details[$i][2];}else{echo $inp->cb(two_dec(0));} ?></td>
					  <td class="tdcell-ra-p"><? if($details[$i][2]<0){ echo $inp->cb(two_dec(-$details[$i][2])); $rec += $details[$i][2];}else{echo $inp->cb(two_dec(0));} ?></td>
					  
					</tr>
	<? } ?>
					<tr>
						<th colspan="3">Total</th>
						<th class="tdcell-ra-p"><?php echo $inp->cb(two_dec($pay)); ?></th>
						<th class="tdcell-ra-p"><?php echo $inp->cb(two_dec(-$rec)); ?></th>		
					</tr>
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
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo ($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : "Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

						</div>
				</div>
				<br/>
                                        	
			
			<?php include('rf.php'); ?>



