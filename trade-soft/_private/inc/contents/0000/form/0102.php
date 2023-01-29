<?
	$label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "প্রারম্ভিক বেলেন্স" : "Lender"); 
	$label_3 =  ($lang == 1 ? "ঠিকানা" : "Loan Type");
	$label_5 =  ($lang == 1 ? "মন্তব্য" : "Loan Ammount");
	$label_4 =  ($lang == 1 ? "নিবন্ধনের তারিখ" : "Have To Paid Back");
	
	

?>

                <form class="bs-example form-horizontal link<?=$_REQUEST['sub'];?>" id = "form<?=$_REQUEST['sub'];?>">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   <div class="form-group">
							<div class = 'col-lg-12'>
									<div class="input-group margin-bottom-sm">				                     
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text" id = 'form_0102_d1'  name="d1"  class="form-control date" />       
				                       	<script>
				                       		$("#form_0102_d1").val($("#entryday").val());
				                       		$('.date').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
				                       	</script>	           
		          		           </div>									
								</div> 
					    </div>
                        <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								  <?php $inp->d2_array_drop_down("v1",$qur->custom_select_query("SELECT idlender, lender_name FROM lender;"), req('v3'),'' , 'form-control'); ?>
								</div>                  
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <select name="v2" class="form-control">
										<option></option>
										<option value="1">Paying Loan</option>
										<option value="2">Receiving Loan</option>
									</select>
								</div>                   
							</div>     
					   </div>
					   
					   
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_5;?></span>
								  <input class="form-control positive numeric positive" name = 'v4' type="text" /> 
								</div>                   
							</div>     
					   </div>

					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
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
            
