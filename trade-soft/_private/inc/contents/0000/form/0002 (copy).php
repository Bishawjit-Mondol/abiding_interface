<?
	$label_1 =  ($lang == 1 ? "নিবন্ধন তারিখ" : "Registration Date");
	$label_2 =  ($lang == 1 ? "কর্মকর্তা / কর্মচারীর নাম" : "Employee Name"); 
	$label_3 =  ($lang == 1 ? "পদবী" : "Deignation");
	$label_4 =  ($lang == 1 ? "প্রারম্ভিক বেলেন্স" : "Opening Balance");
	
	$label_d1 =  ($lang == 1 ? "কমিশনের হার" : "Sales Incentive Rated");
	$label_d1 =  ($lang == 1 ? "মোবাইল নম্বর" : "Cell-Phone");	
	$label_d2 =  ($lang == 1 ? "পিতার নাম" : "Father's Name");	
	$label_d3 =  ($lang == 1 ? "জন্ম তারিখ" : "Date Of Birth");	
	$label_d4 =  ($lang == 1 ? "শিক্ষগত যোগ্যতা" : "Educational Qualification");	
	$label_d5 =  ($lang == 1 ? "স্থায়ী ঠিকানা" : "Parmanent Address");	
	$label_d6 =  ($lang == 1 ? "জাতীয় পরিচয় পত্র" : "National Id");	
	$label_d7 =  ($lang == 1 ? "‌সুপারিশকারি" : "Reference");							
	$label_d8 =  ($lang == 1 ? "যোগদানের তারিখ" : "Joining Date");	
	
								
	$label_6_a =  ($lang == 1 ? "মন্তব্য" : "Remarks");
	$label_6 =  ($lang == 1 ? "এই কর্মকর্তা / কর্মচারীকে যোগ করুন" : "Add This Employee");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   	<div class="form-group">
							<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text"  name="d1"  class="form-control date" />       
        
		          		           </div>									
							</div>
						</div>
						
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								  <input class="form-control" name = 'v1' type="text" /> 
								</div>                  
							</div>     
					   </div>
					  
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
									<? $det = $qur->custom_select_query("SELECT idpost,iddivision,division_name,post_name FROM post LEFT JOIN division USING(iddivision) ORDER BY division_priority DESC, division_name, post_name;"); ?>
									
									<select name = 'v2' class ='form-control'>
										<option></option>
										<?php 
											$pd = null;
											$i = 0;
											foreach($det as $d){
												
												if($pd != $d[1]){
													if($i>0){
														echo "</optgroup>";
													}
													echo "<optgroup label = '".$d[2]."'>";
													echo "<option value = '".$d[0]."'>".$d[3]."</option>";
													
													
												}
												else{
												}
												$i++;
											
											}
											echo "</optgroup>";
										?>
									</select>
									
								</div>                   
							</div>     
						</div>
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
								  <input class="form-control" name = 'v3' type="text" /> 
								  <span class="input-group-addon input-label">৳</span>
								</div>                   
							</div>     
					   </div>
					   

                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_d1;?></span>
								  <input class="form-control" name = 'dv1' type="text" /> 
								</div>                  
							</div>     
					   </div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_d2;?></span>
								  <input class="form-control" name = 'dv2' type="text" /> 
								</div>                  
							</div>     
					   </div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_d3;?></span>
								  <input class="form-control date" name = 'dv3' type="text" /> 
								</div>                  
							</div>     
					   </div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_d4;?></span>
								  <select class="form-control" name = 'dv4'> 
									  <option></option>
							      </select> 
								</div>                  
							</div>     
					   </div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_d5;?></span>
								  <input class="form-control" name = 'dv5' type="text" /> 
								</div>                  
							</div>     
					   </div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_d6;?></span>
								  <input class="form-control" name = 'dv6' type="text" /> 
								</div>                  
							</div>     
					   </div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_d7;?></span>
								  <input class="form-control" name = 'dv7' type="text" /> 
								</div>                  
							</div>     
					   </div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_d8;?></span>
								  <input class="form-control date" name = 'dv8' type="text" /> 
								</div>                  
							</div>     
					   </div>


					   
					   
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$label_6_a;?></span>
								  <input class="form-control optional" name = 'v4' type="text" /> 
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
            
