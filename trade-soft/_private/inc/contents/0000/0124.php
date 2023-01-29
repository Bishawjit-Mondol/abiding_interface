<?php
	$id = req('id');
	$flag = $qur->execute( "UPDATE `transaction` SET transaction_status=1 WHERE idtransaction= $id;" );

	if($flag){
		$qur->execute( "COMMIT" );
		$label_0 =  ($lang == 1 ? "ক্রম " : "Sl");
		$label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	
	
		$label_2 =  ($lang == 1 ? "গ্রহীতা " : "Reciver"); 
		$label_3 =  ($lang == 1 ? "লোনদেনের বাবদ " : "Transaction Head");   

		$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
		$label_5 =  ($lang == 1 ? "মূল্যছাড় " : "Discount");   
		$label_6 =  ($lang == 1 ? "মোট" : "Total");   
		$label_17 =  ($lang == 1 ? "বিবরন" : "Details");   

		$label_7 =  ($lang == 1 ? "পদ্ধতি" : "Method");   
		$label_8 =  ($lang == 1 ? "নগদ" : "Cash");   
		$label_9 =  ($lang == 1 ? "চেক" : "Cheque");   


	
	if($id){
		$query = "CALL ___view_transaction($id);";		
		$details = $qur->custom_select_query($query);
		
		$cash_or_bank = $qur->custom_select_query("SELECT transaction_type FROM `transaction` WHERE idtransaction=$id;");

	}
	
	
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><? echo $label_0;?></th>
					  <th><? echo $label_1;?></th>
					  <th><? echo $label_2;?></th>
					  <th><? echo $label_3;?></th>
					  <th><? echo $label_7;?></th>
					 
					  <th><? echo $label_6;?></th>
					</tr>
					</thead>
					<tbody>
	<?php  for($i=0; $i<$n;$i++){ ?> 

				<tr>
					  <td><? echo $inp->cb($i+1);?></td>
					  <td><? echo $details[$i][3];?></td>
					  <td><? echo $details[$i][6];?></td>
					  <td><? echo $details[$i][15];?></td>
					  <td>
						<?php if($cash_or_bank[0][0]==1){
						echo $label_8;
						}
						elseif($cash_or_bank[0][0]==2)
						{ echo $label_9;} ?>
					  </td>
					 
					  <td class = 'sum'><?php echo $inp->cb(two_dec($details[$i][4]));?></td>
					 

					</tr>
	<?php  } ?>
				      </tbody>
				      <tfoot>
						<tr>
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

<script type = 'text/javascript'>
	$(".confirm_trn_<?php echo $id; ?>").hide('slide');
</script>



<?php  } else {  echo ($lang ?  "---" : "Failed To Do"); } ?>
