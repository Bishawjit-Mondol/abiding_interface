<?

    $label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "সরবরাহকারী " : "Supplier"); 
	$label_3 =  ($lang == 1 ? "গুদাম " : "Godown");   

	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_5 =  ($lang == 1 ? "মূল্যছাড় " : "Discount");   
	$label_6 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s = ($lang?"যোগ করুন":"Add");
	
	$id = req('id');
	
	if($id){
		$query = 
		"SELECT * FROM
		(SELECT * FROM `purchase` LEFT JOIN purchase_code USING(idpurchase) WHERE idpurchase = $id) as a
		LEFT JOIN
		 company USING(idcompany)
		LEFT JOIN
		( SELECT * FROM  purchase_stock_product_input WHERE idpurchase = $id) as b USING(idpurchase)
		LEFT JOIN
		stock_product_input USING(idstock_product_input)
		LEFT JOIN
		product USING(idproduct)
		LEFT JOIN unite USING(idunite)
		LEFT JOIN pestablishment USING(idpestablishment);";
		
		$det = $qur->custom_select_query($query);
		
	}
	
?>
<?
    if(!req('type')){
        $page_subtitle = ($lang ?   "বিল নং  ".cb($inp,$id) : "Bill No ".$id );
		if(req('tp')==2){
			$page_title =  ($lang ?   "বিক্রয় ফেরত" : "Sales Return Bill" );
		}
		else {
			$page_title =  ($lang ?   "ক্রয়কৃত মালের বিল" : "Purchase Bill" );
		}
        echo "<div class = 'page_head' id = 'page_head".req('sub')."' style='display:none'>$page_title</div>";
    }
?>

<div class="col-lg-12">
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

								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
				                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?=$label_1;?> </span><input type="text" disabled id = 'form_0030_d1'  name="d1" value="<?=date('d-m-Y',strtotime($det[0][6]));?>"  class="form-control date" />       
				                       	<script>
				                       		$("#form_0030_d1").val();
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
									  <input type = 'text' name = 'v4' id = 'form-<?=$_REQUEST['sub'];?>-pur-code' class = 'form-control' />  
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
	                        

	                        <div class="form-group pur-data-form">

	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'product_0030 pur_product form-control numeric integer' name = 'pur_product_0' placeholder = "Prdouct" >
											<option></option>
											<option value="1">dummy 1</option>
											<option value="2">dummy 2</option>
										</select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'pur_quantity_0'  class = 'numeric positive short pur_quantity form-control' />  									
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
						               <input type = 'text' name = 'pur_cost_0'  class = 'numeric positive short pur_cost form-control' />  									
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
	                        <div class="form-group pur-data-form">
 
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'product_0030 pur_product form-control numeric integer optional' name = 'pur_product_<?=$i;?>' placeholder = "Prdouct" >
											<option></option>
											<option value="1">dummy 1</option>
											<option value="2">dummy 2</option>
										</select>  									
									</div>                   
	                            </div>

                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'pur_quantity_<?=$i;?>'  class = 'numeric positive short pur_quantity form-control optional' />  									
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
						               <input type = 'text' name = 'pur_cost_<?=$i;?>'  class = 'numeric positive short pur_cost optional form-control' />  									
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
						               <input type = 'text' name = 'pur_comments'   class = 'optional pur_comments form-control' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=($lang? ' মূল্যহৃাস %' :' Discount %');?></span>
						               <input type = 'text' name = 'pur_discount' id = 'pur_discount_rt' value = '0.00'   class = 'pur_discount form-control' />  									
									</div>                   
	                            </div>
	                            
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=($lang? ' মূল্যহৃাস' :' Discount');?></span>
						               <input type = 'text' name = 'pur_dis_tot' id = 'pur_discount' value = '0.00'   class = 'pur_discount form-control' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-truck'></i></span>
						               <input type = 'text' name = 'pur_transport' id = 'pur_transport' value = '0.00'   class = 'pur_transport form-control' />  									
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><label id = 'pur_total' >0.00</label></span>
						            </div>                   
	                            </div>
	                            
	                        </div>
	                        
	                        <div class="form-group">
	                            <div  class="col-lg-2">
	                                <button type = 'button' class="btn btn-primary btn-submit-form"><?=$label_s;?></button>
	                            </div>
	                      

	                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>