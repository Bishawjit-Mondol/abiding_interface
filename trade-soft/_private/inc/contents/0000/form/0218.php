<?
	$label_2 =  ($lang == 1 ? "কোম্পানির নাম" : "Company Name"); 
	$label_3 =  ($lang == 1 ? "শোরুম / গুদাম " : "Showroom / Godowm");
	$label_1 =  ($lang == 1 ? "রিপোর্ট দোখান" : "Show Report");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
						<div class="form-group">
							<div class = 'col-lg-10'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-user"></i> <?=$label_2;?></span>
								  <select name = 'c1' class = 'form-control supplier' /></select>
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
            
