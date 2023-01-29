<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রয় আই. ডি." : "Sales ID"); 
    $label_3 =  ($lang == 1 ? "তারিখ " : "Date"); 
    $label_5 =  ($lang == 1 ? "ক্রেতা " : "Client"); 
    
    $label_4 =  ($lang == 1 ? "থেকে" : "From");
    $label_3a =  ($lang == 1 ? "চালান তারিখ " : "Chalan Date"); 

    $label_6 =  ($lang == 1 ? "মূল্য" : "Amount");
	$label_7 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
	$report = ($lang ?  "নতুন পন্য বিক্রয়ের অর্ডার" : "Order Receive");
	$d1 = req('d1');
	$d2 = req('d2');
	$bl_date = req('bl_date');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$c2 = req('c2') > 0 ?  req('c2') : 0;
	
	
	$type = req('cat_id');
	if($type == 1){
		$details = $qur->custom_select_query("CALL ___show_ppr_sales_chalan($c1,  $c2, '".$d2."','".$d1."')");
	}
	else if($type == 2){
		
		$details = $qur->custom_select_query("CALL ___show_upvc_sales_chalan($c1, $c2, '".$d2."','".$d1."')");
	}
	
	else{
		$details = $qur->custom_select_query("CALL ___show_sales_chalan($c1, $c2, '".$d2."','".$d1."')");
	}
	
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?=$label_1;?></th>
					  <th><?=$label_2;?></th>
					  <th><?=$label_3;?></th>
					  <th><?=$label_3a;?></th>
					  <th><?=$label_5;?></th>
					  
					  <th><?=$label_6;?></th>
					  <th class = 'action'><?=$label_7;?></th>
					</tr>
					</thead>
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$inp->cb($details[$i][0]);?></td>
					  <td><?=dateconvert($details[$i][1]);?></td>
					  <td><?=dateconvert($details[$i][5]);?></td>
					  <td><?=$details[$i][3];?></td>
					  <td class = 'sum'><?=$inp->cb(two_dec($details[$i][4]));?></td>
					  <td  class = 'action'>
							<button type ='button'  class='inactive page-loader box-entry link0307 btn btn-info confirm_bill_<?php echo $details[$i][0];?>' data = "&id=<?php echo $details[$i][0];?>&bl_date=<?php echo $bl_date;?>&ln=<?php echo $lang; ?>&rtype=1"><? echo ($lang? 'বিল নিশ্চিত করুন' :' Bill');?></button>
<button type="button" class="inactive page-loader box-entry link0211 btn btn-info " data="&amp;id=<?php echo $details[$i][0];?>&amp;ln=0&amp;rtype=2">Chalan</button>

							<button type ='button'  class='inactive page-loader box-entry link0306 btn btn-info ' data =  "&id=<?php echo $details[$i][0]; ?>&ln=<?php echo $lang; ?>&rtype=2"><? echo ($lang? ' দেখুন' :' Show');?></button>
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
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : "Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

						</div>
				</div>
				<br/>
                                        	
			
			<?php include('rf.php'); ?>



