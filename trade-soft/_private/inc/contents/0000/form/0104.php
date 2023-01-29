<?
	$label_1 =  ($lang == 1 ? "কমিশন গ্রহীতা " : "Commission Receiver");
	$label_2 =  ($lang == 1 ? "কোম্পানি" : "Company"); 
	$label_3 =  ($lang == 1 ? "বিস্তারিত" : "Remarks");
	
?>

                <form class="bs-example form-horizontal link<?=$_REQUEST['sub'];?>" id = "form<?=$_REQUEST['sub'];?>">
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
								  <?php $inp->d2_array_drop_down("v2",$qur->custom_select_query("SELECT idcompany, company_name FROM company WHERE company_type=1;"), req('v2'),'' , 'form-control'); ?>
								</div>                  
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input class="form-control" name = 'v3' type="text" /> 
								</div>                   
							</div>     
					   </div>

                        <div class="form-group">
                            <div class="col-lg-12">
								<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> Save</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            