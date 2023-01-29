<?
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "কোম্পানি" : "Company Name"); 
    $label_3 =  ($lang == 1 ? "আই. ডি." : "ID"); 
	$label_4 =  ($lang == 1 ? "বিক্রয়" : "Sales ");
	$label_5 =  ($lang == 1 ? "গ্রহন " : "Received");
	$label_6 =  ($lang == 1 ? "বিক্রয় ফেরত" : "Sales Return");
    $label_7 =  ($lang == 1 ? "বর্তমান ব্যালেন্স" : "Current Balance");
	$label_8 =  ($lang == 1 ? "পূর্বের ব্যালেন্স " : "Previous Balance");
    $label_9 =  ($lang == 1 ? "ব্যালেন্স " : "Balance");
	
	$d1 = req('d1');
	$d2 = req('d2');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$staff = $qur->custom_select_query("SELECT staff_name FROM staff WHERE idstaff=$c1;");
	$report = ($lang ?  "কর্মচারী/কর্মকর্তার বিক্রয় তথ্য (".$staff[0][0].")" : "Sales Representative Statement (".$staff[0][0].")" );

	
	
	$details = $qur->custom_select_query("SELECT idcompany, COMPANY, sales_total, received_total, sales_return, credit, pb + company_ob FROM (SELECT idcompany , ___find_company_name(idcompany) COMPANY , SUM(sales) as sales_total ,SUM(recived) as received_total , ___find_sales_return('".$d2."','".$d1."', $c1, idcompany)  as sales_return, (SUM(sales)-SUM(recived)-___find_sales_return('".$d2."','".$d1."', $c1, idcompany)) as credit, ___find_pb_sl($c1, idcompany, '".$d2."') - ___find_pb_sales_return('".$d2."',$c1, idcompany) -  ___find_pb_tr($c1, idcompany, '".$d2."') pb
			FROM (
			SELECT idsales, idcompany, SUM(sales_ammount) as sales,0 as recived , 1 as type
			FROM sales_details LEFT JOIN sales USING(idsales) WHERE idstaff=$c1 AND sales_status = 2 AND sales_date BETWEEN '$d2' AND '$d1' GROUP BY (idcompany)
			UNION
			(SELECT idtransaction, idcompany, 0 as sales, SUM(transaction_ammount) as recived , 2 FROM
				(SELECT idtransaction,idcompany FROM `transaction_company`) as a
				LEFT JOIN
				`transaction` USING(idtransaction) WHERE (idtransaction_head=14 OR idtransaction_head=15 OR idtransaction_head=86) 
				AND transaction_status = 1 AND transaction_date BETWEEN '$d2' AND '$d1' AND idstaff = $c1
				GROUP BY idcompany
			    )
			) as a GROUP BY idcompany ORDER BY COMPANY ) as a LEFT JOIN company_details cd USING(idcompany);");

			
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
					  <th style='display:none'><?=$label_7;?></th>
					  <th><?=$label_8;?></th>
					  <th><?=$label_9;?></th>
					</tr>
				</thead>
				<tbody>
    				
	<? 			$sales=0; $sales_rt=0; $tran=0; $cur_balance=0; $pre_balance = 0; $balance=0; 
				for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?php echo $inp->cb($i+1); ?> </td> 
					  <td><?php echo $details[$i][1]; ?> </td>
					  <td><?php echo $details[$i][0]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][2])); $sales += $details[$i][2]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][3])); $tran += $details[$i][3]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][4])); $sales_rt += $details[$i][4]; ?> </td>
					  <td style='display:none'><?php echo $inp->cb(two_dec($details[$i][5])); $cur_balance += $details[$i][5]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][6])); $pre_balance = $pre_balance +  ($details[$i][6]); ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][5] + $details[$i][6])); 
							    $balance += ($details[$i][5] + $details[$i][6]);
							?> 
					  </td>
					</tr>
	<? } ?>
					<tr> 
						<th colspan="3">Total</th>
						<th><?php echo $inp->cb(two_dec($sales)); ?></th>
						<th><?php echo $inp->cb(two_dec($tran)); ?></th>
						<th><?php echo $inp->cb(two_dec($sales_rt)); ?></th>
						<th style='display:none'><?php echo $inp->cb(two_dec($cur_balance)); ?></th>
						<th><?php echo $inp->cb(two_dec($pre_balance)); ?></th>
						<th><?php echo $inp->cb(two_dec($balance)); ?></th>
					  </tr>
	


					  <tr> 
						<td colspan="9"><b>Summary of <? echo $report; ?> </b></td>
					  </tr>
					  <tr> 
						<td colspan="3">Sales</td>
						<td  colspan="6" ><?php echo $inp->cb(two_dec($sales)); ?></td>
					  </tr>
					  <tr> 
						<td colspan="3">Received</b></td>
						<td  colspan="6" ><?php echo $inp->cb(two_dec($tran)); ?></td>
					  </tr>
					  <tr> 
						<td colspan="3">Sales Return</b></td>
						<td  colspan="6" ><?php echo $inp->cb(two_dec($sales_rt)); ?></td>
					  </tr>
					  <tr> 
						<td colspan="3">Balance</td>
						<td  colspan="6" ><?php echo $inp->cb(two_dec($cur_balance)); ?></td>
					  </tr>	
					  <tr> 
						<td colspan="3">Previous Balance</td>
						<td  colspan="6" ><?php echo $inp->cb(two_dec($pre_balance)); ?></td>
					  </tr>		

					  <tr> 
						<td colspan="3">Total Balance</td>
						<td  colspan="6" ><?php echo $inp->cb(two_dec($balance)); ?></td>
					  </tr>		
		
				</tbody>
				      <tfoot>
						<td colspan='9'></td>
				      </tfoot>
				</table>
				<br/>
				
				
				<div class="form-group">
						<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo ($lang == 1 ? " প্রিন্ট রিপোর্ট " : "Print Report. Per Page ");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

						</div>
			</div>
				<br/>
                                        	
			
			<?php include('rf.php'); ?>



