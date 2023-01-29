
<?php

    $label_1 =  ($lang == 1 ? "তারিখ " : "Date");  //v32
	$label_2 =  ($lang == 1 ? "সরবরাহকারী " : "Supplier"); 
	$label_3 =  ($lang == 1 ? "থেকে " : "From");   
	$label_31 =  ($lang == 1 ? "ইন/আউট" : "In/Out");   

	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_5 =  ($lang == 1 ? "মূল্যছাড় " : "Discount");   
	$label_6 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s =  ($lang ? "সমন্বয় করুন" : "Adjust");
	

	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
?>

                <form class="bs-example form-horizontal link<?=$_REQUEST['sub'];?>" id = "form<?=$_REQUEST['sub'];?>">
                    <fieldset>
                        <legend><?=$page_title;?></legend>
	                        <div class="form-group">
								
								<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-inbox' ></i> <?=$label_3;?></span>
											<select name = 'v3' class = 'form-control p-place showroom godown' >
									  		</select>

									</div>                   
								</div>     
								<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-inbox' ></i> <?=$label_31;?></span>
									  <select name = 'v31' class = 'form-control' id = 'form-0045-inout'>
										<option value='1'> IN </option>
										<option value='2'> OUT </option>
									  </select>

									</div>                   
								</div>  
								
							</div>

	                        <div class="form-group">
	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong> <?=($lang? 'পন্য' :' Product');?> </strong> </span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong><?=($lang? 'পরিমান' :' Qty');?></strong></span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><strong><?=($lang? 'ইউনিট' :' Unite');?></strong> </span>
									</div>                   
	                            </div>

	                        </div>
	                        

	                        <div class="form-group pur-data-form">

	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						                
								<select  class = 'form-control product product-show-details sales-data' did = "<?php echo req('cat_id'); ?>"  name = 'trn_product_0' placeholder = "Prdouct" >
								</select> 									
									</div>                   
	                            </div>

	                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'trn_quantity_0'  class = 'numeric positive short trn_quantity form-control' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=($lang? 'ইউনিট' :' Unite');?></span>
									</div>                   
	                            </div>


	                        </div>
							
					<? for($i=1; $i<5; $i++){ ?>
	                        <div class="form-group pur-data-form" style="">
 
	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'form-control product product-show-details optional sales-data' did = "<?php echo req('cat_id'); ?>"  name = "trn_product_<?=$i;?>" placeholder = "Prdouct" >
								</select>  									
									</div>                   
	                            </div>

                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = "trn_quantity_<?=$i;?>"  class = 'numeric positive short trn_quantity form-control optional' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=($lang? 'ইউনিট' :' Unite');?></span>
									</div>                   
	                            </div>




	                        </div>
	               <? } ?>         






	                        <div class="form-group">
								<div class = 'col-lg-4'>
									<div class="input-group margin-bottom-sm">				                     
				                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text" name="d1"  class="form-control date" />       
				                       	           
		          		           </div>									
								</div>    


	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class="fa fa-fw fa-user"></i> <? echo ($lang? 'প্রস্তুতকারী' :' Prepared By');?></span>
						               <select name = 'trn_staff'   class = 'purchase_by form-control' > 
												<option></option>
												<?php $det = $qur->custom_select_query( " SELECT idstaff, CONCAT(division_name, ' : ', post_name, ' : ' ,staff_name) as name FROM staff s LEFT JOIN post USING(idpost) LEFT JOIN division USING(iddivision) ORDER BY division_priority DESC;");  ?>
												<?php foreach($det as $d){ ?>
													<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
												<?php } ?>	
						               </select> 									
									</div>                   
	                            </div>
								<div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=($lang? ' মন্তব্য' :' Comments');?></span>
						               <input type = 'text' name = 'trn_comments'   class = 'optional trn_comments form-control' />  									
									</div>                   
	                            </div>

	                            
	                        </div>
	                        
	                      <div class="form-group">
	                          <div  class="col-lg-12">

				<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> <?php echo($lang? 'নিশ্চিত করুন' : 'Confirm'); ?></button>
	                      </div>
	                        				

				</div>                   
	                            </div>


	                        </div>
                    </fieldset>
                </form>
           


