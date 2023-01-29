<? 
	$label_1 =  ($lang == 1 ? "পণ্যের নাম" : "Product Name");
	$label_2 =  ($lang == 1 ? "পণ্যের সাইজ" : "Product Size"); 
	$label_3 =  ($lang == 1 ? "ইউনিট" : "Unit");
	//$label_4 =  ($lang == 1 ? "ক্রয়/ তৈরি খরচ" : "Purchase/Making Cost");
	//$label_5 =  ($lang == 1 ? "খুচরা মূল্য" : "Retail Price");
	$label_4 =  ($lang == 1 ? "পন্যের এম।পি।পি " : "Product mpp");
	$label_5 =  ($lang == 1 ? " পন্যের এম।আর।পি " : "Product mrp");
	$label_5x =  ($lang == 1 ? "মূল্য কোড" : "Price Code");
	$label_6x =  ($lang == 1 ? "পন্যের প্রকার" : "Product Type");
	$label_6 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
									<? $inp->d2_array_drop_down("v2",$qur->custom_select_query("SELECT p1.idproduct_catagory ,  CONCAT (p2.product_catagory_name, ' ' ,p1.product_catagory_name ) FROM product_catagory p1 LEFT JOIN product_catagory p2 ON p1.idproduct_catagory_parent = p2.idproduct_catagory  WHERE  p1.product_catagory_salesable = 0;"), '','' , 'form-control'); ?>
								</div>                   
							</div>     
						</div>
                        <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>


<select class="form-control" name = 'v1'>
<option></option> 
<option> 2&quot; &times; 2&quot;</option>
<option>&frac12&quot; 3.1mm</option>
<option>&frac12;&quot; &times; &frac12;&quot;</option>
<option>&frac12;&quot; &times; &frac34;&quot;</option>
<option>&frac12;&quot;</option>
<option>&frac34&quot; 3.2mm</option>
<option>&frac34;&quot;  </option>
<option>&frac34;&quot; &times; &frac12;&quot; </option>
<option>&frac34;&quot; &times; &frac12;&quot;</option>
<option>&frac34;&quot; &times; &frac34;&quot;</option>
<option>&frac34;&quot; x &frac34;&quot;</option>
<option>&frac34;&quot;</option>
<option>1  x &frac34;  </option>
<option>1  x 1  </option>
<option>1 &;frac14&quot; 4.2mm</option>
<option>1 &frac12&quot; 4.2mm</option>
<option>1 &frac12; x 1 &frac12; </option>
<option>1 &frac14; x 1 &frac14; </option>
<option>1&frac12;&quot; &times; &frac12;&quot;</option>
<option>1&frac12;&quot; &times; &frac34;&quot;</option>
<option>1&frac12;&quot; &times; 1&frac12;&quot;</option>
<option>1&frac12;&quot; &times; 1&frac14;&quot;</option>
<option>1&frac12;&quot; &times; 1&quot;</option>
<option>1&frac12;&quot; x 1&frac14;&quot;</option>
<option>1&frac12;&quot;</option>
<option>1&frac14&quot;</option>
<option>1&frac14;&quot; &times; &frac12;&quot;</option>
<option>1&frac14;&quot; &times; &frac34;&quot;</option>
<option>1&frac14;&quot; &times; 1&frac14;&quot;</option>
<option>1&frac14;&quot; &times; 1&quot;</option>
<option>1&frac14;&quot;</option>
<option>1&quot; &times; &frac12;&quot;</option>
<option>1&quot; &times; &frac34;&quot; </option>
<option>1&quot; &times; &frac34;&quot;</option>
<option>1&quot; &times; 1&quot;</option>
<option>1&quot; 3.5mm</option>
<option>1&quot; x &frac34;&quot;</option>
<option>1&quot;</option>
<option>10&quot;</option>
<option>1000 W, &frac12; - 2</option>
<option>110 mm/4&quot;,3.0-3.2mm</option>
<option>110 mm/4&quot;,3.2-3.4mm</option>
<option>110 mm/4&quot;</option>
<option>110mm/ 4&quot;</option>
<option>160 mm/6&quot; 4.0-4.5mm</option>
<option>160 mm/6&quot; 4mm</option>
<option>160mm/ 6&quot;</option>
<option>2 x 2 </option>
<option>2 x 2</option>
<option>2&quot; &times; &frac12;&quot;</option>
<option>2&quot; &times; &frac34;&quot;</option>
<option>2&quot; &times; 1&frac12;&quot;</option>
<option>2&quot; &times; 1&frac14;&quot;</option>
<option>2&quot; &times; 1&quot;</option>
<option>2&quot; &times; 2&quot;</option>
<option>2&quot; 4.2mm</option>
<option>2&quot;</option>
<option>20 - 63, &frac12; - 2</option>
<option>200 mm/8&quot; 5mm</option>
<option>200mm/ 8&quot;</option>
<option>20mm/ 2&quot;</option>
<option>32 mm / &frac14</option>
<option>32mm/ &frac14</option>
<option>32mm/ 1 &frac14</option>
<option>4&quot; &times; 2&quot;</option>
<option>4&quot;</option>
<option>40 mm/1 &frac12</option>
<option>40mm/ &frac12</option>
<option>40mm/ 1 &frac12</option>
<option>50 mm/2&quot;</option>
<option>500ml</option>
<option>50mm/ 2&quot;</option>
<option>6&quot; &times; 4&quot;</option>
<option>8&quot; &times; 6&quot;</option>
</select>

 
								</div>                  
							</div>     
					   </div>
					  

						<div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
									<? $inp->d2_array_drop_down("v3",$qur->custom_select_query("SELECT * FROM unite;"), '','' , 'form-control'); ?>
								</div>                   
							</div>     
						</div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
								  <input class="form-control positive numeric" name = 'v4' type="text" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$label_5;?></span>
								  <input class="form-control positive numeric" name = 'v5' type="text" /> 
								</div>                   
							</div>     
					   </div>

					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$label_6x;?></span>
								  <select class="form-control" name = 'v6x'> 
									  <option value = '2'><?=($lang == 1 ? "ফিটিংস" : "Fittings");?></option>
									  <option value = '1'><?=($lang == 1 ? "পাইপ" : "Pipe");?></option>
								  </select>	  
								</div>                   
							</div>     
					   </div>


                        <div class="form-group">
                           <div  class="col-lg-4">
				<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo($lang ? "সেভ করুন" : "Save" );?></button>
				 </div>
                        </div>
                    </fieldset>
                </form>
            
