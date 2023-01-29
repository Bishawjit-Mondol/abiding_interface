<?
	$label_1 =  ($lang == 1 ? "তারিখ" : "Date"); 
	$label_2 =  ($lang == 1 ? "টাকার পরিমান" : "Amount"); 
	$label_3 =  ($lang == 1 ? "নগদ / ব্যাংক" : "Withdraw From");
	$label_4 =  ($lang == 1 ? "নগদ / ব্যাংক" : "Deposit To");
	$label_5 =  ($lang == 1 ? "পদ্ধতি" : "Method");
	$label_6 =  ($lang == 1 ? "ব্যাংকের নাম" : "Bank Name");
	$label_7 =  ($lang == 1 ? "চেক নাম্বার" : "Cheque Number");
	$label_8 =  ($lang == 1 ? "ব্রাঞ্চের নাম" : "Branch Name");
	$label_9 =  ($lang == 1 ? "চেকের তারিখ" : "Cheque Date");
	$label_10 =  ($lang == 1 ? "চেকের তারিখ" : "Comment");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					    <div class="form-group">
							<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text"  name="d1"  class="form-control date" />       
     
		          		           </div>									
							</div>
						</div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon"><?=$label_2;?></span>
								  <input class="form-control numeric positive" name = 'v55' type="text" /> 
								</div>                   
							</div> 
					    </div>
						
				<!--  *******  WITHDRAW ******** --> 
					   <div class="form-group">
							<div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong> <?php echo ($lang? 'পন্য' :' WITHDRAW');?> </strong> </span>
									</div>                   
	                        </div>
						</div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
										<select name = 'v1' class = 'form-control numeric'>
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
						</div>
						<div class="form-group">
						
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_5;?></span>
									<select name="v3" class="form-control transaction-method-hook-1  transaction-method">
										<option value="1">Cash</option>
										<option value="2">Cheque</option>
									</select>
								</div>                   
							</div> 
						</div>
						<div class="form-group cheque-details">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label "><?=$label_6;?></span>
										<select name="v5" class="form-control transaction-method-hook bank cheque-details cheque_bank optional">
												<option></option>
												<?php $det = $qur->custom_select_query( " SELECT idbank, bank_name_en FROM bank ORDER BY bank_name_en ;");  ?>
												<?php foreach($det as $d){ ?>
													<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
												<?php } ?>	
										</select>
								</div>                   
							</div> 
						</div>
						<div class="form-group cheque-details"> 
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_7;?></span>
										<input class="form-control transaction-method-hook-1 optional cheque-details cheque_number cheque_number_text" name = 'v7' type="text" /> 
										<select class="form-control optional  cheque-details cheque_number cheque_number_select" name = 'v7' disabled  style='display:none'> 
												<option></option>
												<?php $det = $qur->custom_select_query( " SELECT idcheque_leaf, CONCAT(cheque_leaf_pre, cheque_leaf_sl) FROM cheque_leaf WHERE cheque_leaf_status=0; ");  ?>
												<?php foreach($det as $d){ ?>
													<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
												<?php } ?>	
										</select>
								</div>                   
							</div> 
						</div>
						<div class="form-group hidden">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_8;?></span>
								  <input class="form-control optional" name = 'v9' type="text" /> 
								</div>                   
							</div>
						</div>
						<div class="form-group cheque-details ">
							<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_9;?> </span><input type="text"  name="d2"  class="form-control date" />       
				                                  
		          		           </div>									
							</div>
						</div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_10;?></span>
								  <input class="form-control " name = 'v11' type="text" /> 
								</div>                   
							</div> 
						</div>
					
						
						
						
						
					<!--  *******  DEPOSIT ******** --> 	
						<div class="form-group">
							<div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong> <?php echo ($lang? 'পন্য' :' DEPOSIT');?> </strong> </span>
									</div>                   
	                        </div>
						</div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
										<select name = 'v2' class = 'form-control numeric'>
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
						</div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_5;?></span>
									<select name="v4" class="form-control transaction-method-hook-fund-2  transaction-method transaction-method-depo">
										<option value="1">Cash</option>
										<option value="2">Cheque</option>
									</select>
								</div>                   
							</div>  
					   </div>
						<div class="form-group cheque-details2 cheque-details-depo" style="display:none" >
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_6;?></span>
										<select name="v6" class="form-control bank cheque-details cheque_bank optional ">
												<option></option>
												<?php $det = $qur->custom_select_query( " SELECT idbank, bank_name_en FROM bank ;");  ?>
												<?php foreach($det as $d){ ?>
													<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
												<?php } ?>	
										</select>
								</div>                   
							</div> 
						</div>
						<div class="form-group cheque-details2 cheque-details-depo" style="display:none" >
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_7;?></span>
										<input class="form-control optional cheque-details cheque_number cheque_number_text " name = 'v8' type="text" /> 
										<select class="form-control optional cheque-details cheque_number cheque_number_select " name = 'v8' disabled  style='display:none'> 
												<option></option>
												<?php $det = $qur->custom_select_query( " SELECT idcheque_leaf, CONCAT(cheque_leaf_pre, cheque_leaf_sl) FROM cheque_leaf WHERE cheque_leaf_status=0; ");  ?>
												<?php foreach($det as $d){ ?>
													<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
												<?php } ?>	
										</select>
								</div>                   
							</div>    
						</div>
					
					<div class="form-group hidden">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_8;?></span>
								  <input class="form-control optional" name = 'v10' type="text" /> 
								</div>                   
							</div> 
					</div>
					
					<div class="form-group cheque-details-depo" style="display:none" >
							<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_9;?> </span><input type="text"  name="d3"  class="form-control date" />       
				                       		           
		          		           </div>									
							</div>
					</div>
					
					<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_10;?></span>
								  <input class="form-control " name = 'v12' type="text" /> 
								</div>                   
							</div> 
					</div>
						
                        <div class="form-group">
                            <div class="col-lg-12">
							
								<button type="button" class="btn btn-primary btn-submit-form btn-submit ww" save-type = "1" ><i class="fa fa-thumbs-up"></i> Confirm</button>

							</div>
                        </div>
                    </fieldset>
                </form>

<script>
/*

$(document).on('click',".ww",function(){
	var id = $(this).attr('save-type');
	$ele = $(this);
	alert(id);
	
});

*/
</script>
            
