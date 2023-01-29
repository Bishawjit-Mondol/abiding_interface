<?
	$label_2 =  ($lang == 1 ? "কোম্পানির নাম" : "Lender Name"); 
	
	$label_1 =  ($lang == 1 ? "রিপোর্ট দোখান" : "Show Report");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
						<div class="form-group">
							<div class = 'col-lg-10'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-user"></i> <?=$label_2;?></span>
									<? $inp->d2_array_drop_down("c1",$qur->custom_select_query("SELECT * FROM lender;"), '','' , 'form-control'); ?>
							  
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
            
