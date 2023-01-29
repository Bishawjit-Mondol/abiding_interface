
<?

    $label_1 =  ($lang == 1 ? "তারিখ " : "Date");  //v32
	$label_2 =  ($lang == 1 ? "সরবরাহকারী " : "Supplier"); 
	$label_3 =  ($lang == 1 ? "থেকে " : "From");   
	$label_31 =  ($lang == 1 ? "ইন/আউট" : "In/Out");   

	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_5 =  ($lang == 1 ? "মূল্যছাড় " : "Discount");   
	$label_6 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s = ($lang?"সমন্বয় করুন":"Adjust");

?>
<?
	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
?>
<div class="col-lg-8">
    <div class="panel panel-primary">
        <div class="panel-heading" id = "head<?=$_REQUEST['sub'];?>">
            <span class = 'page-title'><?=$page_title;?></span>
        </div>
        <div class="panel-body">
            <div class="well">
                <form class="bs-example form-horizontal link<?=$_REQUEST['sub'];?>" id = "form<?=$_REQUEST['sub'];?>">
                    <fieldset>
                        <legend><?=$page_title;?></legend>
	                        <div class="form-group">
								
								<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-inbox' ></i> <?=$label_3;?></span>
											<select name = 'v3' class = 'form-control' id = 'form-0021-godwon'>
												<option></option>
												<option value="1">dummy1</option>
												<option value="2">dummy2</option>
											</select>

									</div>                   
								</div>     
								<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-inbox' ></i> <?=$label_31;?></span>
									  <select name = 'v31' class = 'form-control' id = 'form-0021-inout'>
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
						               <select  class = 'form-control numeric integer' name = 'trn_product_0' placeholder = "Prdouct" >
											<option></option>
											<option value="1">dummy1</option>
											<option value="2">dummy2</option>
						               </select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-lebel"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'trn_quantity_0' disabled  class = 'numeric positive short trn_quantity form-control' />  									
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
						               <select  class = 'form-control numeric integer optional' name = 'trn_product_<?=$i;?>' placeholder = "Prdouct" >
											<option></option>
											<option value="1">dummy1</option>
											<option value="2">dummy2</option>
										</select>  									
									</div>                   
	                            </div>

                            <div  class="col-lg-3">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'trn_quantity_<?=$i;?>' disabled  class = 'numeric positive short trn_quantity form-control optional' />  									
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
									  <span class="input-group-addon"><?=($lang? ' মন্তব্য' :' Comments');?></span>
						               <input type = 'text' name = 'trn_comments'   class = 'optional trn_comments form-control' />  									
									</div>                   
	                            </div>


	                            
	                        </div>
	                        
	                        <div class="form-group">
	                            <div  class="col-lg-12">
	                                <button type = 'button' class="btn btn-primary btn-submit-form"><?=$label_s;?></button>
	                            </div>
	                        				

							</div>                   
	                            </div>


	                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
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


