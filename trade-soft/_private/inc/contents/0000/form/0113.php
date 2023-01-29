<?php 
	$label_2 =  ($lang == 1 ? " অ্যাকাউন্ট নাম" : "Account Name "); 
	$label_3 =  ($lang == 1 ? " খাত " : "Head ");
	$label_1 =  ($lang == 1 ? " রিপোর্ট দেখুন " : " Show Report");
	$cash_point = $qur->custom_select_query("SELECT idmestablishment,mestablishment_name,mestablishment_type FROM mestablishment m  WHERE idmestablishment NOT IN(1,5) ORDER BY mestablishment_type");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   
					   
						<div class="form-group">
							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-user"></i> <?=$label_2;?></span>
										<select name = 'c1' class = 'form-control numeric'>
											<? $tmed = $qur->custom_select_query("SELECT * FROM mestablishment m WHERE idmestablishment NOT IN (1, 5) ORDER BY mestablishment_type, mestablishment_name"); ?>
	
											<option></option>
											<optgroup label="<? echo ($lang == 1 ? 'ক্যাশ' : 'Cash'); ?>">
											<? foreach($tmed as $t){  if($t[3]==1){ echo "<option value = '".$t[0]."'>".$t[1]."</option>"; } } ?>
											<optgroup label="<? echo ($lang == 1 ? 'ব্যাংক' : 'Bank'); ?>">
											<? foreach($tmed as $t){  if($t[3]==2){ echo "<option value = '".$t[0]."'>".$t[1]."</option>"; } } ?>
											</optgroup>
											<optgroup label = "<? echo ($lang == 1 ? 'অাই, ও, ইউ' : 'IOU'); ?>">
											<? foreach($tmed as $t){  if($t[3]==3){ echo "<option value = '".$t[0]."'>".$t[1]."</option>"; } } ?>
											</optgroup>
										</select>
								</div>                  
							</div>     
							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-building-o"></i> <?=$label_3;?></span>
								  <select name = 'c2' class = 'form-control trn-head' ><option></option></select>
								</div>                  
							</div>  
						
							
							<div class = 'col-lg-2'>
								<div class="input-group margin-bottom-sm">
										<button type="button" class="btn btn-primary btn-show-report box-report link<?php echo req('sub'); ?>"  data = "" ><i class="fa fa-files-o"></i><?php echo $label_1;?></button>
								</div>                  
							</div>     

					   </div>



                    </fieldset>
                </form>
            
