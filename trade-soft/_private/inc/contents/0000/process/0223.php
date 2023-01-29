<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রয় আই. ডি." : "Company Name"); 
    $label_10 =  ($lang == 1 ? "অাগের বাকী" : "Previous Credit");
    $label_3 =  ($lang == 1 ? " বিক্রয়ের পরিমাণয" : "Sales Amount");
	$label_4 =  ($lang == 1 ? " গ্রহণের পরিমাণ " : "Received Amount");
    $label_5 =  ($lang == 1 ? " ক্রেডিট ব্যালেন্স" : "Credit Balance");
    $label_11 =  ($lang == 1 ? "মোট বাকী" : "Total Credit");
	$label_7 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
	
	$d1 = req('d1');
	$d2 = req('d2');
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$staff = $qur->custom_select_query("SELECT staff_name FROM staff WHERE idstaff=$c1;");
	$report = ($lang ?  "বিক্রয় তথ্য (".$staff[0][0].")" : " Employee sales statement (".$staff[0][0].")" );
	$a = 0;
	$b = 0;
	$c = 0;
	$d = 0;
	$e = 0;
	$st = 0;

	
	
	$details = $qur->custom_select_query("SELECT idcompany ,   ___find_company_name(idcompany) COMPANY , SUM(sales) as sales_total ,SUM(recived) as received_total , (SUM(sales)-SUM(recived)) as credit, ___find_pb_sl($c1, idcompany, '".$d2."') - ___find_pb_sales_return('".$d2."',$c1, idcompany) -  ___find_pb_tr($c1, idcompany, '".$d2."'), ___find_sales_return('".$d2."','".$d1."',$c1, idcompany)  as sales_return
			FROM (
			SELECT idsales, idcompany, SUM(sales_ammount) as sales,0 as recived , 1 as type
			FROM sales_details LEFT JOIN sales USING(idsales) WHERE idstaff=$c1 AND sales_status = 2 AND sales_date BETWEEN '$d2' AND '$d1' GROUP BY (idcompany)
			UNION
			(SELECT idtransaction, idcompany, 0 as sales, SUM(transaction_ammount) as recived , 2 FROM
				(SELECT idtransaction,idcompany FROM `transaction_company`) as a
				LEFT JOIN
				`transaction` USING(idtransaction) WHERE (idtransaction_head=14 OR idtransaction_head=15) 
				AND transaction_status = 1 AND transaction_date BETWEEN '$d2' AND '$d1' AND idstaff = $c1
				GROUP BY idcompany
			    )
			) as a GROUP BY idcompany ORDER BY COMPANY;");
			
			/*
			echo "SELECT idcompany ,   ___find_company_name(idcompany) , SUM(sales) as sales_total ,SUM(recived) as received_total , (SUM(sales)-SUM(recived)) as credit, ___find_pb_sl($c1, idcompany, '".$d2."') - ___find_pb_sales_return('".$d2."',$c1, idcompany) -  ___find_pb_tr($c1, idcompany, '".$d2."'), ___find_sales_return('".$d2."','".$d1."',$c1, idcompany)  as sales_return
			FROM (
			SELECT idsales, idcompany, SUM(sales_ammount) as sales,0 as recived , 1 as type
			FROM sales_details LEFT JOIN sales USING(idsales) WHERE idstaff=$c1 AND sales_status = 2 AND sales_date BETWEEN '$d2' AND '$d1' GROUP BY (idcompany)
			UNION
			(SELECT idtransaction, idcompany, 0 as sales, SUM(transaction_ammount) as recived , 2 FROM
				(SELECT idtransaction,idcompany FROM `transaction_company`) as a
				LEFT JOIN
				`transaction` USING(idtransaction) WHERE (idtransaction_head=14 OR idtransaction_head=15) 
				AND transaction_status = 1 AND transaction_date BETWEEN '$d2' AND '$d1' AND idstaff = $c1
				GROUP BY idcompany
			    )
			) as a GROUP BY idcompany;";
			*/
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				       <thead>
					<tr>
					  <th><?=$label_1;?></th>
					  <th><?=$label_2;?></th>
					  <th><?=$label_10;?></th>
					  <th><?=$label_3;?></th>
					  <th>Sales Return</th>

					  <th><?=$label_4;?></th>

					  <th><?=$label_5;?></th>
					  <th><?=$label_11;?></th>
					</tr>
					</thead>
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td ><?=$inp->cb($i+1);?></td>
					  <td><?=$details[$i][1];?></td>
					  <td class = 'tdcell-ra'><? echo two_dec($details[$i][5]); $a = $a + $details[$i][5];   ?></td>
					  <td class = 'tdcell-ra'><? echo two_dec($details[$i][2]); $b = $b + $details[$i][2]; ?></td>
					  <td class = 'tdcell-ra'><? echo two_dec($details[$i][6]); $st = $st + $details[$i][6]; ?></td>

					  <td class = 'tdcell-ra'> <? echo two_dec($details[$i][3]); $c = $c + $details[$i][3]; ?></td>
					  <td class = 'tdcell-ra' ><? echo two_dec($details[$i][4] - $details[$i][6]); $d = $d + $details[$i][4] - $details[$i][6]; ?></td>
					  <td class = 'tdcell-ra'><? echo two_dec(($details[$i][5]+$details[$i][4]-$details[$i][6])); $e = $e + $details[$i][5]+$details[$i][4]-$details[$i][6]; ?></td>
			    	</tr>
	<? } ?>
				      </tbody>
				      <tfoot>
						<tr>
							  <td>Total : </td>
							  <td></td>
							  <td class = 'tdcell-ra'><? echo two_dec($a); ?></td>
							  <td class = 'tdcell-ra'><? echo two_dec($b); ?></td>
							  <td class = 'tdcell-ra'><? echo two_dec($st); ?></td>

							  <td class = 'tdcell-ra'><? echo two_dec($c); ?></td>
							  <td class = 'tdcell-ra' ><? echo two_dec($d); ?></td>
							  <td class = 'tdcell-ra'><? echo two_dec($e); ?></td>
						</tr>
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



