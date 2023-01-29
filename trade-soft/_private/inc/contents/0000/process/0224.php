<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? " তারিখ " : "Date");
	$label_3 =  ($lang == 1 ? " প্রদানকারীর নাম " : "Lender Name"); 
    $label_4 =  ($lang == 1 ? " পরিশোধের পরিমাণ " : "Paid Amount");
	$label_5 =  ($lang == 1 ? " গ্রহণের পরিমাণ " : "Received Amount");

	$label_7 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
	$report = ($lang ?  "লোনের তথ্য" : " Loan statement" );
	
	$d1 = req('d1');
	$d2 = req('d2');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	if($c1>0){
	$ob = $qur->custom_select_query("SELECT __find_lender_ob($c1,'".$d2."')");




	$details = $qur->custom_select_query("SELECT * FROM (
SELECT idtransaction,transaction_date,transaction_ammount as rec, 0 as paid FROM (
SELECT idtransaction FROM transaction_loan t LEFT JOIN loan USING(idloan) WHERE idlender = $c1
) as a LEFT JOIN `transaction` USING(idtransaction) WHERE transaction_status = 1 AND transaction_ammount > 0 AND transaction_date BETWEEN '".$d2."' AND '".$d1."'
UNION

SELECT idtransaction,transaction_date,0 as rec, -transaction_ammount as paid FROM (
SELECT idtransaction FROM transaction_loan t LEFT JOIN loan USING(idloan) WHERE idlender = $c1
) as a LEFT JOIN `transaction` USING(idtransaction) WHERE transaction_status = 1 AND transaction_ammount < 0 AND transaction_date BETWEEN '".$d2."' AND '".$d1."'
) as a ORDER BY transaction_date, rec, paid;");

	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
						<th>Sl</th>
						<th>Date</th>
						<th>Recived</th>
						<th>Paid</th>
						<th>Balance</th>
						<th>Action</th>
					  
					</tr>
					</thead>

					<tbody>
						<tr>
							<td colspan = '2'>Opening Balance : </td>
						<?
							$b = $ob[0][0];
							if($ob[0][0]>0){
								echo "<td>".two_dec($b)."</td>";
								echo "<td>".two_dec(0)."</td>";
								echo "<td>".two_dec($b)."</td>";
								echo "<td></td>";
							}
							else{
								echo "<td>".two_dec(0)."</td>";
								echo "<td>".two_dec(-$b)."</td>";
								echo "<td>".two_dec($b)."</td>";
								echo "<td></td>";
							}
						?>
							
						</tr>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
				<?
				echo "<td>".($i+1)."</td>";
				echo "<td>".dateconvert($details[$i][1])."</td>";
				echo "<td>".two_dec($details[$i][2])."</td>";
				echo "<td>".two_dec($details[$i][3])."</td>";
				$b = $b + $details[$i][2]-$details[$i][3];
				echo "<td>".two_dec($b)."</td>";
				?>
					  <td  class = 'action'>
						  <button type ='button' class='btn btn-info inactive page-loader box-entry link0153' data="&id=<? echo $details[$i][0];?>" >Show</button>
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
							  <td class='action'> </td>
						</tr>
				      </tfoot>
				</table>
				<br/>
				
				
				<div class="form-group">
						<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo ($lang == 1 ? 'প্রত্তেক পৃষ্ঠার প্রিন্ট ': 'Print Report. Per Page ' );?></span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

						</div>
			</div>
				<br/>
                                        	
			
			<?php include('rf.php'); ?>


<? } else{ echo "<h5>Please select lender</h5>"; } ?>
