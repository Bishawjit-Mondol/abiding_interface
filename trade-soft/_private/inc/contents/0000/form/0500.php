<?
	$label_1 =  ($lang == 1 ? "??????? ?????" : "Registration Date");
	$label_2 =  ($lang == 1 ? "????????? ???" : "Company Name"); 
	$label_3 =  ($lang == 1 ? "?????????? ???????" : "Opening Balance");
	$label_4 =  ($lang == 1 ? "????????? ???????? ???? " : "Company Creditlimit"); 
	$label_5 =  ($lang == 1 ? "????????? ?????" : "Company Comission");
	$label_6 =  ($lang == 1 ? "??????" : "Address");
	$label_7 =  ($lang == 1 ? "??? ???????" : "Phone");
	$label_8 =  ($lang == 1 ? "??? ???? ???????" : "Contact Person");
	$label_9 =  ($lang == 1 ? "??? ??? ???????" : "Contact Person Phone");
	$label_10 =  ($lang == 1 ? "??? ????" : "Add");

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
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_9;?></span>
								  <select class="form-control client" name = 'v8' type="text"  >
								  </select>
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
            
