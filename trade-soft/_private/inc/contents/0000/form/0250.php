<?
    $label_1 =  ($lang == 1 ? "অনুবাদ  " : "idproduct"); 
	$label_2 =  ($lang == 1 ? " পণ্য নির্বাচন করুন " : "Select Product");
    $label_3 =  ($lang == 1 ? "পন্যের নাম " : "Product Name"); 
    $label_4 =  ($lang == 1 ? " পন্যের এম।আর।পি " : "Product mrp"); 
    $label_5 =  ($lang == 1 ? "পন্যের এম।পি।পি " : "Product mpp"); 
	$label_5x =  ($lang == 1 ? "মূল্য কোড" : "Price Code");
    $label_8 =  ($lang == 1 ? "পন্যের অবস্থা " : "Product status"); 
    $label_s = ($lang ? "হালনাগাদ করুন":"Update Product");
   
	
?>
 <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
                   
						<div class="form-group">
						<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"> <?=$label_2;?></span>
								  <select class = 'form-control product product-show-details editable-product' did=''  name = 'v1' placeholder = "Prdouct" >
								  </select>	
								</div>                  
							</div>     
						</div>
						
						<!--
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input class="form-control product_name editable-product" name = 'v2' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   -->
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input class="form-control product_name" name = 'v22' type="text" /> 
								</div>                   
							</div>     
					   </div>
			
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
								  <input class="form-control product_mrp " name = 'v2' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_5;?></span>
								  <input class="form-control product_mpp " name = 'v3' type="text" /> 
								 
								</div>                   
							</div>  
					   </div>
			
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								 <span class="input-group-addon input-group-addon-2x input-label"><?=$label_8;?></span>
									<select  class = 'form-control' name = 'v4'>
										<option value="1">Allowed</option>
										<option value="0">Not Allowed</option>
										
									</select> 
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
            
