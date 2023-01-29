<?php 
	$label_2 =  ($lang == 1 ? " অ্যাকাউন্ট নাম" : "Account Name "); 
	$label_3 =  ($lang == 1 ? " খাত " : "Head ");
	$label_1 =  ($lang == 1 ? " রিপোর্ট দেখুন " : " Show Report");
	$cash_point = $qur->custom_select_query("SELECT idmestablishment,mestablishment_name,mestablishment_type FROM mestablishment m  WHERE idmestablishment NOT IN(1,5) ORDER BY mestablishment_type");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   
					   
						<div class="form-group">
							     
							<div class = 'col-lg-8'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-building-o"></i> <?=$label_3;?></span>
								  <select name = 'c2' class = 'form-control trn-head' ><option></option></select>
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
            
