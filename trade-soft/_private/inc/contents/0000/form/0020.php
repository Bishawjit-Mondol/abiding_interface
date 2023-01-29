<?
	$label_1 =  ($lang == 1 ? "লেনদেনের ধরণ" : "Type");
	$label_2 =  ($lang == 1 ? "তারিখ" : "Date"); 
	$label_3 =  ($lang == 1 ? "ব্যক্তি " : "Transaction With");
	$label_4 =  ($lang == 1 ? "লেনদেনের খাত" : "Transaction Head");
	$label_5 =  ($lang == 1 ? "নগদ / ব্যাংক" : "Cash/Bank");
	$label_6 =  ($lang == 1 ? "টাকার পরিমান" : "Amount");
	$label_7 =  ($lang == 1 ? "পদ্ধতি" : "Method");
	$label_8 =  ($lang == 1 ? "ব্যাংকের নাম" : "Bank Name");
	$label_9 =  ($lang == 1 ? "চেক নাম্বার" : "Cheque Number");
	$label_10 =  ($lang == 1 ? "ব্রাঞ্চের নাম" : "Branch Name");
	$label_11 =  ($lang == 1 ? "চেকের তারিখ" : "Cheque Date");
	$label_12 =  ($lang == 1 ? "মন্তব্য" : "Comment");
	$label_13 =  ($lang == 1 ? "সম্পন্ন করুন" : "Process");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   <div class="form-group">
							<div class = 'col-lg-12'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_2;?> </span><input type="text" id = 'form_0020_d1'  name="d1"  class="form-control date" />       
				                       	<script>
				                       		$("#form_0020_d1").val($("#entryday").val());
				                       		$('.date').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
				                       	</script>	           
		          		           </div>									
							</div>
						</div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
									<select name="v1" class="form-control">
										<option></option>
										<option value="1">Receiving</option>
										<option value="-1">Paying</option>
									</select>
								</div>                   
							</div>     
						</div>
					   	
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
									<input class="form-control " name = 'v2' type="text" /> 
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
									<select name="v3" class="form-control">
										<option></option>
										<option value="1">dummy 1</option>
										<option value="2">dummy 2</option>
									</select>
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_5;?></span>
									<select name="v4" class="form-control">
										<option></option>
										<option value="1">dummy 1</option>
										<option value="2">dummy 2</option>
									</select>
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$label_6;?></span>
								  <input class="form-control " name = 'v5' type="text" /> 
								</div>                   
							</div>     
					   </div>

					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_7;?></span>
									<select name="v6" class="form-control">
										<option></option>
										<option value="1">Check</option>
										<option value="2">Cash</option>
									</select>
								</div>                   
							</div>     
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_8;?></span>
								  <input class="form-control " name = 'v7' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_9;?></span>
								  <input class="form-control " name = 'v8' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_10;?></span>
								  <input class="form-control " name = 'v9' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_11;?> </span><input type="text" id = 'form_0020_d2'  name="d2"  class="form-control date" />       
				                       	<script>
				                       		$("#form_0020_d2").val($("#entryday").val());
				                       		$('.date').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
				                       	</script>	           
		          		           </div>									
							</div>
						</div>
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_12;?></span>
								  <input class="form-control optional" name = 'v10' type="text" /> 
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
            
