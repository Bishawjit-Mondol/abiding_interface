s<?
    $page_subtitle =   ($lang == 1 ? "ক্রেতার তালিকা" : "Client List");;
    $label_1 =  ($lang == 1 ? "অাই, ডি, " : "ID"); 
    $label_2 =  ($lang == 1 ? "ক্রেতা" : "Client"); 
    $label_3 =  ($lang == 1 ? "ব্যেলেন্স " : "Balance"); 
    $label_4 =  ($lang == 1 ? "সর্বচ্চো বাকী " : "Creditlimit"); 
    $label_5 =  ($lang == 1 ? "কমিশন " : "Comission");
	
	$client = $qur->custom_select_query("SELECT idcompany, company_name, company_balance, company_creditlimit, company_comission FROM ___view_show_client v;");
	$n = count($client);
?>
<div class="col-lg-6">
    <div class="panel panel-primary">
        <div class="panel-heading" id = "head<?=$_REQUEST['sub'];?>">
            <span class = 'page-title'><?=$page_subtitle;?></span>
        </div>
        <div class="panel-body">
			<div class="bs-example table-responsive ">
<section class="paginate">

			  <table id = 'report-1-8001' class="table table-striped table-hover">
				       <tbody>
					<tr>
					  <th id = 's_id_8001' ><?=$label_1;?></th>
					  <th id = 's_name_8001' ><?=$label_2;?></th>
					  <th id = 's_bal_8001' ><?=$label_3;?></th>
					  <th id = 's_cl_8001'><?=$label_4;?></th>
					  <th><?=$label_5;?></th>
					  <th id = 's_com_8001' style = 'display:none;'><?=$label_5;?></th>
					</tr>
	<? for($i=0; $i<$n;$i++){ ?>
					<tr class = 'report-1-8001-data' >
					  <td><?=$client[$i][0];?></td>
					  <td><?=$client[$i][1];?></td>
					  <td><?=$inp->cb(two_dec($client[$i][2]));?></td>
					  <td><?=$inp->cb(two_dec($client[$i][3]));?></td>
					  <td><?=$inp->cb(two_dec($client[$i][4]));?></td>
					  <td style = 'display:none;'><?=two_dec($client[$i][4]);?></td>



					</tr>
	<? } ?>
				      </tbody>
				</table>
		        <div class="pagination">
		        </div>

			</div>
        	
        </div>
    </div>
</div>
