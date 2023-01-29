<?php 
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রয় আই. ডি." : "Purchase ID"); 
    $label_3 =  ($lang == 1 ? "তারিখ " : "Date"); 
    $label_4 =  ($lang == 1 ? "সরবরাহকারী " : "Supplier"); 
    $label_5 =  ($lang == 1 ? "শো-রুম " : "Showroom ");
    $label_6 =  ($lang == 1 ? "টাকা" : "Ammount");
    $label_7 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
    $report = ($lang ?  "বিক্রয়ের রিপোর্ট" : "Purchase Report");

	$d1 = req('d1');
	$d2 = req('d2');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$c2 = req('c2')> 0 ?  req('c2') : 0;   

	$sup = $qur->custom_select_query("CALL ___show_purchase_history( $c1, $c2 ,'".$d2."','".$d1."');");
	//echo "CALL ___show_purchase_history( $c1, $c2 ,'".$d2."','".$d1."');";
	$n = count($sup);
?>
		
        <div class="panel-body">
			<legend><?=$page_title;?></legend>

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
					  <th class='action'><?=$label_7;?></th>
					</tr>
					</thead>
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr class = 'report-1-8001-data' >
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$inp->cb($sup[$i][0]);?></td>
					  <td><?=dateconvert($sup[$i][1]);?></td>
					  <td><?=$sup[$i][2];?></td>
					  <td><?=$sup[$i][3];?></td>
					  <td><?=$inp->cb(two_dec($sup[$i][4]));?></td>
					  <td class='action'>
						<button type ='button'  class='inactive page-loader box-entry link0212 btn btn-info ' data =  "&id=<?php echo $sup[$i][0]; ?>&ln=<?php echo $lang; ?>&rtype=2"><?php echo ($lang == 1 ? " দেখুন " : "Show");?></button>
						<? if($usertype==1){  ?>
							<button type ='button'  class='inactive page-loader box-entry link0701 btn btn-info ' data =  "&id=<?php echo $sup[$i][0]; ?>&ln=<?php echo $lang; ?>&rtype=2"><?php echo ($lang == 1 ? " মুছে ফেলুন " : "Delete");?></button>
						<? } ?>
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
							  <td  class = 'action'> </td>
									
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



