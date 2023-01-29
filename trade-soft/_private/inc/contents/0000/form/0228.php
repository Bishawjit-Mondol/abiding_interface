<?
	$label_1 =  ($lang == 1 ? " কর্মচারী / কর্মকর্তার নাম" : "Employee Name"); 
	$label_2 =  ($lang == 1 ? "ধরণ" : "Type");
	$label_3 =  ($lang == 1 ? "তারিখ" : "Date"); 
	$label_4 =  ($lang == 1 ? " সময়( ঘণ্টা : সেকেন্ড ) " : "Time ( Hour : Second )"); 

?>

                <form class="bs-example form-horizontal" >
                    <fieldset>
                       <legend><?=$page_title;?></legend>
                       
					   <div class="form-group">
						<div class = 'col-lg-12'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_3;?> </span><input type="text" name="d1"  class="form-control date" />       
				                                  
		          		           </div>									
							</div>
						</div>	
						
						<div class="form-group">
							<div class = 'col-lg-4'>
									<div class="input-group margin-bottom-sm">             
				                       <span class="add-on input-group-addon input-group-addon-2x"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_4;?> </span>
										<select name="h1" class="form-control">
											<?php for($i=0;$i<=23;$i++){ ?>
											<option <?php echo "value='".$i."'";?>> <?php echo $i;?></option>
											<?php } ?>
										</select>         
		          		           </div>									
							</div>
						
							<div class = 'col-lg-2'>
									<div class="input-group margin-bottom-sm">   
									<span class="add-on input-group-addon input-group-addon-1x">
				                       	<? echo ' : ';?> </span>
																		
										<select name="h2" class="form-control">
											<?php for($i=0;$i<=59;$i++){ ?>
											<option <?php echo "value='".$i."'";?>> <?php echo $i;?></option>
											<?php } ?>
										</select>
				                                  
		          		           </div>									
							</div>
							
							
								
						</div>	
						
						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
								 <? $inp->d2_array_drop_down("c1",$qur->custom_select_query("SELECT * FROM staff;"), '','' , 'form-control'); ?>
							  </div>                  
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								  <select name="c2" class='form-control'>
										<option value="1">Entry</option>
										<option value="2">Exit</option>
									</select>
								</div>                   
							</div>     
					   </div>
                        <div class="form-group">
                            <div class="col-lg-12">
                              <button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type="1"><i class="fa fa-thumbs-up"></i><?php echo($lang == 1 ? "যোগ করুন" : "Add"); ?></button>
                            </div>
                        </div>



                    </fieldset>
                </form>
            


