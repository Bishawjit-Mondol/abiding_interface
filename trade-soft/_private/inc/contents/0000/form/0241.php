<?
	$label_2 =  ($lang == 1 ? "কোম্পানির নাম" : "Supplier Name"); 
	
	$label_1 =  ($lang == 1 ? "রিপোর্ট দোখান" : "Show Report");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>



                    </fieldset>
                </form>
<?
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "কোম্পানি " : "Company"); 
    $label_3 =  ($lang == 1 ? "ক্রয়" : "Purchase ");
	$label_4 =  ($lang == 1 ? "প্রদান" : "Payment");
    $label_5 =  ($lang == 1 ? "ক্রয় ফেরত" : "Purchase Return");
	$label_6 =  ($lang == 1 ? "ব্যালেন্স " : "Balance");
	
	$report = ($lang ?  "সকল বিক্রয় তথ্য" : "All Purchase Statement");
	$d1 = req('d1');
	$d2 = req('d2');

	$details = $qur->custom_select_query("SELECT idcompany, ___find_company_name(idcompany) COMPANY, SUM(p_amount), SUM(tran), SUM(pr_amount), ___find_previous_purchase_balance(idcompany, '0000-01-01')
FROM (
  SELECT idcompany, SUM(purchase_ammount) p_amount, 0 tran, 0 pr_amount FROM purchase
  LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_status=1 AND purchase_issales_return=0 GROUP BY idcompany
  UNION
  SELECT idcompany, 0 p_amount, 0 tran, SUM(sales_ammount) pr_amount FROM sales
  LEFT JOIN sales_details USING(idsales) WHERE sales_status=2 AND sales_ispurchase_return=1 GROUP BY idcompany
  UNION
  SELECT idcompany, 0 p_amount, SUM(transaction_ammount) tran, 0 pr_amount
  FROM transaction_company LEFT JOIN `transaction` USING(idtransaction) WHERE (idtransaction_head=13 OR idtransaction_head=16) AND transaction_status=1 GROUP BY idcompany

  )as a GROUP BY idcompany ORDER BY COMPANY;");
	
	$n = count($details);
?>
			<?php include('rh_without_date.php'); ?>
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
					  
					</tr>
					</thead>
					<tbody>
					
	<?php	$pur=0; $pur_rt=0; $pay=0; $total=0; 
			for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td> 
					  <td><?php echo $details[$i][1]; ?> </td>
					  <td><?php echo $inp->cb(two_dec(-(-$details[$i][2]+$details[$i][5])) ); $pur += (-$details[$i][2]+$details[$i][5]); ?> </td>
					  <td><?php echo $inp->cb(two_dec(-$details[$i][3])); $pay += $details[$i][3]; ?> </td>
					  <td><?php echo $inp->cb(two_dec($details[$i][4])); $pur_rt += $details[$i][4]; ?> </td>
					  <td><?php echo $inp->cb(two_dec(-1*(-$details[$i][2]+$details[$i][5] - $details[$i][3] + $details[$i][4]))); 
							    $total += (-$details[$i][2]+$details[$i][5] - $details[$i][3] + $details[$i][4]);
							?> 
					  </td>
					  

					</tr>
		<?  } ?>
					  <tr> 
						<th colspan="2">Total</th>
						<th><?php echo $inp->cb(two_dec(-$pur)); ?></th>
						<th><?php echo $inp->cb(two_dec(-$pay)); ?></th>
						<th><?php echo $inp->cb(two_dec($pur_rt)); ?></th>
						<th><?php echo $inp->cb(two_dec(-$total)); ?></th>
					  </tr>
					
				    </tbody>
					
				    <tfoot>
						<tr>
							  <td colspan='6'></td>
									
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



            
