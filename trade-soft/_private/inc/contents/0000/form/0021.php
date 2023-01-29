
<?
    $label_1 =  ($lang == 1 ? "তারিখ " : "Date"); 
	$label_3 =  ($lang == 1 ? "থেকে " : "From");   
	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments"); 
	$label_5 =  ($lang == 1 ? "ইন/আউট" : "In/Out");
	$label_6 =  ($lang == 1 ? "সমন্বয় করুন":"Adjust");

	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                        <legend><?=$page_title;?></legend>
	                        <div class="form-group">
								
				     <div class = 'col-lg-6'>
					  <div class="input-group margin-bottom-sm">
					      <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-inbox' ></i> <?=$label_3;?></span>
											<select name = 'v1' class = 'form-control p-place showroom godown'  id = 'form-0021-godwon'>
												
											</select>

									</div>                   
								</div>     
								<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-inbox' ></i> <?=$label_5;?></span>
									  <select name = 'v2' class = 'form-control' id = 'form-0021-inout'>
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
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'form-control  product' did='' name = 'trn_product_0' placeholder = "Prdouct" >
											
						               </select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-lebel"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'trn_quantity_0' class = 'numeric positive short trn_quantity form-control' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=($lang? 'ইউনিট' :' Unite');?></span>
									</div>                   
	                            </div>


	                        </div>
							
					<? for($i=1; $i<10; $i++){ ?>
	                        <div class="form-group pur-data-form">
 
	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'form-control  product' did=''  name = 'trn_product_<?=$i;?>' placeholder = "Prdouct" >
										
										</select>  									
									</div>                   
	                            </div>

                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'trn_quantity_<?=$i;?>'  class = 'numeric positive short trn_quantity form-control optional' />  									
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
								<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">				                     
				                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text" id = 'form_0021_d1'  name="d1"  class="form-control date" />       
				                       	<script>
				                       		$("#form_0021_d1").val($("#entryday").val());
				                       		$('.date').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
				                       	</script>	           
		          		           </div>									
								</div>    


	                            <div  class="col-lg-6">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=$label_4;?></span>
						               <input type = 'text' name = 'v3'   class = 'optional trn_comments form-control' />  									
									</div>                   
	                            </div>


	                            
	                        </div>
	                        
	                        <div class="form-group">
	                             <div  class="col-lg-4">

					
					<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> Confirm</button>
					<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "2" ><i class="fa fa-lightbulb-o"></i> Propose</button>
									
				     </div>
						
				</div>                   
	                            </div>


	                        </div>
                    </fieldset>
                </form>
            
<script type="text/javascript" >

/*	loadInfrustructure("#form-0021-godwon",  1);
	loadInfrustructure("#form-0021-godwon",  2);
	loadInfrustructure("#form-0021-godwon",  0);


	loadInfrustructure("#form-0021-godwon2",  1);
	loadInfrustructure("#form-0021-godwon2",  2);
	loadInfrustructure("#form-0021-godwon2",  0);


	loadProduct(".product_0021","111");
*/	
</script>


