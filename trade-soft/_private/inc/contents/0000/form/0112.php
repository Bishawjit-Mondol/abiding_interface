<?
	$label_1 =  ($lang == 1 ? "ব্যাংক নাম " : "Bank Name");
	$label_2 =  ($lang == 1 ? "প্রারম্বিক অক্ষর " : "Initial Character "); 
	
	$label_3 =  ($lang == 1 ? " প্রথম ক্রম নং" : "Start Serial No.");
	$label_4 =  ($lang == 1 ? "শেষের ক্রম নং " : "End Serial No.");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					  
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
										<select name = 'v1'   class = ' form-control' > 
												<option></option>
												<?php $det = $qur->custom_select_query( " SELECT idbank, mestablishment_name FROM mestablishment LEFT JOIN mestablishment_bank USING(idmestablishment) WHERE mestablishment_type=2;");  ?>
												<?php foreach($det as $d){ ?>
													<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
												<?php } ?>	
										</select>
								</div>                  
							</div>     
					   </div>
					    <div class="form-group">
							<div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong> <?php echo ($lang? ' চেকের পাতার বিস্তারিত ' :' Cheque Leaf Info. ');?> </strong> </span>
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
								  <input class="form-control numeric positive" name = 'v3' type="text" /> 
								</div>                  
							</div>     
					    </div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
								  <input class="form-control numeric positive" name = 'v4' type="text" /> 
								</div>                  
							</div>     
					    </div>

                     <div class="form-group">
                       <div class="col-lg-6">

                        <button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo ($lang == 1 ? "  যোগ করুন " : " Save");?> </button>
                       
		       </div>
                     </div>



                    </fieldset>
                </form>
            
