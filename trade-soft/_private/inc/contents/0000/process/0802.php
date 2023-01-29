<?

    $label_1 =  ($lang == 1 ? " ক্রম " : "SL"); 

    $label_3 =  ($lang == 1 ? " পণ্যের নাম " : "Product Name"); 
    $label_4 =  ($lang == 1 ? " পরিমাণ" : " Quantity");    
    $label_5 =  ($lang == 1 ? " এম.আর.পি " : "MRP");
    $label_6 =  ($lang == 1 ? " এম.পি.পি " : "MPP");
    $label_7 =  ($lang == 1 ? " মোট  এম.আর.পি " : "Total MRP");
    $report =   req('cat_name').($lang == 1  ? " মজুদ" : " Stock");

	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$c2 = req('c2')> 0 ?  req('c2') : 0;
	$cat = req('cat_id');
	$tmrp = 0;

	if($cat == '1'){
		//echo "CALL ___show_all_ppr_stock_book($c1 , $c2)";
		$details = $qur->custom_select_query("CALL ___show_all_ppr_stock_book($c1 , $c2)");
	}
	else if($cat == '2'){
		//echo "CALL ___show_all_upvc_stock_book($c1 , $c2)";
		$details = $qur->custom_select_query("CALL ___show_all_upvc_stock_book($c1 , $c2)");
	}
	else if($cat == "" ){
		//echo "CALL ___show_all_stock_book($c1 , $c2)";
		$details = $qur->custom_select_query("CALL ___show_all_stock_book($c1 , $c2)");
	}

	$n = count($details);

	
?>
	 <fieldset>	
		<div class="panel-body">
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?=$label_1;?></th>

					  <th><?=$label_3;?></th>
					  <th class="tdcell-ra"><?=$label_4;?></th>
					  <th class="tdcell-ra"><?=$label_5;?></th>					  
					  <th class="tdcell-ra"><?=$label_6;?></th>
					  <th class="tdcell-ra"><?=$label_7;?></th>
					</tr>
					</thead>
					<tbody>
			<? for($i=0; $i<$n;$i++){ ?> 
					<tr class = ' stock-product-list red-row' >
					  <td><?=$inp->cb($i+1);?></td>

					  <td><?=$details[$i][1];?></td>
					  <td class="tdcell-ra"><?=$details[$i][2];?></td>
					  <td class="tdcell-ra"><?=$inp->cb(two_dec($details[$i][3]));?></td>
					  <td class="tdcell-ra"><?=$inp->cb(two_dec($details[$i][4]));?></td>
					  <td class="tdcell-ra"><?=$inp->cb(two_dec($details[$i][2]*$details[$i][3])); $tmrp += $details[$i][2]*$details[$i][3];?></td>
					</tr>
			<? } ?>
					<tr class = 'red-row'>
						<th colspan="5 tdcell-ra">Total</th>
						<th class="tdcell-ra-p" style="text-align:right"><?php echo $inp->cb(two_dec($tmrp)); ?></th>		
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
						</tr>
				      </tfoot>
				</table>
			</div>
		</div>
	 </fieldset>
			
				<div class="form-group">
					<div class = 'col-lg-6'>
						<div class="input-group margin-bottom-sm">
							<span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : "Print Report. Per Page :");?> </span>
							<input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
						</div>                  
					</div>  
				</div>
			
			<?php include('rf.php'); ?>



