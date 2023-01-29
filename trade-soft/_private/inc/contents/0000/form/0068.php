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

										FROM purchase LEFT JOIN company USING(idcompany) WHERE purchase_status=0;");
	$n = count($sup);
?>
		
        <div class="panel-body">
			<legend><?=$page_title;?></legend>

			<div class="bs-example table-responsive ">
			<section class="paginate">
			</br>
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
					  <th width='270'><?=$label_8;?></th>
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
					  <td >
							<button type ='button'  class='inactive page-loader box-entry link0212 btn btn-info ' data =  "&id=<?php echo $sup[$i][0]; ?>&ln=<?php echo $lang; ?>&rtype=2"><?php echo ($lang == 1 ? " দেখুন " : "Show");?></button>
							<button type ='button'  class='inactive page-loader box-entry link0212 btn btn-info confirm_pur_<?php echo $sup[$i][0];?>' data =  "&id=<?php echo $sup[$i][0]; ?>&ln=<?php echo $lang; ?>&rtype=1"><?php echo ($lang == 1 ? " নিশ্চিত করুন " : "Confirm");?></button>
							<button type ='button'  class='inactive page-loader box-entry link0161 btn btn-info confirm_pur_<?php echo $sup[$i][0];?>' data =  "&id=<?php echo $sup[$i][0]; ?>&ln=<?php echo $lang; ?>&rtype=1"><?php echo ($lang ?  "সংশোধন" : "Edit");?></button>
							<button type ='button'  class='inactive page-loader box-entry link0162 btn btn-info confirm_pur_<?php echo $sup[$i][0];?>' data =  "&id=<?php echo $sup[$i][0]; ?>&ln=<?php echo $lang; ?> "><?php echo ($lang ?  "মুছে ফেলুন" : "Delete");?></button>
					 </td>

					</tr>
	<? } ?>
				      </tbody>
				</table>
		        <div class="pagination">
		        </div>

			</div>
       </div>
 

 
