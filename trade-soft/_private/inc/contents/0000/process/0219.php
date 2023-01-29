<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রয় আই. ডি." : "Sales return ID"); 
    $label_3 =  ($lang == 1 ? "তারিখ " : "Date"); 
    $label_4 =  ($lang == 1 ? "ক্রেতা " : "Client");     
    $label_5 =  ($lang == 1 ? "শো-রুম " : "Showroom ");
    $label_6 =  ($lang == 1 ? "মূল্য" : "Ammount");
    $label_7 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
    $report = ($lang ?  "নতুন পন্য বিক্রয়ের অর্ডার" : "Order Receive");
	$d1 = req('d1');
	$d2 = req('d2');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$c2 = req('c2')> 0 ?  req('c2') : 0;
	
	
	$details = $qur->custom_select_query("CALL ___show_sales_return_history( $c1, $c2 ,'".$d2."','".$d1."');");
	//echo "CALL ___show_sales_return_history( $c1, $c2 ,'".$d2."','".$d1."');";
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
					  <th><?=$label_4;?></th>
					  <th><?=$label_5;?></th>
					  
					  <th><?=$label_6;?></th>
					  <th class = 'action'><?=$label_7;?></th>
					</tr>
					</thead>
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$details[$i][0];?></td>
					  <td><?=dateconvert($details[$i][1]);?></td>
					  <td><?=$details[$i][2];?></td>
					  <td><?=$details[$i][3];?></td>
					  <td><?=$inp->cb(two_dec($details[$i][4]));?></td>
					  <td  class = 'action'>
							<button type ='button' class='btn btn-info confirm_sal inactive page-loader box-entry link0160 ' data="&id=<? echo $details[$i][0];?>&rtype=2" >Show </button>
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



