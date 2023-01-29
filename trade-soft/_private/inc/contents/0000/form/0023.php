
<?

    $label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "সরবরাহকারী " : "Supplier"); 
	$label_3 =  ($lang == 1 ? "থেকে " : "From");   
	$label_31 =  ($lang == 1 ? "এই জায়গায় " : "To");   

	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_5 =  ($lang == 1 ? "মূল্যছাড় " : "Discount");   
	$label_6 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s = ($lang? "উৎপাদন করুন": "Production");
	
?>
<?
	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                        <legend><?=$page_title;?></legend>
	                        <div class="form-group">
								
								<div class = 'col-lg-4'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-inbox' ></i> <?=$label_3;?></span>
									  <select name = 'v3' class = 'form-control' id = 'form-0032-godwon'>
											<option></option>
											<option value="1">dummy1</option>
											<option value="2">dummy2</option>
									  </select>
									</div>                   
								</div>
								
								
								<div class = 'col-lg-4'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-inbox' ></i> <?=($lang == 1 ? "মেশিন " : "Machine");?></span>
									  <select name = 'machine_0032' class = 'form-control' id = 'form-0032-machine'>
											<option></option>
											<option value="1">dummy1</option>
											<option value="2">dummy2</option>
									  </select>

									</div>                   
								</div>
     
								<div class = 'col-lg-4'>
									<div class="input-group margin-bottom-sm">
				                     
				                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text" id = 'form_0032_d1'  name="d1"  class="form-control date" />       
				                       	<script>
				                       		$("#form_0032_d1").val($("#entryday").val());
				                       		$('.date').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
				                       	</script>
	           
		          		           </div>									
								</div>     


							</div>

	                        <div class="form-group">
	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong> <?=($lang? 'ইনপুট পন্য' :'Input Product');?> </strong> </span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong><?=($lang? 'ইনপুট পরিমান' :'Input Qty');?></strong></span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><strong><?=($lang? 'ইনপুট ইউনিট' :'Input Unite');?></strong> </span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><strong><?=($lang? 'ইউনিটের দর' :'Unite Price');?></strong> </span>
									</div>                   
	                            </div>


	                        </div>
	                        

	                        <div class="form-group pur-data-form">

	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						                <select  class = 'product_0032_110 pro_product form-control numeric integer' name = 'proi_product_0' placeholder = "Prdouct" >
											<option></option>
											<option value="1">dummy1</option>
											<option value="2">dummy2</option>
										</select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'proi_qty_0' disabled  class = 'numeric positive short pro_cost form-control optional' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=($lang? 'ইনপুট ইউনিট' :'Input Unite');?></span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'proi_cost_0' disabled  class = 'numeric positive short  form-control optional' />  									
									</div>                   
	                            </div>



	                        </div>
							
					<? for($i=1; $i<10; $i++){ ?>
	                        <div class="form-group pur-data-form" style="display:none">
 
	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						                <select  class = 'product_0032_110 pro_product form-control numeric integer' name = 'proi_product_<?=$i;?>' placeholder = "Prdouct" >
											<option></option>
											<option value="1">dummy1</option>
											<option value="2">dummy2</option>
										</select>  									
									</div>                   
	                            </div>

                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'proi_qty_<?=$i;?>' disabled  class = 'numeric positive short pro_cost form-control optional' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=($lang? 'ইনপুট ইউনিট' :'Input Unite');?></span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'proi_cost_<?=$i;?>' disabled  class = 'numeric positive short  form-control optional' />  									
									</div>                   
	                            </div>




	                        </div>
	               <? } ?>         

	                        <div class="form-group">
	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong> <?=($lang? 'অাউটপুট পন্য' :'Output Product');?> </strong> </span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong><?=($lang? 'অাউটপুট পরিমান' :'Output Qty');?></strong></span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><strong><?=($lang? 'অাউটপুট ইউনিট' :'Output Unite');?></strong> </span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><strong><?=($lang? 'ইউনিটের দর' :'Unite Price');?></strong> </span>
									</div>                   
	                            </div>




	                        </div>

	                        <div class="form-group pur-data-form">

	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'product_0032_011 pro_product form-control numeric integer' name = 'proo_product_0' placeholder = "Prdouct" >
						                </select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'proo_qty_0' disabled  class = 'numeric positive short pro_cost form-control' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=($lang?  'অাউটপুট ইউনিট' :'Output Unite');?></span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'proo_cost_0' disabled  class = 'numeric positive short  form-control ' />  									
									</div>                   
	                            </div>



	                        </div>
							
					<? for($i=1; $i<0; $i++){ ?>
	                        <div class="form-group pur-data-form" style="display:none">
 
	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'product_0032_011 pro_product form-control numeric integer optional' name = 'proo_product_<?=$i;?>' placeholder = "Prdouct" >
						                </select>  									
									</div>                   
	                            </div>

                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'proo_qty_<?=$i;?>' disabled  class = 'numeric positive short pro_cost form-control optional' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=($lang? 'অাউটপুট ইউনিট' :'Output Unite');?></span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'proo_cost_<?=$i;?>' disabled  class = 'numeric positive short  form-control optional' />  									
									</div>                   
	                            </div>




	                        </div>
	               <? } ?>         




	                        <div class="form-group">
								<div class = 'col-lg-4'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-inbox' ></i> <?=$label_31;?></span>
									  <select name = 'v32' class = 'form-control' id = 'form-0032-godwon2'>
											<option></option>
											<option value="1">dummy1</option>
											<option value="2">dummy2</option>
									  </select>

									</div>                   
								</div>     


	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=($lang? ' মন্তব্য' :' Comments');?></span>
						               <input type = 'text' name = 'pro_comments'   class = 'optional pro_comments form-control' />  									
									</div>                   



	                            </div>

	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=($lang? 'প্রতি ইউনিট খরচ' :'Per Unit Cost');?></span>
						               <input type = 'text' name = 'other_cost_0032'   class = 'optional pro_comments form-control' value = '0.00' />  									
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
            
<script type="text/javascript" >
/*
	loadInfrustructure("#form-0032-godwon",  1);
	loadInfrustructure("#form-0032-godwon",  2);
	loadInfrustructure("#form-0032-godwon",  0);


	loadInfrustructure("#form-0032-godwon2",  1);
	loadInfrustructure("#form-0032-godwon2",  2);
	loadInfrustructure("#form-0032-godwon2",  0);

	loadInfrustructure("#form-0032-machine",  5);


	loadProduct(".product_0032_110","110");
	loadProduct(".product_0032_011","011");

*/


</script>


