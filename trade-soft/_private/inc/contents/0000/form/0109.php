<?php
	$recived_data="cat_id=".req('cat_id')."&cat_name=".req('cat_name');
	$window_id = "window-".req('sub')."-".$recived_data;
	$window_id = str_replace("&","-",$window_id);
	$window_id = str_replace("=","_",$window_id);
	

    $label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "খরিদদার" : "Client"); 
	$label_3 =  ($lang == 1 ? "গুদাম " : "Godown");  
	$label_4 =  ($lang == 1 ? "ধরণ" : "Type"); 
	$label_5 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_6 =  ($lang == 1 ? "মূল্যছাড় " : "Discount"); 
	$label_7 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s =  ($lang == 1 ? "সম্পন্ন করুন" : "Process");		
	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
	
	$sid = 4;
	$single_det = $qur->custom_select_query("SELECT idsales, idsales_type, idcompany, idpestablishment, idstaff, sales_date, sales_ammount, company_name, pestablishment_name, staff_name, sales_type_details_en, sales_type_details_bn, sales_discount_rate, sales_discount_ammount, sales_comments, sales_delivery_address, sales_transport FROM
    ( SELECT * FROM sales WHERE idsales = $sid) as a
    LEFT JOIN
      company USING(idcompany)
    LEFT JOIN
      sales_type USING(idsales_type)
    LEFT JOIN
    ( SELECT * FROM sales_details WHERE idsales = $sid) as b USING(idsales)
    LEFT JOIN
      staff USING(idstaff)
    LEFT JOIN
      pestablishment USING(idpestablishment);"); 
	  
	  
	$multi_det = $qur->custom_select_query("SELECT idproduct, stock_product_output_qunatity, stock_product_output_price, unite_name
	FROM stock_product_output
	LEFT JOIN product USING(idproduct) LEFT JOIN unite USING(idunite)
	WHERE idstock_product_output IN
	(SELECT idstock_product_output FROM sales_stock_product_output s WHERE idsales = $sid);");

$s_total = 0;
?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
						<legend><?=$page_title;?></legend>
	                        <div class="form-group">

								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
				                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?php echo $label_1;?> </span><input type="text" id = 'form_0106_d1'  name="d1" value="<?php echo date('d-m-Y', strtotime($single_det[0][5]));?>" class="form-control date" />       

		          		           </div>									
								</div>
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class= 'glyphicon glyphicon-user'></i> <? echo $label_2;?></span>
									  <select name = 'v2' class = 'form-control client supplier integer' selected-value = "<?php echo $single_det[0][2];?>" >
										
									  </select>
									</div>                   
								</div>     
								
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'fa fa-hospital-o' ></i> <?php echo $label_3;?></span>
									  <select name = 'v3' class = 'form-control p-place showroom godown' selected-value = "<?php echo $single_det[0][3];?>" >
										<option></option>
									  </select>
									</div>                   
								</div>  
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'fa fa-sitemap' ></i> <?php echo $label_4;?></span>
										<select name = 'v4' class = 'form-control'>
											
											<option></option>
											<?php $det = $qur->custom_select_query("SELECT idsales_type, sales_type_details_en, sales_type_details_bn FROM sales_type s ");
												foreach($det as $d){ ?>
												<option value = '<?php echo $d[0];?>' <?php if($single_det[0][1] == $d[0]){ echo "selected"; } ?> ><?php echo $d[1];?></option>
											<? } ?>
										</select>
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
	                        
						<? for($k=0; $k<count($multi_det); $k++){ ?>
						
	                        <div class="form-group sales-data-form row-data-form">
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'form-control product product-show-details sales-data' did = "<?php echo req('cat_id'); ?>"  name = 'sales_product_<?php echo $k;?>' placeholder = "Prdouct"  selected-value = "<?php echo $multi_det[$k][0];?>" >
										</select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'sales_quantity_<?php echo $k;?>'  class = 'numeric positive short sales_quantity form-control sales-data' value="<?php echo $multi_det[$k][1];?>" />
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <span class = 'product-unite'> <?php echo $multi_det[$k][3];?> </span></span>
									</div>                   
	                            </div>

    	                        <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'sales_cost_<?php echo $k;?>'   class = 'numeric positive short sales_cost form-control product-mrp sales-data' value="<?php echo $multi_det[$k][2];?>" />  									
									</div>                   
        	                    </div>

	                            <div  class="col-lg-2">
										<div class="input-group margin-bottom-sm">
										  <span class="input-group-addon">৳</span>
										  <?php $per_cost = $multi_det[$k][1]*$multi_det[$k][2]; 
												$s_total += $per_cost;
										  ?>
							               <input type = 'text'  disabled  class = 'optional sub_tot form-control' value="<?php echo sprintf( "%.2f",$per_cost );?>" readonly /> 
										</div>                   
	                            </div>
	                        </div>
						<? } ?>  
					
					
							<div class="form-group sales-data-form row-data-form">

	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'form-control product product-show-details sales-data' did = "<?php echo req('cat_id'); ?>"  name = 'sales_product_<?php echo $k;?>' placeholder = "Prdouct" >
										</select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'sales_quantity_<?php echo $k;?>'  class = 'numeric positive short sales_quantity form-control sales-data' />
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <span class = 'product-unite'> <? echo ($lang? 'ইউনিট' :' Unite');?> </span></span>
									</div>                   
	                            </div>

    	                        <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'sales_cost_<?php echo $k;?>'   class = 'numeric positive short sales_cost form-control product-mrp sales-data'  />  									
									</div>                   
        	                    </div>

	                            <div  class="col-lg-2">
										<div class="input-group margin-bottom-sm">
										  <span class="input-group-addon">৳</span>
							               <input type = 'text'  disabled  class = 'optional sub_tot form-control'  readonly />  									
										</div>                   
	                            </div>
	                        </div>
					
					<? for($i=$k+1; $i<10; $i++){ ?>
	                        <div class="form-group  row-data-form sales-data-form hidden">
 
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'form-control product product-show-details sales-data optional' did = "<?php echo req('cat_id'); ?>"  name = 'sales_product_<?php echo $i; ?>' placeholder = "Prdouct" disabled >
										</select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'sales_quantity_<?php echo $i; ?>'  class = 'sales-data numeric positive optional short sales_quantity form-control' disabled />
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <span class = 'product-unite'> <? echo ($lang? 'ইউনিট' :' Unite');?> </span></span>
									</div>                   
	                            </div>

    	                        <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'sales_cost_<?php echo $i; ?>'   class = 'sales-data numeric optional positive short sales_cost form-control product-mrp' disabled />  									
									</div>                   
        	                    </div>

	                            <div  class="col-lg-2">
										<div class="input-group margin-bottom-sm">
										  <span class="input-group-addon">৳</span>
							               <input type = 'text'  disabled  class = 'sales-data optional sub_tot form-control' readonly />  									
										</div>                   
	                            </div>

	                        </div>
	               <? } ?>         


    
	                        <div class="form-group">

	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class ='fa  fa-comments-o'></i> <? echo ($lang? ' মন্তব্য' :' Remarks');?></span>
						               <input type = 'text' name = 'sales_comments' value="<?php echo $single_det[0][14];?>" class = 'optional sales_comments form-control' />  									
									</div>                   
	                            </div>
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class="fa fa-fw fa-user"></i> <? echo ($lang? ' মন্তব্য' :' Sales By');?></span>
									   <select name = 'sales_by' class = 'sales_by form-control' > 
												<option value="<?php echo $single_det[0][4];?>"><?php echo $single_det[0][9];?></option>
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
									  <span class="input-group-addon"><? echo ($lang? ' --' :'Subtotal');?></span>
						               <input type = 'text'   value = '<?php echo sprintf("%.2f",$s_total);?>'   class = 'sales_total form-control' style='text-align:right' disabled />
									</div>                   
	                            </div>
    
	                        </div>


	                        <div class="form-group">

	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><? echo ($lang? ' মূল্যহৃাস %' :' Discount Rate');?></span>
						               <input type = 'text' name = 'sales_discount' value = "<?php echo $single_det[0][12];?>"  max = "100" min = "0.00"  class = 'sales_discount_rt form-control set-zero' />  									
									</div>                   
	                            </div>
	                            
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"><? echo ($lang? ' মূল্যহৃাস' :' Discount');?></span>
						               <input type = 'text' name = 'sales_dis_tot'  value = "<?php echo sprintf("%.2f",$single_det[0][13]);?>" class = 'sales_discount form-control set-zero'  disabled />  									
									</div>                   
	                            </div>
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"> <i class = 'fa fa-truck'></i> <? echo ($lang? ' মূল্যহৃাস' :' Transport');?></span>
						               <input type = 'text' name = 'sales_trns'  value = "<?php echo sprintf("%.2f",$single_det[0][16]);?>"   class = 'sales_trns form-control set-zero' />  									
						               <input type = 'hidden' name = 'cat_id' value = '<?php echo req('cat_id'); ?>' />
									</div>                   
	                            </div>
      
	                        </div>

	                        
	                        <div class="form-group">

	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"><? echo ($lang? ' --' :' Delivery Address');?></span>
						               <input type = 'text' name = 'sales_dlv'  value = "<?php echo $single_det[0][15];?>"  class = 'sales_discount form-control' />  									
									</div>                   

								</div>

	                            <div  class="col-lg-4">

									<input type='hidden' name='sid' value="<?php echo $sid;?>" /> 
									<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> Confirm</button>
								</div>
								
								<div class="col-lg-4">
										<table class ='table pull-right'>
												<tr>
														<td>Subtotal</td><td></td><td class = 'sales-f-subt set-html-zero'><?php echo sprintf("%.2f",$s_total);?></td>
												</tr>
												<tr>
														<td>Discount <span class = 'sales-f-disr'><?php echo $single_det[0][12];?></span> %</td><td>-</td><td class = 'sales-f-dis set-html-zero'><?php echo sprintf("%.2f",$single_det[0][13]);?></td>
												</tr>
												<tr>
														<td><i class = 'fa fa-truck'></i> Transport</td><td>+</td><td class = 'sales-f-trp set-html-zero'><?php echo sprintf("%.2f",$single_det[0][16]);?></td>
												</tr>
												<tr class = 'row-red' >
														<td >Ammount Recivable</td><td>: </td><td><label class = 'sales-f-ar set-html-zero'><?php echo sprintf("%.2f",($s_total+$single_det[0][16]-$single_det[0][13]) );?></label> Taka Only</td>
												</tr>

										</table>											
								</div>
	                      

	                        </div>
                    </fieldset>
                    
                </form>
            
<script type="text/javascript" >
/*
	dg("#form-<? echo $_REQUEST['sub'];?>-sup","#supplier-8002-id","#supplier-8002-name");
	loadInfrustructure("#form-<? echo $_REQUEST['sub'];?>-godwon",  1);
	loadProduct(".product_0106","111");
*/
     


</script>


