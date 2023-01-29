<?
	$label_1 =  ($lang == 1 ? "নাম " : "Full Name");
	$label_2 =  ($lang == 1 ? " বিক্রয় কেন্দ্র " : "Godown / showroom "); 
	
	$label_10 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal" >
                    <fieldset>
                       <legend><?=$page_title;?></legend>
                        
					   <div class="form-group">
							<div class = 'col-lg-10'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-user"></i> <?=$label_1;?></span>
									<? $inp->d2_array_drop_down("v1",$qur->custom_select_query("SELECT iduser, name FROM ___users;"), '','' , 'form-control'); ?>
							  
								</div>   
								     
							</div> 
						</div>  							
					   </div>
					    <div class="form-group">
							<div class = 'col-lg-10'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								   		 	<select name = 'v2' class = 'form-control p-place showroom godown'>
												
											</select>

								</div>         
							</div>     
					   </div>
                        <div class="form-group">
                            <div class="col-lg-12">
                             <button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> <?php echo ($lang == 1 ? "নিশ্চিত করুন " : "Confirm"); ?></button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            
