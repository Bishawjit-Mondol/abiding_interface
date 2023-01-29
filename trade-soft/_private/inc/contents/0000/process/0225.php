<? 
	$d1= req('d1');
	$d2= req('d2'); //echo $d2; exit;
	$report = ($lang ?  "মজুদ কৃত পণ্যের আসা যাওয়ার লগ" : "Stock demand log" );

	$idproduct = req('c1')>0 ? req('c1') : 0; 
	$idgodown = req('c2')>0 ? req('c2') : 0; 

	if($idproduct==0){
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Please choose a product." );
	  
    echo json_encode($ret_msg);
		
    }
    else{
	$query = "CALL ___show_input_output_demand_log($idproduct, $idgodown);"; 
	$det = $qur->custom_select_query($query);
	$j = 0;
?>

<fieldset>
<div class="panel-body">
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				 <tbody>
					<tr>
						<th><?=($lang ? 'ক্রম' : 'Sl');?></th>
						<th><?=($lang ? 'শোরুম/গোডাউন' : 'Showroom / Godown');?></th>
						<th><?=($lang ? "ইন" : "Input demand" );?></th>
						<th><?=($lang ? "আউট" : "Out demand" );?></th>
						<th class = 'action'><?=($lang ? "মন্তব্য " : "Action" );?></th>
						
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					
					</tr>
					
					
	<? foreach($det as $d){ ?>
					<tr class = 'report-1-0036-data' >
						<td><?=$inp->convert_bangla(++$j);?></td>
						<td><?=$d[2];?></td>
						<td><?=$d[4];?></td> 
						
						<td><?=$d[5];?></td> 
						<td  class = 'action'>
								<button type ='button' class='btn btn-info inactive page-loader box-entry link0226' data="&c1=<?php echo $d[1];?>&c2=<?php echo $d[0];?>&d1=<?php echo$d1; ?>&d2=<?php echo$d2; ?>" >
								<?php echo ($lang == 1 ? "দেখুন " : "Show"); ?> </button>
						</td>
					</tr>
	<? } ?>
				  </tbody>
				</table>
		       <div class="pagination">
		      </div>

			</div>
        	
        </div>
 </fieldset>
<?php
    }
?>
<div class="form-group">
						<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : "Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

</div>
<br/>


