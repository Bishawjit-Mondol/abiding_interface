<?php 
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রেতা " : "Employee");
    $label_3 =  ($lang == 1 ? "পদবী " : "Post"); 
    $label_4 =  ($lang == 1 ? "বিভাগ" : "Division"); 
    $label_5 =  ($lang == 1 ? "ফোন" : "Phone");
    $label_6 =  ($lang == 1 ? "ঠিকানা " : "Address");
    $label_7 =  ($lang == 1 ? "পদক্ষেপ " : "Salary");
    $label_8 =  ($lang == 1 ? "বেলেন্স" : "Balance");
    $label_9 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
    $report = ($lang ?  "ক্রেতার তালিকা " : "Client List");
	
	$sup = $qur->custom_select_query("SELECT idstaff, staff_name, post_name, division_name, staff_mobile,  permantnt_address, staff_sallary, staff_balance
		FROM staff LEFT JOIN staff_details USING(idstaff) LEFT JOIN post USING(idpost) LEFT JOIN division USING(iddivision);");
	$n = count($sup);
	?>
		
        <div class="panel-body">
			<legend><?=$page_title;?></legend>

			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">
	<section class="paginate">

			  <table class="table table-striped table-hover report-table">
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
					  <th class='action'><?=$label_9;?></th>
					</tr>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$sup[$i][1];?></td>
					  <td><?=$sup[$i][2];?></td>
					  <td><?=$sup[$i][3];?></td>
					  <td><?=$sup[$i][4];?></td>
					  <td><?=$sup[$i][5];?></td>
					  <td><?=$inp->cb(two_dec($sup[$i][6]));?></td>
					  <td><?=$inp->cb(two_dec($sup[$i][7]));?></td>
					  <td class='action'>
							<button type ='button'  class='inactive page-loader box-entry link0156 btn btn-info ' data =  "&id=<?php echo $sup[$i][0]; ?>&ln=<?php echo $lang; ?> "><?php echo ($lang == 1 ? "বিস্তারিত" : "Details");?></button>
					 </td>

					</tr>
	<? } ?>
				      </tbody>
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



