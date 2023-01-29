<?
	$label_1 =  ($lang == 1 ? "শোরুমের নাম" : "Showroom Name ");
	$label_2 =  ($lang == 1 ? "ঠিকানা" : "Address"); 
	$label_3 =  ($lang == 1 ? "যোগ করুন" : "Add");

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
								  <input class="form-control" name = 'v2' type="text" /> 
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
           