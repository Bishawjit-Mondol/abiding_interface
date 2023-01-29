<?

    $label_1 =  ($lang == 1 ? "ক্রম " : "SL"); 
  
    $label_2 =  ($lang == 1 ? "তারিখ " : "Product Name"); 
       
    $label_3 =  ($lang == 1 ? "ইউনিট" : "Unite");

    $label_4 =  ($lang == 1 ? " পন্যের সর্বোচ্চ খুচরা মূল্য " : "Product MRP");

    $label_5 =  ($lang == 1 ? " পন্যের সর্বোচ্চ উৎপাদন মূল্য " : "Product MPP");

	$report = ($lang ?  " সকল মজুদক্রীত পন্যের বই " : "Stock Book All Product");
	
	
	$q="Select idproduct,___find_product_name(idproduct_catagory),unite_name,product_mrp,product_mpp from product left join unite using(idunite);";
	$details = $qur->custom_select_query($q);
	$n = count($details);
?>
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">
				<legend><?=$page_title;?></legend>
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
	<? for($i=0; $i<$n;$i++){ ?> 
					<tr>
					  <td><?=$inp->cb($i+1);?></td>
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
						</tr>
				      </tfoot>
				</table>
	
<div class="form-group">
	<div class = 'col-lg-6'>
		<div class="input-group margin-bottom-sm">
 		  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i> Print Report. Per Page : </span>
		  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '10' />
		</div>                  
	</div>     
</div>	
<br/>
 
			
			<?php include('rf.php'); ?>



