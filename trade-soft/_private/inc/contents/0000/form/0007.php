<?
	$label_1 =  ($lang == 1 ? "একাউন্টের নাম" : "Account Name");
	$label_2 =  ($lang == 1 ? "প্রারম্ভিক বেলেন্স" : "Opening Balance"); 
	$label_3 =  ($lang == 1 ? "ঠিকানা" : "Address");
	$label_4 =  ($lang == 1 ? "নিবন্ধনের তারিখ" : "Registration Date");
	$label_5 =  ($lang == 1 ? "মন্তব্য" : "Comments");
	$label_6 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal link<?=$_REQUEST['sub'];?>" id = "form<?=$_REQUEST['sub'];?>">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   <div class="form-group">
							<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">				                     
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_4;?> </span><input type="text" id = 'form_0007_d1'  name="d1"  class="form-control date" />       
				                       		           
		          		           </div>									
								</div> 
					    </div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
								  <input class="form-control" name = 'v1' type="text" /> 
								</div>                  
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								  <input class="form-control numeric positive" name = 'v2' type="text" /> 
								</div>                  
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input class="form-control" name = 'v3' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$label_5;?></span>
								  <input class="form-control optional" name = 'v4' type="text" /> 
								</div>                   
							</div>     
					   </div>

                        <div class="form-group">
                            <div class="col-lg-6">
				<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo ($lang == 1 ? "  যোগ করুন " : " Save");?> </button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            
