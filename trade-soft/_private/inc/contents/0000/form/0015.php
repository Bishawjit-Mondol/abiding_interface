<?
	$label_1 =  ($lang == 1 ? "তারিখ" : "Date");
	$label_2 =  ($lang == 1 ? "স্টাফের নাম" : "Staff Name"); 
	$label_3 =  ($lang == 1 ? "অনুমদনের খাত" : "Head Name");
	$label_4 =  ($lang == 1 ? "টাকার পরিমান" : "Amount");
	$label_5 =  ($lang == 1 ? "মন্তব্য" : "Comments");
	$label_6 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   	<div class="form-group">
							<div class = 'col-lg-12'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text" id = 'form_0015_d1'  name="d1"  class="form-control date" />       
				                       	<script>
				                       		$("#form_0015_d1").val($("#entryday").val());
				                       		$('.date').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
				                       	</script>	           
		          		           </div>									
							</div>
						</div>
                       <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
									<? $inp->d2_array_drop_down("v1",$qur->custom_select_query("SELECT * FROM post p;"), req('v2'),'' , 'form-control'); ?>
								</div>                   
							</div>     
						</div>
					  
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
									<? $inp->d2_array_drop_down("v2",$qur->custom_select_query("SELECT * FROM post p;"), req('v2'),'' , 'form-control'); ?>
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
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$label_5;?></span>
								  <input class="form-control optional" name = 'v4' type="text" /> 
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
           