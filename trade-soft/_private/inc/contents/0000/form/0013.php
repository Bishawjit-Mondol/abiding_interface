<?
	$label_1 =  ($lang == 1 ? "অনুবাদ 1 " : "Product Catagory Name ");
	$label_2 =  ($lang == 1 ? "অনুবাদ 1 " : "Parent Category"); 
	$label_3 =  ($lang == 1 ? "অনুবাদ 1 " : "Add");

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
									<? $inp->d2_array_drop_down("v2",$qur->custom_select_query("SELECT * FROM post p;"), req('v2'),'' , 'form-control optional'); ?>
								</div>                   
							</div>     
						</div>
                        <div class="form-group">
                            <div class="col-lg-12">
                                <button type="button" class="btn btn-primary btn-submit-form"><i class="fa fa-save"></i> Save</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
           