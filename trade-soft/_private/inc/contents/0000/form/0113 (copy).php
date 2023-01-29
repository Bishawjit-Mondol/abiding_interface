<?php
	$label_2 =  ($lang == 1 ? "কোম্পানির নাম" : "Cash / Bank"); 
	$label_3 =  ($lang == 1 ? "শোরুম / গুদাম " : "Head");
	$label_1 =  ($lang == 1 ? "রিপোর্ট দোখান" : "Show Report");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
						<div class="form-group">
							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-"></i> <?=$label_2;?></span>
									<?php  $inp->d2_array_drop_down("c1",$qur->custom_select_query("SELECT idmestablishment, mestablishment_name FROM mestablishment ;"), '','' , 'form-control'); ?>
							   </div>                  
							</div>     
							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-"></i> <?=$label_3;?></span>
								  <?php  $inp->d2_array_drop_down("c2",$qur->custom_select_query("SELECT idtransaction_head, transaction_head_name FROM transaction_head  ORDER BY transaction_head_name;"), '','' , 'form-control'); ?>
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
            
