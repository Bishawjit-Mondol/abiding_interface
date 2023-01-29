<?php
	$label_2 =  ($lang == 1 ? "কর্মকর্তা / কর্মচারী" : "Employee");
	$label_1 =  ($lang == 1 ? "  রিপোর্ট দোখান" : "  Show Report");
	$label_4 =  ($lang == 1 ? "তারিখ " : "Date");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
<legend><?php echo $page_title; ?> </legend>
						<div class="form-group">

							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
				                       		<span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       		<?php echo $label_4;?> </span><input type="text"  name="date"  class="form-control date date-inactive" />       
		          		        </div>									
							</div>

							<div class = 'col-lg-5'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon  input-label"><i class="fa fa-user"></i> <?=$label_2;?></span>
						               <select name = 'sales_by'   class = 'sales_by form-control' > 
												<option></option>
												<?php $det = $qur->custom_select_query( "SELECT idstaff, CONCAT(staff_name, ' : ', post_name, ' ( ' , division_name, ' ) ') as name FROM staff s LEFT JOIN post USING(idpost) LEFT JOIN division USING(iddivision) WHERE iddivision = 2 ORDER BY staff_name");  ?>
												<?php foreach($det as $d){ ?>
													<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
												<?php } ?>	
						               </select>

								</div>                  
							</div>

					    
							<div class = 'col-lg-2'>
								<div class="input-group margin-bottom-sm">
										<button type="button" class="btn btn-primary btn-show-report box-report link<?php echo req('sub'); ?>"  data = "" ><i class="fa fa-files-o"></i><?php echo $label_1;?></button>
								</div>                  
							</div>     

					   </div>



                    </fieldset>
                </form>
            
