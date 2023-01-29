<?php 
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রয় আই. ডি." : "Purchase ID"); 
    $label_3 =  ($lang == 1 ? "তারিখ " : "Date"); 
    $label_4 =  ($lang == 1 ? "সরবরাহকারী " : "Supplier"); 
    $label_5 =  ($lang == 1 ? "মোবাইল " : "Mobile");

    $label_6 =  ($lang == 1 ? "ঠিকানা " : "Address");
    $label_7 =  ($lang == 1 ? "টাকা " : "Amount");
	$label_8 =  ($lang == 1 ? "পদক্ষেপ " : "Action");

	$sup = $qur->custom_select_query("SELECT idpurchase, purchase_date,company_name, company_phone, company_address, purchase_ammount
						FROM purchase LEFT JOIN purchase_details USING(idpurchase) LEFT JOIN company USING(idcompany)
                    				WHERE purchase_status=1 AND purchase_issales_return=1;");
	$n = count($sup);
?>
		
        <div class="panel-body">
			<legend><?=$page_title;?></legend>

			<div class="bs-example table-responsive ">
	<section class="paginate">

			  <table class="table table-striped table-hover">
				       <tbody>
					<tr>
					  <th><?=$label_1;?></th>
					  <th><?=$label_2;?></th>
					  <th><?=$label_3;?></th>
					  <th><?=$label_4;?></th>
					  <th><?=$label_5;?></th>
					  <th><?=$label_6;?></th>
					  <th><?=$label_7;?></th>
					  <th><?=$label_8;?></th>
					</tr>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr class = 'report-1-8001-data' >
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$inp->cb($sup[$i][0]);?></td>
					  <td><?=$sup[$i][1];?></td>
					  <td><?=$sup[$i][2];?></td>
					  <td><?=$inp->cb($sup[$i][3]);?></td>
					  <td><?=$sup[$i][4];?></td>
					  <td><?=$inp->cb(two_dec($sup[$i][5]));?></td>
					  <td>
							<button type ='button'  class='inactive page-loader box-entry link0139 btn btn-info' data =  "&id=<?php echo $sup[$i][0]; ?>&ln=<?php echo $lang; ?>" ><?php echo ($lang == 1 ? " দেখুন " : "Show");?></button>
					 </td>

					</tr>
	<? } ?>
				      </tbody>
				</table>
		        <div class="pagination">
		        </div>

			</div>
       </div>
 

 
