<?
	$label_1 =  ($lang == 1 ? " সম্পূর্ণ নাম " : "Full Name");
	$label_2 =  ($lang == 1 ? " লগ ইন নাম " : "Login Name"); 
	$label_3 =  ($lang == 1 ? " পাসওয়ার্ড দিন " : "Password");
	$label_4 =  ($lang == 1 ? " পূনোরায় পাসওয়ার্ড দিন" : "Confirm Password"); 
	$label_5 =  ($lang == 1 ? " লেভেল " : "Level");
	
	$label_10 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal" >
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
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input class="form-control" name = 'v3' type="password" /> 
								</div>                   
							</div>     
					   </div>
					  
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
								  <input class="form-control" name = 'v4' type="password" /> 
								  
								</div>                   
							</div>  
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_5;?></span>
								   <select  class = 'form-control' name = 'v5'>
										<option> </option>
										<option value="0"> Management (Business) </option>
										<option value="1"> Management(IT) </option>
										<option value="2"> Admin </option>
										<option value="3"> Accounts </option>
										<option value="4"> Sales </option>
										<option value="5"> Marketing </option>
										<option value="6"> Stock </option>
									</select> 
								</div>                   
							</div>     
					   </div>
					 
                        <div class="form-group">
                            <div class="col-lg-12">
                             <button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo ($lang == 1 ? "নিশ্চিত করুন " : "Confirm"); ?> </button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            
