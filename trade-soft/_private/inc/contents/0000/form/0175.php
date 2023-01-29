<?
	$label_1 =  ($lang == 1 ? " রিপোর্ট দেখুন" : " Show Report");
	$label_2 =  ($lang == 1 ? " কোম্পানি" : " Company");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
						<div class="form-group">
						
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="add-on input-group-addon input-group-addon-2x"><?php echo $label_2; ?> </span>
									<select type="text" name = 'v1' class="form-control client" >
									</select>
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
            
