<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রেতা " : "Supplier"); 
    $label_3 =  ($lang == 1 ? " দিতে হবে" : "Payable");
    $label_4 =  ($lang == 1 ? " পাবে" : "Receivable");
    $label_5 =  ($lang == 1 ? " ঠিকানা" : "Address");
    $report = ($lang ?  " সরবরাহকারীর ব্যালেন্স " : "Supplier balance");

	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	//$c2 = req('c2')> 0 ?  req('c2') : 0;
	
	if($c1>0){
	$details = $qur->custom_select_query("SELECT idcompany,  ___find_company_name($c1) as supplier_name , company_balance , company_address FROM company  where company_type = 2 AND idcompany = $c1 ;");
	}else{
	$details = $qur->custom_select_query("SELECT idcompany, company_name as supplier_name , company_balance , company_address FROM company  where company_type = 2 order by company_name asc ;");

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
					  <th><?=$label_5;?></th>
					  <th><?=$label_3;?></th>
					  <th><?=$label_4;?></th>
					 
					</tr>
					</thead>
					<tbody>
				<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$details[$i][1];?></td>
					  <td><?=$details[$i][3];?></td>
					  <td class="tdcell-ra-p"><?php if($details[$i][2]<0){ echo $inp->cb(two_dec(-$details[$i][2])); $pay += $details[$i][2];}else{ echo $inp->cb(two_dec(0)) ;}?></td>
					  <td class="tdcell-ra-p"><?php if($details[$i][2]>0){ echo $inp->cb(two_dec($details[$i][2])); $rec += $details[$i][2];}else{ echo $inp->cb(two_dec(0)) ;}?></td>
					  
					</tr>
				<? } ?>
					<tr>
						<th colspan="3">Total</th>
						<th class="tdcell-ra-p"><?php echo $inp->cb(two_dec(-$pay)); ?></th>
						<th class="tdcell-ra-p"><?php echo $inp->cb(two_dec($rec)); ?></th>		
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



