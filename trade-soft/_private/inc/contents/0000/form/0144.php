<?php 
	$label_1 =  ($lang == 1 ? "নিবন্ধন তারিখ" : "Registration Date");
	$label_2 =  ($lang == 1 ? "কোম্পানির নাম" : "Company Name"); 
	$label_3 =  ($lang == 1 ? "প্রারম্ভিক বেলেন্স" : "Opening Balance");
	$label_4 =  ($lang == 1 ? "কোম্পানির সর্বোচ্চ বাকি " : "Company Creditlimit");   
	$label_5 =  ($lang == 1 ? "কোম্পানির কমিশন" : "Company Comission");
	$label_6 =  ($lang == 1 ? "ঠিকানা" : "Address");
	$label_7 =  ($lang == 1 ? "ফোন নাম্বার" : "Phone");
	$label_8 =  ($lang == 1 ? "যার সাথে যোগাযোগ" : "Contact Person");
	$label_9 =  ($lang == 1 ? "তার ফোন নাম্বার" : "Contact Person Phone");
	$label_10 =  ($lang == 1 ? "যোগ করুন" : "Add");

	$id = req('id'); 
	$det = $qur->custom_select_query("SELECT * FROM (SELECT * FROM company WHERE idcompany=$id) as a LEFT JOIN company_details USING(idcompany);");
	//echo "SELECT * FROM (SELECT * FROM company WHERE idcompany=$id) as a LEFT JOIN company_details USING(idcompany);";
?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
                        <div class="form-group">
							<div class = 'col-lg-12'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text" name="d1" value="<?php echo date('d-m-Y', strtotime($det[0][11]));?>" class="form-control date" />       
				                      	           
		          		           </div>									
							</div>
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								  <input class="form-control" name = 'v1' value="<?php echo $det[0][1]?>" type="text" /> 
								</div>                  
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input readonly class="form-control" name = 'v2' value="<?php echo $det[0][2]?>" type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <!--
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><? //echo $label_4;?></span>
								  <input class="form-control" name = 'v3' value="<?php //echo $det[0][3]?>" type="text" /> 
								</div>                   
							</div>     
					   </div>
					   
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><? //=$label_5;?></span>
								  <input class="form-control" name = 'v4' value="<?php //echo $det[0][10]?>" type="text" /> 
								  <span class="input-group-addon input-group-addon-small">%</span> 
								</div>                   
							</div>  
					   </div>
					   -->
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_6;?></span>
								  <input class="form-control" name = 'v5' value="<?php echo $det[0][5]?>" type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_7;?></span>
								  <input class="form-control" name = 'v6' value="<?php echo $det[0][4]?>" type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_8;?></span>
								  <input class="form-control" name = 'v7' value="<?php echo $det[0][8]?>" type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_9;?></span>
								  <input class="form-control" name = 'v8' value="<?php echo $det[0][9]?>" type="text" /> 
								</div>                   
							</div>     
					   </div>
                        <div class="form-group">
                            <div class="col-lg-12">
								<input class="form-control" name = 'v0' value="<?php echo $det[0][0]?>" type="hidden" /> 
								<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> Save</button>
							</div>
                        </div>



                    </fieldset>
                </form>
            
