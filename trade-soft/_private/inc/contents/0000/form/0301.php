<?
	$label_2 =  ($lang == 1 ? "কর্মচারীর নাম" : "Employee Name"); 
	$label_2x =  ($lang == 1 ? "অনুমোদনের তারিখ" : "Grant Date"); 
	$label_1 =  ($lang == 1 ? "রিপোর্ট দোখান" : "Show Report");
	$label_5 =  ($lang == 1 ? "কর্ম ঘন্টা" : "Working Hour");
	$label_3 =  ($lang == 1 ? "কাজ করেছেন" : "Worked");
	$label_4 =  ($lang == 1 ? "অনুমোদোন কৃত পরিমান" : "Granted Amount");
	$label_5a =  ($lang == 1 ? "অনুমোদনের খাত" : "Granted On Head");
	$label_5b =  ($lang == 1 ? "বেতন" : "Salary");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>

						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="add-on input-group-addon input-group-addon-2x">
										<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
										<?php echo $label_2x; ?>
									</span>
									<input type="text"  name = 'vd'  class="form-control date " />
								</div>
							</div>
						</div>


						
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_5;?></span>
								  
								  <select name = 'v1' class = 'form-control work-hour-total'>
									  <?php
										for($i=1; $i<450; $i++){
											echo "<option >$i</option>";
										}
									  ?>
								  </select>
								  
								</div>                  
							</div>
					   </div>
					   
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_5a;?></span>
								  <select name = 'v2' class = 'form-control trn-head' did = '1'>
										<option></option>
								  </select>
								</div>                  
							</div>
					   </div>
		
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-user"></i> <?=$label_2;?></span>
								  <select name = 'c1' class = 'form-control employee generate-payable-employee'>
										<option></option>
								  </select>
								</div>                  
							</div>
					   </div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_5b;?></span>
								  <input type = 'text' name = 'v5' class = 'form-control employee-sallary' />
										
								  
								</div>                  
							</div>
					   </div>


						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input type = 'text' name = 'v3' class = 'form-control worked-hour' />
								</div>                  
							</div>
					   </div>
					   
					   	<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
								  <input type = 'text' name = 'v4' class = 'form-control granted-ammount' />
								</div>                  
							</div>
					   </div>
					   
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> <?php echo ($lang ? "সংরক্ষন" : "Save"); ?> </button>
								
							</div>
						</div>




                    </fieldset>
                </form>
            

