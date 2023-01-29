<? 
	$label_1 =  ($lang == 1 ? "পণ্যের নাম" : "Product Name");
	$label_2 =  ($lang == 1 ? "পণ্যের ধরণ" : "Product Category"); 
	$label_3 =  ($lang == 1 ? "ইউনিট" : "Unit");
	//$label_4 =  ($lang == 1 ? "ক্রয়/ তৈরি খরচ" : "Purchase/Making Cost");
	//$label_5 =  ($lang == 1 ? "খুচরা মূল্য" : "Retail Price");
	$label_4 =  ($lang == 1 ? "পন্যের এম।পি।পি " : "Product mpp");
	$label_5 =  ($lang == 1 ? " পন্যের এম।আর।পি " : "Product mrp");
	$label_5x =  ($lang == 1 ? "মূল্য কোড" : "Price Code");
	$label_6x =  ($lang == 1 ? "পন্যের প্রকার" : "Product Type");
	$label_6 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
                        <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
								  <input class="form-control" name = 'v1' type="text" /> 
								</div>                  
							</div>     
					   </div>
					  
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
									<? $inp->d2_array_drop_down("v2",$qur->custom_select_query("SELECT * FROM product_catagory;"), '','' , 'form-control'); ?>
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
									<? $inp->d2_array_drop_down("v3",$qur->custom_select_query("SELECT * FROM unite;"), '','' , 'form-control'); ?>
								</div>                   
							</div>     
						</div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
								  <input class="form-control positive numeric" name = 'v4' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$label_5;?></span>
								  <input class="form-control positive numeric" name = 'v5' type="text" /> 
								</div>                   
							</div>     
					   </div>

					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$label_6x;?></span>
								  <select class="form-control" name = 'v6x'> 
									  <option value = '2'><?=($lang == 1 ? "ফিটিংস" : "Fittings");?></option>
									  <option value = '1'><?=($lang == 1 ? "পাইপ" : "Pipe");?></option>
								  </select>	  
								</div>                   
							</div>     
					   </div>


                        <div class="form-group">
                           <div  class="col-lg-4">
				<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo($lang ? "সেভ করুন" : "Save" );?></button>
				 </div>
                        </div>
                    </fieldset>
                </form>
            
