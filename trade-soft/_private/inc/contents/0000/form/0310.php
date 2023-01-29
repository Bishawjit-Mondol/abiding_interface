<? 
	$label_1 =  ($lang == 1 ? "পন্যের এম।পি।পি " : "Category Name");
	$label_2 =  ($lang == 1 ? "পণ্যের  ধরণ" : "Product Parent Category"); 

	
	$label_6 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
									<? $inp->d2_array_drop_down("v2",$qur->custom_select_query("SELECT * FROM product_catagory WHERE product_catagory_salesable = 1;"), '','' , 'form-control'); ?>
								</div>                   
							</div>     
						</div>


                        <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
								  <input class="form-control" name = 'v1' type="text" /> 
								</div>                  
							</div>     
					   </div>
					  

                           <div  class="col-lg-4">
				<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo($lang ? "সেভ করুন" : "Save" );?></button>
				 </div>
                        </div>
                    </fieldset>
                </form>
            
