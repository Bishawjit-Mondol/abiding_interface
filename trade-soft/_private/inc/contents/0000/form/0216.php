<?php 

	date_default_timezone_set("Asia/Dhaka");
	//$printd =  
    $label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "ক্রেতা " : "Client"); 
	$label_3 =  ($lang == 1 ? "গুদাম " : "Godown");   

	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_5 =  ($lang == 1 ? "ছাড় " : "Discount");   
	$label_6 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s = ($lang?"যোগ করুন":"Add");
	
		
	$flag = false;	
	 $id =req('id');
	 $d3 =req_date('d3');
	$qur->execute("SET @software_ln = $lang");
	
	if(req('rtype')=='1'){
		
		
		 $flag = $qur->execute( "UPDATE sales SET sales_status=2 WHERE idsales= $id;" ); 
	
		if($flag){
			 $flag = $qur->execute("UPDATE sales_details set sales_details_billing_date = '".$d3."' WHERE idsales= $id");
		}
		
		if($flag){   ?>
			<script type = 'text/javascript'>
			$(".confirm_sale_<?php echo $id; ?>").hide('slide');
			</script>
    	  <?php   }
	}
	if(req('rtype')=='2'){
		$flag = true;
	}
	

	if($flag){
		$qur->execute( "COMMIT" );


		$query = "SELECT idsales, idcompany,
				sales_date, sales_ammount, idsales_type, sales_status, stock_product_output_date,
				stock_product_output_qunatity, stock_product_output_price, stock_product_output_type,
 				stock_product_output_status, product_name, product_mrp, product_mpp, unite_name,
        			idpestablishment , pestablishment_name, pestablishment_address
				, sales_discount_rate, sales_discount_ammount, sales_comments, sales_transport,sales_details_billing_date, idproduct

				FROM (
				SELECT idsales, idcompany,
				sales_date, sales_ammount, idsales_type, sales_status, stock_product_output_date,
				stock_product_output_qunatity, stock_product_output_price, stock_product_output_type,
 				stock_product_output_status, product_name, product_mrp, product_mpp, unite_name ,s.idpestablishment
				, sales_discount_rate, sales_discount_ammount, sales_comments, sales_transport,sales_details_billing_date, idproduct


				FROM (SELECT * FROM `sales` WHERE idsales = $id LIMIT 1) as a
			        LEFT join sales_details s using(idsales)
			        LEFT JOIN (Select * From company where company_type=2 ) as d USING(idcompany)
			        LEFT JOIN ( SELECT * FROM  sales_stock_product_output WHERE idsales = $id ) as b USING(idsales)
       				LEFT JOIN stock_product_output USING(idstock_product_output)
				LEFT JOIN product USING(idproduct)
				LEFT JOIN unite USING(idunite)) AS C
  				LEFT JOIN pestablishment as p USING(idpestablishment);";
		
		$det = $qur->custom_select_query($query);

		$det2 = $qur->custom_select_query("SELECT company_name,company_address,company_phone FROM company c WHERE idcompany= ".$det[0][1]);
		$cid__ = $det[0][1];

		$det3 = $qur->custom_select_query("select  pestablishment_name ,idsales,idstaff , staff_name , staff_mobile
  						FROM (select  idsales,idstaff ,staff_name , staff_mobile from staff
              					left join staff_details using (idstaff)
  						left join sales_details using (idstaff) where idsales =$id) as a
						left join (select * FROM sales_stock_product_output WHERE idsales = $id LIMIT 1) as b using (idsales)
						Left join stock_product_output using(idstock_product_output)
						Left join pestablishment using(idpestablishment);");
		
	//}
	
?>

<?php include('rh_bill.php'); ?>
<div class="bs-example table-responsive ">
 
    <table class="table" border = '2' width = '750px'>
	<tbody>
		<tr>
			<td>
				<table height="180px">
					<tr>
						<td width="352px"><b><?php echo($lang == 1 ? "তারিখ" : " Date");?> </b> <?php echo dateconvert($det[0][2]);?></td>
					</tr>					

					<tr>
						<td><b><?php echo($lang == 1 ? "ডি.ও আইডি" : "D.O.ID");?> </b> <?php echo $id;?></td>
					</tr>
					
					<tr>
						<td><b><?php echo($lang == 1 ? "ভ্যাট রেজ. নম্বর" : "Vat Reg. No");?></b> <?php echo '786'; ?></td>
					</tr>
					<tr>
						<td><b><?php echo($lang == 1 ? "বিক্রয় কর্মী" : "Sales Officer");?></b> <?php echo $det3[0][3];?></td>
					</tr>
					
					<tr>
						<td><b><?php echo($lang == 1 ? "যোগাযোগের নম্বর" : "Contact no");?></b> <?php echo $det3[0][4];?></td>
					</tr>
				</table>
			</td>
			<td>
				<table height="180px">
					<tr>
						<td width="354px"><b><?php echo($lang == 1 ? "ক্রয়কারী ও ঠিকানা" : "Customer & Address ");?> </b><?php echo $det2[0][0].'  '.$det2[0][1];?></td>
					</tr>
					<tr>
						<td><b><?php echo($lang == 1 ? "যেখান থেকে এসেছে" : "Delivered From");?></b> <?php echo $det3[0][0];?></td>
					</tr>
					<tr>
						<td><b><?php echo($lang == 1 ?  "যোগাযোগের নম্বর" : "Contact No");?> </b><?php echo $det2[0][2];?></td>
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
			<td><?php echo ($lang == 1 ? "পন্য" : "Product");?></td>
			<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
			<td style='text-align:right;'><?php echo ($lang == 1 ? "দর " : "Rate");?></td>
			<td style='text-align:right;'><?php echo ($lang == 1 ? "মোট " : "SubTotal");?></td>
			<td><?php echo ($lang == 1 ? "মূল্য হ্রাসের হার" : "Dis. Rate %");?></td>
			<td><?php echo ($lang == 1 ? "পন্য বিক্রয় মূল্য " : "Selling price");?></td>
			
			<td style='text-align:right;'><?php echo ($lang == 1 ? "মোট " : "Total");?></td>
		</tr>

		
<?php  $i = 0;$subtotal = 0 ; $tot = 0;  foreach($det as $d){ ?>
		<tr>
			<td><?php echo $inp->cb(++$i);?></td>
			<td><?php echo $d[23];?></td>
			<td><?php echo $d[11];?></td>
			<td><?php echo $inp->cb($d[7]).' '.$d[14];?> </td>
			<td style='text-align:right;'><?php echo $inp->cb(two_dec($d[8]));?></td>
			<td style='text-align:right;'><?php echo $inp->cb($perItemTotalPrice=two_dec($d[7]*$d[8]));?></td>
			<td style='text-align:right;'><?php echo $inp->cb($discountPerProduct=(($d[8]*$d[18])/100));?></td>
			
			
			
			<td style='text-align:right;'><?php echo $inp->cb($sellingPrice=$d[8]-$discountPerProduct);?> </td>
			<td style='text-align:right;'><?php echo $inp->cb($d[7]*$sellingPrice);?></td>
			    <?php $subtotal=$subtotal+$perItemTotalPrice; 
				  $tot = $tot + $d[7]*$sellingPrice;
			    ?>	
			
		
		</tr>

<?php  }  ?>

	</tbody>

</table>
</br>



<table  width="100%" >
	
	<tr>
	   <td width="45%">
	  <table  width="97%" >
		<tr>
			<td></td> <td></td><td></td>
		</tr>
		
		<tr>
			<td></td><td></td><td></td>
		</tr>
		
		<tr>
			<td></td><td></td><td></td>
		</tr>
		
	   </table>
	 </td>
	 <td width="47%">
		<table class ='table ' width="97%" >
		<tr>
			<td><?php echo ($lang == 1 ? "মোট " : "SubTotal");?></td><td></td><td class = 'sales-f-subt set-html-zero'><?php echo $inp->cb(two_dec($subtotal));?></td>
		</tr>
	 <tr>
			<td><?php  echo ($lang == 1 ? "মূল্য হ্রাস" : "Discount");?></td><td>-</td><td class = 'sales-f-dis set-html-zero'><?php   echo $inp->cb($subtotal-$tot);?></td>
	</tr>
	
		<tr>
		<td><i class = 'fa fa-truck'></i> <?php echo ($lang == 1 ? "যাতায়াত খরচ" : "Transport");?></td><td>+</td><td class = 'sales-f-trp set-html-zero'><?php  if($det[0][21]>0){ echo $inp->cb($det[0][21]);}else{ echo $inp->cb(0) ;}?></td>
		</tr>
		<tr  >
			<td ><?php echo ($lang == 1 ? " বিল " : " bill");?></td><td>: </td><td><label class = 'sales-f-ar set-html-zero'> <?php  echo $inp->cb($tot+$det[0][21]);?></label></td>
		</tr>
	   </table>
	</td>
	</tr>
</table>	
								
<br/>
<table>
	<tr>
		<td><?php echo($lang?'মন্তব্য ':'Comments ');?> : <?php  echo $det[0][20];?></td>
	</tr>
</table>

<br/>


<div class="form-group">
	<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i><?php echo($lang == 1 ? " প্রিন্ট রিপোর্ট । প্রতি পৃষ্ঠাই : " : "Print Report. Per Page :");?> </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>        
</div>
<br/>
                                        	
			
			<?php include('rf_bill.php'); ?>
			
			
<?php  } else { $error = $qur->custom_select_query("SELECT @software_error"); 
   echo ($lang ?   " ব্যর্থ হয়েছে " : "Failed To Do :  ").$error[0][0]; } ?>
      	

      	
