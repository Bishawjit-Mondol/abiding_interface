<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
    $label_2 =  ($lang == 1 ? "ক্রয় আই. ডি." : "Staff Name"); 
    $label_3 =  ($lang == 1 ? "তারিখ " :"Balance"); 
    $label_4 =  ($lang == 1 ? "ক্রেতা " : "Post"); 
    
    $label_5 =  ($lang == 1 ? "থেকে" : "Division");
    $label_6 =  ($lang == 1 ? "থেকে" : "Priority");

	$report = ($lang ?  "নতুন পন্য বিক্রয়ের অর্ডার" : "Employee List");
	
	$details = $qur->custom_select_query("SELECT staff_name, staff_balance, post_name, division_name, division_priority
						FROM staff left join post using (idpost)
						left join division using (iddivision);");
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
					 
					</tr>
					</thead>
					<tbody>
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$details[$i][0];?></td>
					  <td><?=$details[$i][1];?></td>
					  <td><?=$details[$i][2];?></td>
					  <td><?=$details[$i][3];?></td>
					  <td><?=$details[$i][4];?></td>
					  
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
						</tr>
				      </tfoot>
				</table>
	
			<div>
				
		<button type = 'button' class="btn btn-primary btn-print link0000" num-row = '20'><i class = 'fa fa-print'></i> Print Report</button>										</div>                  
							
			</div>
			
			<?php include('rf.php'); ?>



