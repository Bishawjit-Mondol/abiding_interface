<?
	$label_2 =  ($lang == 1 ? "পণ্যের নাম" : "Product Name"); 
	$label_3 =  ($lang == 1 ? "শোরুম / গুদাম " : "Showroom / Godowm");
	$label_1 =  ($lang == 1 ? "রিপোর্ট দোখান" : "Show Report");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><? echo req('cat_name');  ?> <? echo ($lang == 1  ? " মজুদ" : " Stock");  ?></legend>
						<div class="form-group">
							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-user"></i> <?=$label_2;?></span>
								  <select name = 'c1' class = 'form-control product' did='<?php echo req('cat_id'); ?>' /></select>
								</div>                  
							</div>     
							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-building-o"></i> <?=$label_3;?></span>
								  <select name = 'c2' selected-value='1' class = 'form-control showroom godown' /></select>
								</div>                  
							</div>     
							<div class = 'col-lg-2'>
								<div class="input-group margin-bottom-sm">
										<button type="button" class="btn btn-primary btn-show-report box-report link<?php echo req('sub'); ?>"  data = "" ><i class="fa fa-files-o"></i><?php echo $label_1;?></button>
						               <input type = 'hidden' name = 'cat_id' class = 're-cycle  optional' rdata = '<? echo $_REQUEST['cat_id'];?>'  value = '<? echo $_REQUEST['cat_id'];?>' />
<input type = 'hidden' name = 'cat_name' class = 're-cycle optional' rdata = '<? echo $_REQUEST['cat_name'];?>'  value = '<? echo $_REQUEST['cat_name'];?>' />
								</div>
                  
							</div>     

					   </div>



                    </fieldset>
                </form>
            
