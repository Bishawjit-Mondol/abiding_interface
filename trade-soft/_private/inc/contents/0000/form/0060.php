<?
    $label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "খরিদদার" : "Client"); 
	$label_3 =  ($lang == 1 ? "গুদাম " : "Godown");  
	$label_4 =  ($lang == 1 ? "ধরণ" : "Type"); 
	$label_5 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_6 =  ($lang == 1 ? "মূল্যছাড় " : "Discount"); 
	$label_7 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s =  ($lang == 1 ? "সম্পন্ন করুন" : "Process");		
	//$sup = $qur->custom_select_query("SELECT * FROM ___view_show_supplier v");

	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                        <legend><?=$page_title;?></legend>
	                        <div class="form-group">

								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
				                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text" id = 'form_0060_d1'  name="d1"  class="form-control date" />       
				                       	<script>
				                       		$("#form_0060_d1").val($("#entryday").val());
				                       		$('.date').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
				                       	</script>
		          		           </div>									
								</div>
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class= 'glyphicon glyphicon-user'></i> <?=$label_2;?></span>
									  <select name = 'v2' class = 'form-control' id = 'form-<?=$_REQUEST['sub'];?>-sup'>
										<option></option>
										<option value="1">dummy 1</option>
										<option value="2">dummy 2</option>
									  </select>
									</div>                   
								</div>     
								
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-inbox' ></i> <?=$label_3;?></span>
									  <select name = 'v3' class = 'form-control' id = 'form-<?=$_REQUEST['sub'];?>-godwon'>
										<option></option>
										<option value="1">dummy 1</option>
										<option value="2">dummy 2</option>
									  </select>
									</div>                   
								</div>  
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-file' ></i> <?=$label_4;?></span>
										<select name = 'v4' class = 'form-control' id = 'form-<?=$_REQUEST['sub'];?>-godwon'>
											<option></option>
											<option value="1">dummy 1</option>
											<option value="2">dummy 2</option>
										</select>
									</div>                   
								</div>
								
							</div>

	                        <div class="form-group">
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong> <?=($lang? 'পন্য' :' Product');?> </strong> </span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong><?=($lang? 'পরিমান' :' Qty');?></strong></span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><strong><?=($lang? 'ইউনিট' :' Unite');?></strong> </span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><strong><?=($lang? 'মূল্য ' :' Price');?></strong> </span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i>৳</i> <label><strong><?=($lang? 'মোট' :' Sub Total');?></strong> </label></span>
									</div>                   
	                            </div>
	                        </div>
	                        

	                        <div class="form-group sales-data-form">

	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'product_0060 sales_product form-control numeric integer' name = 'sales_product_0' placeholder = "Prdouct" >
											<option></option>
											<option value="1">dummy 1</option>
											<option value="2">dummy 2</option>
										</select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'sales_quantity_0'  class = 'numeric positive short sales_quantity form-control' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=($lang? 'ইউনিট' :' Unite');?></span>
									</div>                   
	                            </div>

    	                        <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'sales_cost_0'  class = 'numeric positive short sales_cost form-control' />  									
									</div>                   
        	                    </div>

	                            <div  class="col-lg-2">
										<div class="input-group margin-bottom-sm">
										  <span class="input-group-addon">৳</span>
							               <input type = 'text'  disabled  class = 'optional sub_tot form-control' />  									
										</div>                   
	                            </div>
	                        </div>
							
					<? for($i=1; $i<10; $i++){ ?>
	                        <div class="form-group sales-data-form">
 
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'product_0060 sales_product form-control numeric integer optional' name = 'sales_product_<?=$i;?>' placeholder = "Prdouct" >
											<option></option>
											<option value="1">dummy 1</option>
											<option value="2">dummy 2</option>
										</select>  									
									</div>                   
	                            </div>

                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'sales_quantity_<?=$i;?>'  class = 'numeric positive short sales_quantity form-control optional' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=($lang? 'ইউনিট' :' Unite');?></span>
									</div>                   
	                            </div>

                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'sales_cost_<?=$i;?>'  class = 'numeric positive short sales_cost optional form-control' />  									
									</div>                   
                            </div>

                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon">৳</span>
						               <input type = 'text'  disabled  class = 'optional sub_tot form-control' />  									
									</div>                   
                            </div>


	                        </div>
	               <? } ?>         






	                        <div class="form-group">


	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=($lang? ' মন্তব্য' :' Comments');?></span>
						               <input type = 'text' name = 'sales_comments'   class = 'optional sales_comments form-control' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=($lang? ' মূল্যহৃাস %' :' Discount %');?></span>
						               <input type = 'text' name = 'sales_discount' id = '//sales_discount_rt' value = '0.00'   class = 'sales_discount form-control' />  									
									</div>                   
	                            </div>
	                            
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"><?=($lang? ' মূল্যহৃাস' :' Discount');?></span>
						               <input type = 'text' name = 'sales_dis_tot' id = '//sales_discount' value = '0.00'   class = 'sales_discount form-control' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-truck'></i></span>
						               <input type = 'text' name = 'sales_transport' id = 'sales_transport' value = '0.00'   class = 'sales_transport form-control' />  									
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><label id = 'sales_total' >0.00</label></span>
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
	dg("#form-<?=$_REQUEST['sub'];?>-sup","#supplier-8002-id","#supplier-8002-name");
	loadInfrustructure("#form-<?=$_REQUEST['sub'];?>-godwon",  1);
	loadProduct(".product_0060","111");
*/
</script>


