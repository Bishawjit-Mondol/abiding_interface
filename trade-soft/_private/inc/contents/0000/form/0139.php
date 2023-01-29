<?php 

	date_default_timezone_set("Asia/Dhaka");
	//$printd =  
    	$label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "ক্রেতা " : "Client"); 
	$label_3 =  ($lang == 1 ? "গুদাম " : "Godown");   

	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_5 =  ($lang == 1 ? "মূল্যছাড় " : "Discount");   
	$label_6 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s =  ($lang? "যোগ করুন" : "Add");
	
	 $id = req('id');


		$query = ("SELECT idcompany,purchase_date, purchase_ammount, purchase_status, company_name, company_balance, company_creditlimit, company_phone,
 			company_address, company_type, stock_product_input_date, stock_product_input_qunatity,
 			stock_product_input_price, idpestablishment, stock_product_input_type, stock_product_input_status,
 			product_name , product_status, unite_name , pestablishment_name, pestablishment_address,
      			purchase_discount_rate, purchase_discount_ammount, purchase_comments , purchase_transport, idproduct,idpurchase
			From
 			(SELECT idcompany,purchase_date, purchase_ammount, purchase_status, company_name, company_balance, company_creditlimit, company_phone,
 				company_address, company_type, stock_product_input_date, stock_product_input_qunatity, stock_product_input_price,
 				pd.idpestablishment, stock_product_input_type, stock_product_input_status, product_name , product_status, unite_name,
         			purchase_discount_rate, purchase_discount_ammount, purchase_comments , purchase_transport, idproduct,idpurchase

				FROM (SELECT * FROM `purchase` WHERE idpurchase = $id) as a
  				LEFT JOIN purchase_details as pd using(idpurchase)
				LEFT JOIN (Select * From company where company_type=1  ) as d USING(idcompany)
				LEFT JOIN ( SELECT * FROM  purchase_stock_product_input WHERE idpurchase = $id ) as b USING(idpurchase)
    				LEFT JOIN stock_product_input USING(idstock_product_input)
				LEFT JOIN product as p USING(idproduct)
				LEFT JOIN unite USING(idunite)
 			) as c
			LEFT JOIN pestablishment USING(idpestablishment);");

		$det = $qur->custom_select_query($query);


		$det2 = $qur->custom_select_query("SELECT company_name,company_address,company_phone FROM company c
 left join purchase using(idcompany) where company_type=1 AND idpurchase=".$id);
		$cid__ = $det[0][1];

		$det3 = $qur->custom_select_query("select  pestablishment_name, idpurchase,idstaff  , staff_name , staff_mobile
  							FROM (select  idpurchase,idstaff ,staff_name , staff_mobile from staff
							left join staff_details using (idstaff)
  							left join purchase_details using (idstaff) where idpurchase = $id) as a
       						        left join (select * FROM purchase_stock_product_input WHERE idpurchase = $id LIMIT 1) as b using (idpurchase)
							Left join stock_product_input using(idstock_product_input)
							Left join pestablishment using(idpestablishment);"); 
		
	//}
	
?>

<?php  include('rh_bill3.php'); ?>
<div class="bs-example table-responsive ">
 
    <table class="table" border = '2' width = '750px'>
	<tbody>
		<tr>
			<td>
				<table height="180px" width="100%";>
					<!--<tr  style="border-bottom:solid 1px #000">
						<td width="352px"><b>Bill Date : </b><?php echo $det[0][22];?> </td>
					</tr >
					-->	
					<tr style="border-bottom:solid 1px #000">
						<td width="352px"><b><?php echo($lang == 1 ? "বিক্রয় তারিখ" : "Sales Return Date");?></b> <?php echo dateconvert($det[0][10]);?></td>
					</tr>
					<tr style="border-bottom:solid 1px #000">
						<td><b><?php echo($lang == 1 ? "ডি.ও তারিখ" : "D.O.Date ");?></b> <?php echo dateconvert($det[0][1]);?></td>
					</tr>
					<tr>
						<td><b><?php echo($lang == 1 ? "ডি.ও আইডি" : "D.O.ID");?> </b> <?php echo $inp->cb($id);?></td>
					</tr>
					
				</table>
			</td>
			<td>
				
				<table  height="90px" width="100%" >
				   <tr> 
					<td width="352px">
						
						<table height="90px" width="100%">
							<tr style="border-bottom: solid 1px #000">
								<td>
												
									<b><?php echo($lang == 1 ? "ক্রেতা এবং ঠিকানা" : "Client & Address");?> </b><?php echo $det2[0][0].'  '.$det2[0][1];?>
								</td>
							</tr>
							<tr>
								<td><b><?php echo($lang == 1 ? "ক্রেতা " : "Receiver Officer");?></b> <?php echo $det3[0][3];?></td>
							</tr>
					
						</table>					
					</td>
			     	   </tr>
				  
				   <tr> 
					<td></td>
			     	   </tr>
								
				</table>
			</td>
		</tr>
	</tbody>
   </table>


<table class="table table-striped table-hover report-table" border = '1' width = '100%'>
	<tbody>

		<tr>
			<td><?php echo ($lang == 1 ? "ক্রম " : "Sl");?></td>
			<td><?php echo ($lang == 1 ? "পন্যের কোড " : "Item Code");?></td>
			<td><?php echo ($lang == 1 ? "পন্য " : "Product");?></td>			
			<td><?php echo ($lang == 1 ? "ইউনিট " : "Unite");?></td>
			<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
			<td style='text-align:right;'><?php echo ($lang == 1 ? "দর " : "Rate");?></td>
			<td style='text-align:right;'><?php echo ($lang == 1 ? "মোট " : "SubTotal");?></td>
			<td><?php echo ($lang == 1 ?  "মূল্য হ্রাসের হার" : "Dis. Rate %");?></td>
			<td style='text-align:right;'><?php echo ($lang == 1 ? "পন্য মূল্য " : " price");?></td>
			<td style='text-align:right;'><?php echo ($lang == 1 ? "মোট মূল্য ": "Total");?></td>
		</tr>

<?php  $i = 0; $subtotal = 0 ; $tot = 0; foreach($det as $d){ ?>
		<tr>
			<td><?php echo $inp->cb( ++$i);?></td>
			<td><?php echo $inp->cb($d[25]);?></td>
			<td><?php echo $d[16];?></td>
			<td><?php echo $d[18];?> </td>
			<td><?php echo cb($inp,$d[11]);?></td>
			<td style='text-align:right;'><?php echo cb($inp,two_dec($d[12]));?></td>
			<td style='text-align:right;'><?php echo cb($inp,two_dec( $perItemTotalPrice=$d[11]*$d[12]));?></td>
			<td><?php echo $inp->cb($d[21]);?></td>
				<?php $discountPerProduct=(($d[12]*$d[21])/100); ?>		
			<td style='text-align:right;'><?php echo $inp->cb($sellingPrice=$d[12]-$discountPerProduct);?> </td>
			<td style='text-align:right;'><?php echo $inp->cb($d[11]*$sellingPrice);?></td>
			    
			    <?php $subtotal=$subtotal+$perItemTotalPrice; 
				  $tot = $tot + $d[11]*$sellingPrice;
			    ?>		
		</tr>

<?php  }  ?>

	</tbody>

</table>


<table  width="100%" >
	
	<tr>
	   <td width="53%"><table width="50%" >
		<tr>
			<td></td>		
		</tr>
	   </table>
	 </td>
	 <td width="47%">
		<table class ='table ' width="97%" >
		<tr>
			<td><?php echo ($lang == 1 ? "মোট " : "SubTotal");?></td><td></td><td class = 'sales-f-subt set-html-zero'><?php echo cb($inp,two_dec($subtotal));?></td>
		</tr>
		<tr>
			<td><?php echo ($lang == 1 ? "মূল্য হ্রাস" : "Discount");?> </td><td>-</td><td class = 'sales-f-dis set-html-zero'><?php echo $inp->cb($subtotal-$tot);?></td>
		</tr>
		<tr>
		<td><i class = 'fa fa-truck'></i><?php echo ($lang == 1 ? "যাতায়াত খরচ" : "Transport");?></td><td>+</td><td class = 'sales-f-trp set-html-zero'><?php  if($det[0][25]>0){ echo $inp->cb($det[0][24]);}else{ echo $inp->cb(0) ;}?></td>
		</tr>
		<tr class = 'row-red' >
			<td ><?php echo ($lang == 1 ? "মোট দেনা" : "Total Payable");?></td><td>: </td><td><label class = 'sales-f-ar set-html-zero'> <?php  echo $inp->cb($det[0][24]+$tot);?></label> <?php echo ($lang == 1 ? " টাকা মাত্র " : "Taka Only");?></td>
		</tr>
	   </table>
	</td>
	</tr>
</table>											

<table>
	<tr>
		<td><?php echo($lang?'মন্তব্য ':'Comments ');?> : <?php  echo $det[0][23];?></td>
	</tr>
</table>

<br/>
<table>
	<tr>
		<td id="bcTarget"></td><td></td>
	</tr>
</table>

 

<div class="form-group">
	<div class = 'col-lg-6'>
		<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : "Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
		</div>     
</div>	
<br/>
 
                                       	
			
			<?php  include('rf_bill3.php'); ?>




      	

