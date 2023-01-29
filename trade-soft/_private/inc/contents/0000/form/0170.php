<?

	$label_1 =  ($lang == 1 ? "ক্রয় কোড" : "Purchase Code"); 
	$label_1x =  ($lang == 1 ? " রিপোর্ট দেখুন" : " Show Report");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
						<div class="form-group">
							
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-label"> <? echo $label_1;?></span>
									<select name = 'v1' class = 'form-control integer'>
										<option></option>
										<?php $det = $qur->custom_select_query( "SELECT * FROM purchase_code WHERE purchase_open=1;");  ?>
										<?php foreach($det as $d){ ?>
											<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
											<?php } ?>	
									</select>
								</div>                   
							</div>
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
										<button type="button" class="btn btn-primary btn-show-report box-report link<?php echo req('sub'); ?>"  data = "" ><i class="fa fa-files-o"></i><?php echo $label_1x;?></button>
								</div>                  
							</div>     

					   </div>



                    </fieldset>
                </form>
            
