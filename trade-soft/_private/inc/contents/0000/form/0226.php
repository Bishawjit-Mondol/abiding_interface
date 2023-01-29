<? 
	$d1= req('d1');
	$d2= req('d2'); //echo $d2; exit;
	$report = ($lang ?  "মজুদ কৃত পণ্যের আসা যাওয়ার লগ" : "Stock Input output log" );

	$idproduct = req('c1')>0 ? req('c1') : 0; 
	$idgodown = req('c2')>0 ? req('c2') : 0; 

	
	if($idproduct==0){
        $ret_msg = ($lang ?  " দু:খিত, ব্যর্থ হয়েছে ।" : " Please choose a product." );
	  
    echo json_encode($ret_msg);
		
    }
    else{
	$query = "CALL ___show_input_output_log($idproduct, $idgodown,'$d2','$d1');"; //echo "CALL ___show_input_output_log($idproduct, $idgodown,'$d2','$d1');";
	$det = $qur->custom_select_query($query);
	$query1 = "SELECT ___find_stock_opening_balance( $idproduct, $idgodown, '$d2')"; //echo $query1;
	$det1 = $qur->custom_select_query($query1);
	$j = 0;
	$open_stock = $det1[0][0];
	if(($det1[0][0]==0) || ($det1[0][0]==null)){$det1[0][0]=0;}
?>

<fieldset>
<div class="panel-body">
			<?php include('rh.php'); ?>
			<div class="bs-example table-responsive ">

			  <table class="table table-striped table-hover report-table">
				 <tbody>
					<tr>
						<th><?=($lang ? 'ক্রম' : 'Sl');?></th>
						<th><?=($lang ? 'তারিখ' : 'Date');?></th>
						<th><?=($lang ? 'শোরুম/গোডাউন' : 'Showroom / Godown');?></th>
						<th><?=($lang ? "খাত" : "Head" );?></th>
						<th><?=($lang ? "ইন" : "In" );?></th>
						<th><?=($lang ? "আউট" : "Out" );?></th>
						<th><?=($lang ? "মজুদ পরিমাণ" : "Stock In Hand" );?></th>
						<th class = 'action'><?=($lang ? "মন্তব্য " : "Action" );?></th>
						
					</tr>
					<tr>
						<td></td>
						
						<td><?=($lang ? cb($inp,$d2).'  এর আগে' : 'Before  '.cb($inp,$d2));?></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><?=$open_stock=$det1[0][0];?></td>
						<td></td>
					
					</tr>
					
					
	<? foreach($det as $d){ ?>
					<tr class = 'report-1-0036-data' >
						<td><?=$inp->convert_bangla(++$j);?></td>
						<td><?=dateconvert($d[1]);?></td>
						<td><?=$d[2];?></td>
						<td><? 
							if($d[5]==1){
								echo 'Sales';
							}
							elseif($d[5]==2){
								echo 'Purchase return';   // report nai
							}
							elseif($d[5]==3){
								echo 'Stock adjustment';  // report nai
							}
							elseif($d[5]==4){
								echo 'Stock transfer';
							}
							elseif($d[5]==5){
								echo 'Purchase';
							}
							elseif($d[5]==6){
								echo 'Sales return';
							}
							
							?>
						</td>
						<td><?=$d[3];?></td>
						<td><?=$d[4];?></td> 
						
						<td><?=$open_stock = ($open_stock+$d[3]-$d[4]);?></td> 
						<td  class = 'action'>
							
						<? if($d[5]==1){ ?>
								<button type ='button' class='btn btn-info inactive page-loader box-entry link0211' data="&id=<? echo $d[0];?>&rtype=2" ><?php echo ($lang == 1 ? "দেখুন " : "Show"); ?> </button>
						<? }
						/*	elseif($d[5]==2){ ?>
								<button type ='button' class='btn btn-info inactive page-loader' data="&id=<? echo $d[0];?>" ><?php echo ($lang == 1 ? "দেখুন " : "Show"); ?> </button>
						<?	}
							elseif($d[5]==3){ ?>
								<button type ='button' class='btn btn-info inactive page-loader' data="&id=<? echo $d[0];?>" ><?php echo ($lang == 1 ? "দেখুন " : "Show"); ?> </button>
						<?	}
							*/elseif($d[5]==4){ ?>
								<button type ='button' class='btn btn-info inactive page-loader box-entry link0214' data="&id=<? echo $d[0];?>" ><?php echo ($lang == 1 ? "দেখুন " : "Show"); ?> </button>
						<?	}
							elseif($d[5]==5){ ?>
								<button type ='button' class='btn btn-info inactive page-loader box-entry link0212' data="&id=<? echo $d[0];?>&rtype=2" ><?php echo ($lang == 1 ? "দেখুন " : "Show"); ?> </button>
						<?	}
							elseif($d[5]==6){ ?>
								<button type ='button' class='btn btn-info inactive page-loader box-entry link0152' data="&id=<? echo $d[0];?>&rtype=2" ><?php echo ($lang == 1 ? "দেখুন " : "Show"); ?> </button>
						<?	}	
						
							?>
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


