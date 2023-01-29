<?php
	$recived_data="cat_id=".req('cat_id')."&cat_name=".req('cat_name');
	$window_id = "window-".req('sub')."-".$recived_data;
	$window_id = str_replace("&","-",$window_id);
	$window_id = str_replace("=","_",$window_id);	

	$label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "ক্রেতা" : "Client"); 
	$label_3 =  ($lang == 1 ? "শোরুম / গুদাম " : "Place ");  
	$label_4 =  ($lang == 1 ? "ধরণ" : "Type"); 
	$label_5 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_6 =  ($lang == 1 ? "মূল্যছাড় " : "Discount"); 
	$label_7 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s =  ($lang == 1 ? "সম্পন্ন করুন" : "Process");		
	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
	
	$id =req('id'); 
	$query1 = "SELECT * FROM ( SELECT * FROM sales s WHERE idsales=$id) as a
				LEFT JOIN sales_details USING(idsales) LEFT JOIN company USING(idcompany);";
	$det1 = $qur->custom_select_query($query1);
	
	$query2 = "SELECT * FROM ( SELECT * FROM sales_stock_product_output s WHERE idsales=$id) as a
				LEFT JOIN stock_product_output USING(idstock_product_output);";
	$det2 = $qur->custom_select_query($query2);
	
?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                        <legend><?php echo ($lang? " ":" ");  echo req('cat_name'); echo ($lang? " বিক্রয় সংশোধন":" Sales Edit"); ?> </legend>
	                        <div class="form-group">

								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
				                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       	<?php echo $label_1;?> </span><input type="text" value='<? echo date('d-m-Y', strtotime($det1[0][2]));?>' name="d1"  class="form-control date" />       
		          		           </div>									
								</div>
								<div class = 'col-lg-3'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class= 'glyphicon glyphicon-user'></i> <? echo $label_2;?></span>
									  <select selected-value = '<? echo $det1[0][0];?>' name = 'v2' class = 'form-control client integer'>
										
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
									  <span class="input-group-addon input-label"><i class = 'fa fa-sitemap' ></i> <?php echo $label_4;?></span>
										<select name = 'v4'  class = 'form-control'>
											<option ></option>
											<?php $det = $qur->custom_select_query("SELECT idsales_type, sales_type_details_en, sales_type_details_bn FROM sales_type s ");?>	
											<?php
											foreach($det as $d){
											?>
												<option value = '<?php echo $d[0];?>' <? echo($det1[0][4]==$d[0] ? 'selected' : '');?> > <?php echo $d[1];?></option>
											<?		
											}
											?>
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
	                        
						<? for($k=0; $k<COUNT($det2); $k++){ ?>
	                        <div class="form-group  row-data-form sales-data-form">
 
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						                
									   <select selected-value = '<? echo $det2[$k][3];?>' class = 'form-control product product-show-details sales-data' did = "<?php echo req('cat_id'); ?>"  name = 'sales_product_<? echo $k;?>' placeholder = "Prdouct" >
										</select>
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'sales_quantity_<?php echo $k; ?>' value = '<? echo $det2[$k][4];?>' class = 'sales-data numeric positive optional short sales_quantity form-control' />
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <span class = 'product-unite'> <? echo ($lang? 'ইউনিট' :' Unite');?> </span></span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-1" style='display:none'>
									<div class="input-group margin-bottom-sm">
									  <span class="product-sales-type set-html-zero">0</span>
									</div>                   
	                            </div>

    	                        <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'sales_cost_<?php echo $k; ?>' value = '<? echo $det2[$k][5];?>' class = 'sales-data numeric optional positive short sales_cost form-control product-mrp' />  									
									</div>                   
        	                    </div>

	                            <div  class="col-lg-2">
										<div class="input-group margin-bottom-sm">
										  <span class="input-group-addon">৳</span>
							               <input type = 'text' value = '<? echo $inp->cb(two_dec($det2[$k][4]*$det2[$k][5])); $st += $det2[$k][4]*$det2[$k][5];?>' disabled  class = 'sales-data optional sub_tot form-control' readonly />  									
										</div>                   
	                            </div>

	                        </div>
	               <? } ?>
	                        <div class="form-group sales-data-form row-data-form">

	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
									  
						               <select   class = 'form-control product product-show-details sales-data optional' did = "<?php echo req('cat_id'); ?>"  name = 'sales_product_<? echo $k;?>' placeholder = "Prdouct" >
										</select>  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'sales_quantity_<? echo $k;?>'  class = 'numeric positive short sales_quantity form-control sales-data optional' />
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <span class = 'product-unite'> <? echo ($lang? 'ইউনিট' :' Unite');?> </span></span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-1" style = 'display:none'>
									<div class="input-group margin-bottom-sm">
									  <span class="product-sales-type set-html-zero">0</span>
									</div>                   
	                            </div>
    	                        <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'sales_cost_<? echo $k;?>'   class = 'numeric positive short sales_cost form-control product-mrp sales-data optional'  />  									
									</div>                   
        	                    </div>

	                            <div  class="col-lg-2">
										<div class="input-group margin-bottom-sm">
										  <span class="input-group-addon">৳</span>
							               <input type = 'text'  disabled  class = 'optional sub_tot form-control'  readonly />  									
										</div>                   
	                            </div>
	                        </div>
							
					<? for($i=$k+1; $i<50; $i++){ ?>
	                        <div class="form-group  row-data-form sales-data-form hidden">
 
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon input-label"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
						               <select  class = 'form-control  product-show-details sales-data optional' did = "<?php echo req('cat_id'); ?>"  name = 'sales_product_<?php echo $i; ?>'  placeholder = "Prdouct" disabled >
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
	                            <div  class="col-lg-1" style='display:none'>
									<div class="input-group margin-bottom-sm">
									  <span class="product-sales-type set-html-zero">0</span>
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
						               <input type = 'text' name = 'sales_comments' value='<? echo $det1[0][8]?>' class = 'optional sales_comments form-control' />  									
									</div>                   
	                            </div>
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class="fa fa-fw fa-user"></i> <? echo ($lang? ' বিক্রয়কারী' :' Sales By');?></span>
						               <select name = 'sales_by'   class = 'sales_by form-control' > 
												<option></option>
												<?php $det = $qur->custom_select_query( "SELECT idstaff, CONCAT(staff_name, ' : ', post_name, ' ( ' , division_name, ' ) ') as name FROM staff s LEFT JOIN post USING(idpost) LEFT JOIN division USING(iddivision) WHERE iddivision = 2 ORDER BY staff_name");  ?>
												<?php foreach($det as $d){ ?>
													<option value = "<?php echo $d[0];?>" <? echo($det1[0][10]==$d[0] ? 'selected' : '');?> ><?php echo $d[1];?></option>
												<?php } ?>	
						               </select>
									</div>                   
	                            </div>
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"><? echo ($lang? ' মোট' :'Subtotal');?></span>
						               <input type = 'text'  value = '<? echo $st;?>'  class = 'sales_total form-control' style='text-align:right' disabled />
									</div>                   
	                            </div>


	                            
	                        </div>


	                        <div class="form-group">



	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><? echo ($lang? 'পাইপে মূল্যহৃাস %' :' Pipe Discount %');?></span>
						               <input type = 'text' name = 'sales_discount_pipe' value='<? echo $det1[0][19]?>'  max = "100" min = "0.00"  class = 'ini_sec_sales_change sales_discount_pp discount-sales form-control set-zero' />  									
									</div>                   
	                            </div>
	                            
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"><? echo ($lang? 'ফিটিংসে মূল্যহৃাস %' :' Fittings Discount %');?></span>
						               <input type = 'text' name = 'sales_discount_fitt'  value='<? echo $det1[0][6]?>'   class = 'ini_sec_sales_change sales_discount_ft discount-sales form-control set-zero'  />  									
									</div>                   
	                            </div>
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"> <i class = 'fa fa-truck'></i> <? echo ($lang? ' যাতায়াতে খরচ ' :' Transport');?></span>
						               <input type = 'text' name = 'sales_trns'  value='<? echo $det1[0][15]?>'   class = "ini_sec_sales_change sales_trns form-control set-zero" />
						               <input type = 'hidden' name = 'cat_id' class = 're-cycle' rdata = '<? echo $_REQUEST['cat_id'];?>'  value = '<? echo $_REQUEST['cat_id'];?>' />
									</div>                   
	                            </div>

	                            
	                        </div>

							
							
							 <div class="form-group">


								
	                            <div  class="col-lg-4">
									
									<input type = 'hidden' name = 'sid' value = '<? echo $id;?>' class = 'optional' />
									<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "2" ><i class="fa fa-lightbulb-o"></i> <? echo ($lang? ' অনুরোধ করুন' :'  Request');?></button>
									
								</div>

								<div class="col-lg-8">
									<div class="input-group margin-bottom-sm"> 
									  <span class="input-group-addon"><? echo ($lang? ' মাল পৌঁছানোর ঠিকানা ' :' Delivery Address');?></span>
									  <input type = 'hidden' name = 'loca' value = '' class = 'gps_loc gps_loc_a optional' />
									  <input type = 'hidden' name = 'locb' value = '' class = 'gps_loc gps_loc_b optional' />						               
									  <input type = 'text' name = 'sales_dlv'  value='<? echo $det1[0][13]?>'  class = ' form-control' />  									
									</div>      											
								</div>
	                      

	                        </div>
							
	                        <div class="form-group">

	                            <div  class="col-lg-4">
								</div>


								
								<div class="col-lg-8">
										<table class ='table pull-right'>
												<tr>
														<td><?php echo ($lang == 1 ? "পাইপের মোট মূল্য " : "Pipe Price");?></td><td></td><td class = 'sales-f-subtp set-html-zero' style="text-align:right" ><?php echo $inp->cb(0.00);?></td>
												</tr>
												<tr>
														<td><?php echo ($lang == 1 ? "ফিটিংসের মোট মূল্য " : "Fittings Price");?></td><td></td><td class = 'sales-f-subf set-html-zero' style="text-align:right" ><?php echo $inp->cb(0.00);?></td>
												</tr>
												
												<tr>
														<td><?php echo ($lang == 1 ? "পাইপে মূল্যহ্রাস " : "Pipe Discount");?> <span id = 'pipe-discount-rate-show'>0%</span></td><td>-</td><td style="text-align:right" class = 'sales-f-pdis set-html-zero'><?php echo $inp->cb(0.00);?></td>
												</tr>
												<tr>
														<td><?php echo ($lang == 1 ? "ফিটিংসে মূল্যহ্রাস" : "Fittings Discount");?> <span id = 'fitt-discount-rate-show'>0%</span></td><td>-</td><td style="text-align:right" class = 'sales-f-fdis set-html-zero'><?php echo $inp->cb(0.00);?></td>
												</tr>


												<tr>
														<td><i class = 'fa fa-truck'></i><?php echo ($lang == 1 ? "যাতায়াতে খরচ" : " Transport");?></td><td>+</td><td style="text-align:right" class = 'sales-f-trp set-html-zero'><?php echo $inp->cb(0.00);?></td>
												</tr>
												<tr class = 'row-red' >
														<td ><?php echo ($lang == 1 ? "সর্ব মোট " : "Total");?></td><td>: </td><td style="text-align:right" ><label class = 'sales-f-ar set-html-zero'><?php echo $inp->cb(0.00);?></label> </td>
												</tr>

										</table>											
								</div>
	                      

	                        </div>
                    </fieldset>
                    
                </form>

	<script type="text/javascript">
		if(geoPosition.init()){
			geoPosition.getCurrentPosition(success_callback,error_callback,{enableHighAccuracy:true});
		}
		else{
			
		}

		function success_callback(p)
		{
			a = parseFloat( p.coords.latitude ).toFixed(10);
			b = parseFloat( p.coords.longitude ).toFixed(10);
			$("input.gps_loc_a").val(a);
			$("input.gps_loc_b").val(b);
			
			//InitializeMap();
		}
		
		function error_callback(p)
		{

		}		
	</script>	


