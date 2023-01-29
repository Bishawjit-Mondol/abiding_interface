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
	
	
	$t_id = req('id');
	$details = $qur->custom_select_query("SELECT idtransaction, transaction_date, idmestablishment, transaction_ammount, idtransaction_head, transaction_type, transaction_status, idstaff, iduser, transaction_bounced, transaction_cheque, transaction_cheque_date, transaction_bank, transaction_branch, transaction_comments
				FROM `transaction` LEFT JOIN `transaction_details` USING(idtransaction) WHERE idtransaction=$t_id;");
				
	$with = $qur->custom_select_query("SELECT ___find_transaction_with($t_id)");
	$head = $qur->custom_select_query("SELECT ___find_transaction_head($t_id)");
	$m_name = $qur->custom_select_query("SELECT ___find_me_name_for_transaction($t_id)");
?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
					<legend><?php echo $page_title;?></legend>
					   <div class="form-group">
							<div class = 'col-lg-12'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?php echo $label_2;?> </span><input type="text" id = 'form_0100_d1'  name="d1" value="<?php echo date('d-m-Y',strtotime($details[0][1]));?>"  class="form-control date" />       
				                    </div>									
							</div>
						</div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?php echo $label_1;?></span>
									<input class="form-control" readonly name='v1' value="<?php echo $details[0][3]>0 ? "Receiving" : "Paying"; ?>" type="text" />
								</div>                   
							</div>     
						</div>
					   	
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?php echo $label_3;?></span>
									<input class="form-control" readonly name='v2' value="<?php echo $with[0][0]; ?>" type="text" />
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?php echo $label_4;?></span>
									<input class="form-control" readonly name='v3' value="<?php echo $head[0][0]; ?>" type="text" />
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?php echo $label_5;?></span>
									<input class="form-control" readonly name='v4' value="<?php echo $m_name[0][0]; ?>" type="text" />
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?php echo $label_6;?></span>
								  <?php if($details[0][3]>0){
											$amount = $details[0][3];
											$sign = 1;
										}
										else{
											$amount = -$details[0][3];
											$sign = -1;
										}
								  ?>
								  <input class="form-control " name = 'v5' value="<?php echo $amount;?>" type="text" /> 
								  
								</div>                   
							</div>     
					   </div>

					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?php echo $label_7;?></span>
									<input class="form-control" readonly name='v6' value="<?php echo $details[0][5]==1 ? "Cash" : "Cheque"; ?>" type="text" />
								</div>                   
							</div>     
						</div>
						
						
					<?php if($details[0][5] != 1){ ?>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?php echo $label_8;?></span>
								  <input class="form-control" readonly name = 'v7' value="<?php echo $details[0][12];?>" type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?php echo $label_9;?></span>
								  <input class="form-control" readonly name = 'v8' value="<?php echo $details[0][10];?>" type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?php echo $label_11;?> </span><input type="text"  name="d2" value="<?php echo date('d-m-Y',strtotime($details[0][11]));?>"  class="form-control date" />       
				                    </div>									
							</div>
						</div>
					<?php } ?>	
						
						
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?php echo $label_12;?></span>
								  <input class="form-control optional" name = 'v10' value="<?php echo $details[0][14];?>" type="text" /> 
								</div>                   
							</div>     
					   </div>
                        <div class="form-group">
                            <div class="col-lg-12">
								<input type="hidden" class="form-control optional" name = 'v11' value="<?php echo $details[0][5];?>"/> <!--cheque_or_cash-->
								<input type="hidden" class="form-control optional" name = 'v12' value="<?php echo $details[0][0];?>"/> <!--idtransaction-->
								<input type="hidden" class="form-control optional" name = 'v13' value="<?php echo $sign;?>"/>          <!-- (+1) or (-1)-->
								
								<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> <?php echo ($lang == 1 ? "  নিশ্চিত করুন " : " Confirm");?></button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            
