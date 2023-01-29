<?php 
	
	$label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "তারিখ" : "Date");  
	$label_6 =  ($lang == 1 ? "অ্যাকাউন্ট" : "Account "); 
    $label_3 =  ($lang == 1 ? "বিস্তারিত " : "Details"); 

	$label_8 =  ($lang == 1 ? "ব্যালেন্স" : "Balance ");
	$label_5 =  ($lang == 1 ? "পদক্ষেপ " : "Action");

	$bl_figure = false;
	$f1 = $f2 = 0;
	$d1 = req('d1');
	$d2 = req('d2');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$c2 = req('c2') > 0 ?  req('c2') : 0 ;
	// if cash then 1, if bank then 2
	if($c1>0){
	$cash_det = $qur->custom_select_query("SELECT  mestablishment_type, mestablishment_name FROM mestablishment m WHERE idmestablishment = $c1 LIMIT 1;");
	}
	else{
		$cash_det = array(array(0),array(''));

	}
	
	$cash = $cash_det[0][0];

	$transaction_type = $qur->custom_select_query("SELECT transaction_head_name, transaction_head_type_en FROM (SELECT * FROM transaction_head t WHERE idtransaction_head = $c2) as a LEFT JOIN 	transaction_head_type USING(idtransaction_head_type)");

	
	if($cash == 1){
		if($c2==0){
			$report = ($lang ?  " ক্যেশ বই " : " Cash Book");
		}
		else{
			$report = ($lang ? $transaction_type[0][0]." (" .$transaction_type[0][1] .") From Cash"  : $transaction_type[0][0]." (" .$transaction_type[0][1] .") From Cash");
		}
	}
	else if($cash == 2){
		if($c2==0){
			$report = ($lang ?  " ব্যাংক বই : ".$cash_det[0][1] : " Bank Book : ".$cash_det[0][1]);
		}
		else{
			$report = ($lang ? $transaction_type[0][0]." (" .$transaction_type[0][1] .") : ".$cash_det[0][1]  : $transaction_type[0][0]." (" .$transaction_type[0][1] .") : ".$cash_det[0][1]);

		}
	}
	else if ($c1==0 && $c2>0){
			$report = "All ".($lang ? $transaction_type[0][0]." (" .$transaction_type[0][1] .") Transaction"  : $transaction_type[0][0]." (" .$transaction_type[0][1] .") Transaction");
	}
	else{
				$report = ($lang ?  "A/C Ledger" : "A/C Ledger");
	}
?>
	<script type = 'text/javascript' >
		$("#window-0113-").find("legend:first").html(<?php echo "'".$report."'"; ?>);
	</script>
<?	
	if($cash == 2){
		$label_4 =  ($lang == 1 ? "জমা " : "Deposit ");
		$label_7 =  ($lang == 1 ? "উত্তলোন " : "Withdraw ");
	}
	else{

		$label_4 =  ($lang == 1 ? "পাওয়া গেছে " : "Received");
		$label_7 =  ($lang == 1 ? "দেওয়া হয়েছে " : "Paid ");
	}
?>
<?php
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
	if($c1==2){
		if($c2==0){
			$qx = "SELECT * FROM (
			SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid`, ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE idmestablishment IN   (SELECT * FROM (SELECT idmestablishment FROM mestablishment WHERE mestablishment_type = 3 UNION SELECT 2) as a) AND transaction_status=1 AND transaction_date BETWEEN '".$d2."' AND '".$d1."' AND transaction_ammount > 0
			UNION
			SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE idmestablishment IN   (SELECT * FROM (SELECT idmestablishment FROM mestablishment WHERE mestablishment_type = 3 UNION SELECT 2) as a) AND transaction_status=1 AND transaction_date BETWEEN '".$d2."' AND '".$d1."' AND transaction_ammount < 0
			) as a ORDER BY transaction_date, idtransaction;";
		}
		else{
					$qx = "    SELECT * FROM (
		      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE transaction_status=1 AND idmestablishment  IN   (SELECT * FROM (SELECT idmestablishment FROM mestablishment WHERE mestablishment_type = 3 UNION SELECT 2) as a) AND idtransaction_head = $c2 AND transaction_date BETWEEN  '".$d2."' AND '".$d1."' AND transaction_ammount > 0
		         UNION
		      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE transaction_status=1 AND idmestablishment  IN   (SELECT * FROM (SELECT idmestablishment FROM mestablishment WHERE mestablishment_type = 3 UNION SELECT 2) as a) AND idtransaction_head = $c2 AND transaction_date BETWEEN  '".$d2."' AND '".$d1."' AND transaction_ammount < 0
		    ) as a ORDER BY transaction_date, idtransaction;";
				
		}
		$details = $qur->custom_select_query($qx);
		$other_bl = $qur->custom_select_query("SELECT SUM(___find_mestablishment_opening_balance(  $c1 , '".$d2."' )) FROM mestablishment WHERE mestablishment_type = 3;");
		$opening_bl = $opening_bl + $other_bl[0][0];
	}
	else{
		$details = $qur->custom_select_query("CALL ___show_cash_bank_statement( $c1 , $c2 , '".$d2."','".$d1."')");
	}
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
					  <th><? if($c1==0){ ?><?php echo $label_6;?> <? } ?></th>
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
					  <td><?php if($c1==0){  echo $details[$i][2]; } ?></td>
					  <td><?php echo $details[$i][3]." :  ".$details[$i][4];?></td>
					  <td><?php echo $inp->cb(two_dec($details[$i][6]));  //  Paid
							$total -= $details[$i][6]; $f1 = $f1 + $details[$i][6]; ?>
					  </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][5])); //  Received
							$total += $details[$i][5]; $f2 = $f2 + $details[$i][5]; ?>
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

<? if($bl_figure){ ?>
						<td colspan="6"><?php echo($lang == 1 ? " মোট " : "Total");?></td>
						<td colspan="2"><?php echo $inp->cb(two_dec($total)); ?></td>
<? }else{ ?>
						<td colspan="4"><?php echo($lang == 1 ? " মোট " : "Total");?></td>
						<td colspan="1"><?php echo $inp->cb(two_dec($f1));?></td>
						<td colspan="1"><?php echo $inp->cb(two_dec($f2)); ?></td>


<? } ?>
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



