<?
	$label_2 =  ($lang == 1 ? "পন্য" : "Product"); 
	$label_3 =  ($lang == 1 ? "সংখ্যা" : "Number");
	$label_1 =  ($lang == 1 ? "কোড প্রস্তুত করুন" : "Ready Code");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
						<div class="form-group">
							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								  <select name = 'c1' class = 'form-control product' did = '' /></select>
								</div>                  
							</div>     
							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"> <?=$label_3;?></span>
								  <select name = 'c2' class = 'form-control' >
								  <?php
									for($i=5; $i < 75; $i = $i + 5){
										echo "<option>$i</option>";
									}
								  ?>
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
            
