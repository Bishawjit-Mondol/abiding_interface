<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রেতা " : "Transaction Name"); 
    
    $label_3 =  ($lang == 1 ? "থেকে" : "Type");
    $label_4 =  ($lang == 1 ? "থেকে" : "Priority");

	$report = ($lang ?  "নতুন পন্য বিক্রয়ের অর্ডার" : "Disignation List");
	
	$details = $qur->custom_select_query("SELECT  transaction_head_name, transaction_head_type_en,transaction_head_type_bn, priority FROM transaction_head
left join transaction_head_type using(idtransaction_head_type);");
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
					
					</tr>
					</thead>
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$details[$i][0];?></td>
					  <td><?=($lang ?  $details[$i][2] : $details[$i][1]);?></td>
					  <td><?=$details[$i][3];?></td>
					</tr>
	<? } ?>
				      </tbody>
				      <tfoot>
					<tr>
					  <td></td>
					  <td></td>
					  <td></td>
					  <td></td>
					</tr>
				      </tfoot>
				</table>
	
			<div>
				
		<button type = 'button' class="btn btn-primary btn-print link0000" num-row = '20'><i class = 'fa fa-print'></i> Print Report</button>										</div>                  
							
			</div>
			
			<?php include('rf.php'); ?>



