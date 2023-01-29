<?
	$label_1 =  ($lang == 1 ? "পণ্যের ধরনের নাম" : "Product Catgory Name"); 
	$label_2 =  ($lang == 1 ? "Catagory Parent" : "Catagory Parent");
	$label_3 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal">
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
									<span class="input-group-addon  input-group-addon-2x"><?=$label_2;?></span>
									<? $inp->d2_array_drop_down("v2",$qur->custom_select_query("SELECT * FROM product_catagory ORDER BY idproduct_catagory_parent;"), req('v2'),'' , 'form-control optional'); ?>
								</div>                   
							</div>     
						</div>
					   
                        <div class="form-group">
                            <div  class="col-lg-4">
				<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> Save</button>
				<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "2" ><i class="fa fa-lightbulb-o"></i> Propose</button>
			     </div>
                        </div>



                    </fieldset>
                </form>
           
