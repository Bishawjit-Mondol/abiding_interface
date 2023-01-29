<?php 
    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রেতা " : "Client"); 
    $label_3 =  ($lang == 1 ? "ফোন" : "Phone");
    $label_4 =  ($lang == 1 ? "ঠিকানা " : "Address");
    $label_5 =  ($lang == 1 ? "বেলেন্স" : "Balance");
    $label_6 =  ($lang == 1 ? "পদক্ষেপ " : "Action");
    $report = ($lang ?  "ক্রেতার তালিকা " : "Client List");
	
	$sup = $qur->custom_select_query("SELECT idcompany, company_name, company_phone, company_address,company_balance, company_creditlimit FROM company WHERE company_type=1 ORDER BY company_name;");
	$n = count($sup);
	?>
		
        <div class="panel-body">
			<legend><?=$page_title;?></legend>

			<?php include('rh_without_date.php'); ?>
			<div class="bs-example table-responsive ">
			<section class="paginate">
			</br>
			  <table class="table table-striped table-hover report-table">
				    <thead>   
					<tr>
					  <th><?=$label_1;?></th>
					  <th><?=$label_2;?></th>
					  <th><?=$label_3;?></th>
					  <th><?=$label_4;?></th>
					  <th><?=$label_5;?></th>
					  <th class='action'><?=$label_6;?></th>
					</tr>
					</thead>
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$sup[$i][1];?></td>
					  <td><?=$sup[$i][2];?></td>
					  <td><?=$sup[$i][3];?></td>
					  <td class="tdcell-ra-p"><?=$inp->cb(two_dec($sup[$i][4]));?></td>
					  <td class='action'>
							<button type ='button'  class='inactive page-loader box-entry link0142 btn btn-info ' data =  "&id=<?php echo $sup[$i][0]; ?>&ln=<?php echo $lang; ?> "><?php echo ($lang == 1 ? "সংশোধন করুন " : "Edit");?></button>
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
							  <td></td>
							  <td  class = 'action'></td>	
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



