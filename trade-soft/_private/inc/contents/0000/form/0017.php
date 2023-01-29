<?php 
	$label_1 =  ($lang == 1 ? "লেনদেনের ধরন" : "Type");
	$label_2 =  ($lang == 1 ? "তারিখ" : "Date"); 
	$label_3 =  ($lang == 1 ? "ব্যক্তি" : "Transaction With");
	$label_4 =  ($lang == 1 ? "লেনদেনের খাত" : "Transaction Head");
	$label_5 =  ($lang == 1 ? "নগদ / ব্যাংক" : "Cash/Bank");
	$label_6 =  ($lang == 1 ? "টাকার পরিমান" : "Amount");
	$label_7 =  ($lang == 1 ? "পদ্ধতি" : "Method");
	$label_8 =  ($lang == 1 ? "ব্যাংকের নাম" : "Bank Name");
	$label_9 =  ($lang == 1 ? "চেক নাম্বার" : "Cheque Number");
	$label_10 =  ($lang == 1 ? "ব্রাঞ্চের নাম" : "Branch Name");
	$label_11 =  ($lang == 1 ? "চেকের তারিখ" : "Cheque Date");
	$label_12 =  ($lang == 1 ? "মন্তব্য" : "Comment");
	$label_13 =  ($lang == 1 ? "মন্তব্য" : "Purchase Code");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   <div class="form-group">
							<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_2;?> </span><input type="text"  name="d1"  class="form-control date" />       
		          		           </div>									
							</div>
						</div>
						
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_13;?></span>
									<select name="idpurchase" class="form-control integer optional">
											<option></option>
											<?php $det3 = $qur->custom_select_query("SELECT idpurchase , purchase_code FROM purchase_code left join purchase using(idpurchase) 
																					where purchase_status=1 ORDER BY idpurchase;"); ?>
											<?php foreach($det3 as $d3){ ?>
													<option value = '<?php echo $d3[0];?>'><?php echo $d3[1];?></option>
											<?php } ?>
									</select>
								</div>                   
							</div>     
						</div>
					   
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
									<select name="v1" class="form-control  transaction-method-hook  transaction-type integer">
										<option value="1">Receiving</option>
										<option value="-1">Paying</option>
									</select>
								</div>                   
							</div>     
						</div>
					   	
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
									<select name="v2" class="form-control supplier integer">
										
									</select>
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
									<select name="v3" class="form-control integer">
											<option></option>
											<?php $det = $qur->custom_select_query("SELECT idtransaction_head, transaction_head_name FROM transaction_head WHERE  idtransaction_head_type = 3 ORDER BY transaction_head_name;"); ?>
											<?php foreach($det as $d){ ?>
													<option value = '<?php echo $d[0];?>'><?php echo $d[1];?></option>
											<?php } ?>
									</select>
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-6'>
				       			   <div class="input-group margin-bottom-sm">
								<span class="input-group-addon input-group-addon-2x input-label"><?=$label_5;?></span>
										<select name = 'v4' class = 'form-control numeric'>
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
								  <span class="input-group-addon input-group-addon-2x"><?=$label_6;?></span>
								  <input class="form-control numeric positive" name = 'v5' type="text" /> 
								</div>                   
							</div>     
					   </div>

					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_7;?></span>
									<select name="v6" class="form-control transaction-method-hook  transaction-method">
										<option value="1">Cash</option>
										<option value="2">Cheque</option>
									</select>
								</div>                   
							</div>     
						</div>
						<div class="form-group cheque-details">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_8;?></span>
										<select name="v7" class="form-control bank cheque-details cheque_bank optional">
												<option></option>
												<?php $det = $qur->custom_select_query( " SELECT idbank, bank_name_en FROM bank ;");  ?>
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
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_9;?></span>
										<input class="form-control optional cheque-details cheque_number cheque_number_text" name = 'v8' type="text" /> 
										<select class="form-control optional cheque-details cheque_number cheque_number_select" name = 'v8' disabled  style='display:none'> 
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
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_10;?></span>
								  <input class="form-control optional" name = 'v9' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group cheque-details">
							<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_11;?> </span>
				                       	<input type="text"   name="d2"  class="form-control date optional" />       
		          		           </div>									
							</div>
						</div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_12;?></span>
								  <input class="form-control optional" name = 'v10' type="text" /> 
								</div>                   
							</div>     
					   </div>
                        <div class="form-group">
							 <div class="col-lg-6">
                                <button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i>  <?php echo ($lang == 1 ? "নিশ্চিত করুন " : "Confirm"); ?></button>
								<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "2" ><i class="fa fa-thumbs-up"></i>  <?php echo ($lang == 1 ? "প্রস্তাব করুন " : "Propose"); ?></button>
							</div>
                        </div>
                    </fieldset>
                </form>
            
