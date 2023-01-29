<?php
	$recived_data="cat_id=".req('cat_id')."&cat_name=".req('cat_name');
	$window_id = "window-".req('sub')."-".$recived_data;
	$window_id = str_replace("&","-",$window_id);
	$window_id = str_replace("=","_",$window_id);
	

    $label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "সরবরাহকারী" : "Supplier"); 
	$label_3 =  ($lang == 1 ? "গুদাম " : "Godown");  
	$label_4 =  ($lang == 1 ? "ধরণ" : "Type"); 
	$label_5 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_6 =  ($lang == 1 ? "মূল্যছাড় " : "Discount"); 
	$label_7 =  ($lang == 1 ? "মোট" : "Total"); 
	$label_7x =  ($lang == 1 ? "ক্রয়ের কোড" : "Purchase Code");   
	$label_s =  ($lang == 1 ? "সম্পন্ন করুন" : "Process");		
	//$sup = $qur->custom_select_query("SELECT * FROM ___view_show_supplier v");

	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                        <legend><?php echo ($lang? "নতুন":"New ");  echo req('cat_name'); echo ($lang? " ক্রয়":"  Purchase "); ?> </legend>
	                        <div class="form-group">

								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
				                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?php echo $label_1;?> </span><input type="text" id = 'form_0031_d1'  name="d1"  class="form-control date" />       
		          		           </div>									
								</div>
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class= 'glyphicon glyphicon-user'></i> <? echo $label_2;?></span>
									  <select name = 'v2' class = 'form-control supplier integer'>
										
									  </select>
									</div>                   
								</div>     
								
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'fa fa-hospital-o' ></i> <?php echo $label_3;?></span>
									  <select selected-value = '1' name = 'v3' class = 'form-control p-place showroom godown integer' id = 'form-<?php echo $_REQUEST['sub'];?>-godwon'>
										<option></option>
									  </select>
									</div>                   
								</div>
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'fa fa-sitemap' ></i> <?php echo $label_7x;?></span>
										<input type = 'text' name = 'v4' class = 'form-control optional' />
									</div>                   
								</div>  
								
							</div>

	                        <div class="form-group">
								
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong> <?php echo ($lang? 'পন্য' :' Product');?> </strong> </span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> <strong><? echo ($lang? 'পরিমান' :' Qty');?></strong></span>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><strong><? echo ($lang? 'ইউনিট' :' Unite');?></strong> </span>
									</div>                   
	                            </div>
	                            

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><strong><? echo ($lang? 'মূল্য ' :' Price');?></strong> </span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i>৳</i> <label><strong><? echo ($lang? 'মোট' :' Sub Total');?></strong> </label></span>
									</div>                   
	                            </div>
	                        </div>
	                        

	                        <div class="form-group purchase-data-form row-data-form">

	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
									  
						               <select  class = 'form-control product product-show-details purchase-data' did = "<?php echo req('cat_id'); ?>"  name = 'purchase_product_0' placeholder = "Prdouct" >
										</select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'purchase_quantity_0'  class = 'numeric positive short purchase_quantity form-control purchase-data' />
									   <!--<span class="input-group-addon stock-amount"> </span>-->
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <span class = 'product-unite'> <? echo ($lang? 'ইউনিট' :' Unite');?> </span></span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-1" style = 'display:none'>
									<div class="input-group margin-bottom-sm">
									  <span class="product-purchase-type set-html-zero">0</span>
									</div>                   
	                            </div>
    	                        <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'purchase_cost_0'   class = 'numeric positive short purchase_cost form-control product-mpp purchase-data'  />  									
									</div>                   
        	                    </div>

	                            <div  class="col-lg-2">
										<div class="input-group margin-bottom-sm">
										  <span class="input-group-addon">৳</span>
							               <input type = 'text'  disabled  class = 'optional sub_tot form-control'  readonly />  									
										</div>                   
	                            </div>
	                        </div>
							
					<? for($i=1; $i<50; $i++){ ?>
	                        <div class="form-group  row-data-form purchase-data-form hidden">
 
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'form-control  product-show-details purchase-data optional' did = "<?php echo req('cat_id'); ?>"  name = 'purchase_product_<?php echo $i; ?>' placeholder = "Prdouct" disabled >
										</select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'purchase_quantity_<?php echo $i; ?>'  class = 'purchase-data numeric positive optional short purchase_quantity form-control' disabled />
									   <!--<span class="input-group-addon stock-amount"> </span>-->
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <span class = 'product-unite'> <? echo ($lang? 'ইউনিট' :' Unite');?> </span></span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-1" style='display:none'>
									<div class="input-group margin-bottom-sm">
									  <span class="product-purchase-type set-html-zero">0</span>
									</div>                   
	                            </div>

    	                        <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'purchase_cost_<?php echo $i; ?>'   class = 'purchase-data numeric optional positive short purchase_cost form-control product-mpp' disabled />  									
									</div>                   
        	                    </div>

	                            <div  class="col-lg-2">
										<div class="input-group margin-bottom-sm">
										  <span class="input-group-addon">৳</span>
							               <input type = 'text'  disabled  class = 'purchase-data optional sub_tot form-control' readonly />  									
										</div>                   
	                            </div>

	                        </div>
	               <? } ?>         




	                        
	                        <div class="form-group">


	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class ='fa  fa-comments-o'></i> <? echo ($lang? ' মন্তব্য' :' Remarks');?></span>
						               <input type = 'text' name = 'purchase_comments'   class = 'optional purchase_comments form-control' />  									
									</div>                   
	                            </div>
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class="fa fa-fw fa-user"></i> <? echo ($lang? ' ক্রয়কারী' :' Purchase By');?></span>
						               <select name = 'purchase_by'   class = 'purchase_by form-control' > 
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
									  <span class="input-group-addon"><? echo ($lang? ' মোট' :'Subtotal');?></span>
						               <input type = 'text'   value = '0.00'   class = 'purchase_total form-control' style='text-align:right' disabled />
									</div>                   
	                            </div>


	                            
	                        </div>


	                        <div class="form-group">



	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><? echo ($lang? 'পাইপে মূল্যহৃাস %' :' Pipe Discount %');?></span>
						               <input type = 'text' name = 'purchase_discount_pipe' value = '0.00'  max = "100" min = "0.00"  class = 'ini_sec_purchase_change purchase_discount_pp discount-purchase form-control set-zero' />  									
									</div>                   
	                            </div>
	                            
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"><? echo ($lang? 'ফিটিংসে মূল্যহৃাস %' :' Fittings Discount %');?></span>
						               <input type = 'text' name = 'purchase_discount_fitt'  value = '0.00'   class = 'ini_sec_purchase_change purchase_discount_ft discount-purchase form-control set-zero'  />  									
									</div>                   
	                            </div>
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"> <i class = 'fa fa-truck'></i> <? echo ($lang? ' যাতায়াতে খরচ ' :' Transport');?></span>
						               <input type = 'text' name = 'purchase_trns'  value = '0.00'   class = "ini_sec_purchase_change purchase_trns form-control set-zero " />
						               <input type = 'hidden' name = 'cat_id' class = 're-cycle optional' rdata = '<? echo $_REQUEST['cat_id'];?>'  value = '<? echo $_REQUEST['cat_id'];?>' />
									</div>                   
	                            </div>

	                            
	                        </div>

	                     
							
							 <div class="form-group">


								
	                            <div  class="col-lg-4">
									
									<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> <? echo ($lang? ' নিশ্চিত করুন' :' Confirm');?></button>
									
									<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "2" ><i class="fa fa-lightbulb-o"></i><? echo ($lang? ' প্রস্তাব করুন' :'  Request');?></button>
								</div>

								
	                      

	                        </div>
							
	                        <div class="form-group">

	                            <div  class="col-lg-4">
								</div>


								
								<div class="col-lg-8">
										<table class ='table pull-right'>
												<tr>
														<td><?php echo ($lang == 1 ? " মোট " : " Pipe Price");?></td><td></td><td class = 'purchase-f-subtp set-html-zero' style="text-align:right" ><?php echo $inp->cb(0.00);?></td>
												</tr>
												<tr>
														<td><?php echo ($lang == 1 ? " মোট " : " Fittings Price");?></td><td></td><td class = 'purchase-f-subf set-html-zero' style="text-align:right" ><?php echo $inp->cb(0.00);?></td>
												</tr>
												
												<tr>
														<td><?php echo ($lang == 1 ? " পাইপে মূল্যহ্রাস " : " Pipe Discount");?> <span id = 'pipe-discount-rate-show'>0%</span></td><td>-</td><td style="text-align:right" class = 'purchase-f-pdis set-html-zero'><?php echo $inp->cb(0.00);?></td>
												</tr>
												<tr>
														<td><?php echo ($lang == 1 ? " ফিটিংসে মূল্যহ্রাস" : " Fittings Discount");?> <span id = 'fitt-discount-rate-show'>0%</span></td><td>-</td><td style="text-align:right" class = 'purchase-f-fdis set-html-zero'><?php echo $inp->cb(0.00);?></td>
												</tr>


												<tr>
														<td><i class = 'fa fa-truck'></i><?php echo ($lang == 1 ? " যাতায়াতে খরচ" : " Transport");?></td><td>+</td><td style="text-align:right" class = 'purchase-f-trp set-html-zero'><?php echo $inp->cb(0.00);?></td>
												</tr>
												<tr class = 'row-red' >
														<td ><?php echo ($lang == 1 ? " সর্ব মোট " : "Total");?></td><td>: </td><td style="text-align:right" ><label class = 'purchase-f-ar set-html-zero'><?php echo $inp->cb(0.00);?></label> </td>
												</tr>

										</table>											
								</div>
	                      

	                        </div>
                    </fieldset>
                    
                </form>




