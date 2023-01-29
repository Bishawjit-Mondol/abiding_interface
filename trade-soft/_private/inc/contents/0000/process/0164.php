<? //dateconvert($d1);

    $label_1 =  ($lang == 1 ? "বিক্রয়" : "Sales"); 
    $label_2 =  ($lang == 1 ? "বিক্রয় ফেরত" : "Sales Return"); 
    $label_3 =  ($lang == 1 ? "নেট বিক্রয় " : "Net Sales"); 
    $label_4 =  ($lang == 1 ? "গ্রহন " : "Receive");  
    $label_5 =  ($lang == 1 ? "নেট পাওনা " : "Net Credit"); 
    
	$report = ($lang ?  "বিক্রয় সারমর্ম" : "Sales Summery");
	$d1 = req('d1');
	$d2 = req('d2');
	
	$det1 = $qur->custom_select_query("SELECT SUM(s_amount), SUM(sr_amount), SUM(s_amount)-SUM(sr_amount) as net_sale, SUM(tran)
FROM (
  SELECT SUM(sales_ammount) s_amount, 0 sr_amount, 0 tran FROM sales
  LEFT JOIN sales_details USING(idsales) WHERE sales_status=2 AND sales_ispurchase_return=0 AND sales_date BETWEEN '$d2' AND '$d1'
  UNION
  SELECT 0 s_amount, SUM(purchase_ammount) sr_amount, 0 tran FROM purchase
  LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_status=1 AND purchase_issales_return=1 AND purchase_date BETWEEN '$d2' AND '$d1'
  UNION
  SELECT 0 s_amount, 0 sr_amount, SUM(transaction_ammount) tran
  FROM transaction_company LEFT JOIN `transaction` USING(idtransaction) WHERE (idtransaction_head=14 OR idtransaction_head=15) AND transaction_date BETWEEN '$d2' AND '$d1'

  )as a;");
  
	
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">
			<? echo ($lang ?  dateconvert($d2)." থেকে ".dateconvert($d1)." তারিখের রিপোর্ট" : "Report From ".dateconvert($d2)." To ".dateconvert($d1) );?>

			  <table class="table table-striped table-hover report-table">
				    <thead>
						<tr>
						  <th><?=$label_1;?></th>
						  <th><?=$label_2;?></th>
						  <th><?=$label_3;?></th>
						  <th><?=$label_4;?></th>
						  <th><?=$label_5;?></th>
						</tr>
					</thead>
					<tbody>
						<tr>
						  <td><?=$inp->cb(two_dec($det1[0][0]));?></td>
						  <td><?=$inp->cb(two_dec($det1[0][1]));?></td>
						  <td><?=$inp->cb(two_dec($det1[0][2]));?></td>
						  <td><?=$inp->cb(two_dec($det1[0][3]));?></td>
						  <td><?=$inp->cb(two_dec($det1[0][2]-$det1[0][3]));?></td>
						</tr>
				    </tbody>
				    <tfoot>
						<tr>
						  <td colspan='5'></td>
						</tr>
				    </tfoot>
				</table>
	
			<div class="form-group">
						<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : "Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     
						</div>
			
			<?php include('rf.php'); ?>



