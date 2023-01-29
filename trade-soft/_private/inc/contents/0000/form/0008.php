<?php 
	$label_1 =  ($lang == 1 ? "ব্যাংকের নাম" : "Bank Name");
	$label_2 =  ($lang == 1 ? "একাউন্ট নাম্বার" : "A/C N0.");
	$label_3 =  ($lang == 1 ? "প্রারম্ভিক বেলেন্স" : "Opening Balance"); 
	
	$label_4 =  ($lang == 1 ? "ব্রাঞ্চের নাম" : "Branch Name");
	$label_5 =  ($lang == 1 ? "ব্যাংকের নাম" : "Bank Address");
	$label_6 =  ($lang == 1 ? "নিবন্ধনের তারিখ" : "Registration Date");
	$label_7 =  ($lang == 1 ? "মন্তব্য" : "Comments");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   <div class="form-group">
							<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">				                     
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_6;?> </span><input type="text"  name="d1"  class="form-control date" />       
				                       	           
		          		           </div>									
								</div> 
					    </div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
										<select name = 'v1'   class = ' form-control' > 
												<option></option>
												<?php $det = $qur->custom_select_query( " SELECT idbank, bank_name_en, bank_name_bn FROM bank ORDER BY bank_name_en ASC; ");  ?>
												<?php foreach($det as $d){ ?>
													<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
												<?php } ?>	
										</select>
								</div>                  
							</div>     
					   </div>
					    <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								  <input class="form-control" name = 'v2' type="text" /> 
								</div>                  
							</div>     
					    </div>
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input class="form-control positive numeric" name = 'v3' type="text" /> 
								</div>                  
							</div>     
					    </div>
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
								  <input class="form-control" name = 'v4' type="text" /> 
								</div>                  
							</div>     
					    </div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_5;?></span>
								  <input class="form-control" name = 'v5' type="text" /> 
								</div>                  
							</div>     
					    </div>
						
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_7;?></span>
								  <input class="form-control optional" name = 'v6' type="text" /> 
								</div>                  
							</div>     
					    </div>

                     <div class="form-group">
                       <div class="col-lg-6">

                        <button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo ($lang == 1 ? "  যোগ করুন " : " Save");?></button>
                       
		       </div>
                     </div>



                    </fieldset>
                </form>
            
