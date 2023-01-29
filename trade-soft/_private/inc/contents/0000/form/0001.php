<?
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

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
                        <div class="form-group">
							<div class = 'col-lg-12'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text" id = 'form_0001_d1'  name="d1"  class="form-control date" />       
				                       	<script>
				                       		$("#form_0001_d1").val($("#entryday").val());
				                       		$('.date').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
				                       	</script>	           
		          		           </div>									
							</div>
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								  <input class="form-control" name = 'v1' type="text" /> 
								</div>                  
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input class="form-control numeric" name = 'v2' type="text" /> 
								</div>                   
							</div>     
					   </div>
					  <!-- <div class="form-group" hidden>
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><? //=$label_4;?></span>
								  <input class="form-control optional" value="1000000000" name = 'v3' type="text" /> 
								</div>                   
							</div>     
					   </div>
					  
					   <div class="form-group" hidden>
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><? //=$label_5;?></span>
								  <input class="form-control optional" name = 'v4' value="0" type="text" /> 
								  <span class="input-group-addon input-group-addon-small">%</span> 
								</div>                   
							</div>  
					   </div>
					    -->
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_6;?></span>
								  <input class="form-control" name = 'v5' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_7;?></span>
								  <input class="form-control" name = 'v6' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_8;?></span>
								  <input class="form-control" name = 'v7' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_9;?></span>
								  <input class="form-control" name = 'v8' type="text" /> 
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
            
