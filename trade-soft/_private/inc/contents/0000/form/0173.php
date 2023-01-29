
<?php 
		
	$flag = false;
	
	$id = req('id');

	if(req('rtype')=='1'){
		$flag = $qur->execute( "UPDATE purchase SET purchase_status=1 WHERE idpurchase = $id;" ); 
		if($flag){
			$flag = $qur->execute("UPDATE stock_product_input set stock_product_input_status = 1 WHERE idstock_product_input IN (SELECT idstock_product_input FROM purchase_stock_product_input s WHERE idpurchase = $id)");
		}
		if($flag){ ?>
			<script type = 'text/javascript'>
			$(".confirm_pur_<?php echo $id; ?>").hide('slide');
			</script>
	 <?php	} 
   	 }
	if(req('rtype')=='2'){
		$flag = true;
	}



	if($flag){
	
		$qur->execute( "COMMIT" );

		$query = "SELECT idpurchase , purchase_date , purchase_status,purchase_comments , '' ,iduser , purchase_entrytime , '' ,idproduct_catagory , purchase_details_billing_date, purchase_details_chalan_date , staff_name, staff_mobile, company_name, company_address, company_contactperson_phone , purchase_discount_p_rate ,purchase_discount_p_ammount ,purchase_discount_f_rate , purchase_transport , purchase_discount_f_ammount , purchase_dollar_rate 
FROM (SELECT * FROM (SELECT * FROM purchase where idpurchase= $id LIMIT 1 ) AS a 
LEFT jOIN ( SELECT * FROM purchase_details WHERE idpurchase = $id LIMIT 1) AS b using (idpurchase) 
LEFT JOIN (SELECT idstaff,staff_name FROM staff ) AS c USING(idstaff) 
LEFT JOIN staff_details using(idstaff) LEFT join company USING(idcompany) 
LEFT JOIN pestablishment USING(idpestablishment) 
LEFT JOIN company_details USING(idcompany)) as d LIMIT 1 ";
		
		$det = $qur->custom_select_query($query);

		$det2 = $qur->custom_select_query("SELECT idproduct, ___find_product_name_except_last(idproduct) , ___find_product_unit(idproduct), stock_product_input_qunatity, stock_product_input_price, ___find_product_type(idproduct) FROM (SELECT idstock_product_input FROM purchase_stock_product_input s WHERE idpurchase = $id) as a LEFT JOIN stock_product_input USING(idstock_product_input);");
		$cid__ = $det[0][1];
		

?>

<?php  include('rh_pur.php'); ?>
<div class="bs-example table-responsive ">
 
    <table class="table" border = '2' width = '750px'>
	<tbody>
		<tr>
		<td>
				<table height="140px">
					<tr>
						<td width="352px"> <?php echo($lang == 1 ? "ক্রয় তারিখ" : "Purchase Date");?> :  <?php echo ( $det[0][9] != null && $det[0][9] != '0000-00-00' ? dateconvert($det[0][1]) : "Not Yet" ); ?></td>
					</tr>					
				        <!--
					<tr>
						<td width="352px" > <?php echo($lang == 1 ? "চালানের তারিখ" : " Chalan Date");?> :  <?php echo ( $det[0][10] != null && $det[0][10] != '0000-00-00' ? dateconvert($det[0][10]) : "Not Yet" ); ?></td>
					</tr>
					
					<tr>
						<td width="352px"> <?php echo($lang == 1 ? "অর্ডারের তারিখ" : " Order Date");?> :  <?php echo ( $det[0][1] != null && $det[0][1] != '0000-00-00' ? dateconvert($det[0][1]) : "Not Yet" ); ?></td>
					</tr>
				        -->
					<tr>
						<td width="352px"> <?php echo($lang == 1 ? "ডি, ও, অাই, ডি" : " D.O. ID");?> :  <?php echo $det[0][0];?></td>
					</tr>
				</table>
			</td>
			<td>
				<table height="140px">
					<tr>
						<td width="354px" valign="top"> <?php echo($lang == 1 ? "ক্রয়কারী ও ঠিকানা   " : "Supplier & Address  ");?> :   <?php echo $det[0][13]."<br/>".$det[0][14];?></td>
					</tr>

					<tr>
						<td> <?php echo($lang == 1 ?  "ক্রেতা " : "Receiver Officer");?> :    <?php echo $det[0][11];?>, <?php echo($lang == 1 ? "মোবাইল" : "Mobile");?>  :  <?php  echo $det[0][12]; ?> </td>
					</tr>
					

				</table>

			</td>
		</tr>
	</tbody>
   </table>


<table class="table table-striped table-hover report-table" border = '1' width = '100%'>
	<thead>
		<tr>
			<td><?php echo ($lang == 1 ? "ক্রম " : "Sl");?></td>
			<td><?php echo ($lang == 1 ? "পন্যের কোড " : "Item Code");?></td>
			<td><?php echo ($lang == 1 ? "পন্য" : "Product");?></td>
			<td><?php echo ($lang == 1 ? "ইউনিট" : "Unite");?></td>
			<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
			<td><?php echo ($lang == 1 ? "দর" : "Rate");?></td>
			<td><?php echo ($lang == 1 ? "মোট দর" : "Subtotal");?></td>
			<td><?php echo ($lang == 1 ? "ছাড়ের হার" : "Dis Rate");?></td>
			<td><?php echo ($lang == 1 ? "ক্রয় মূল্য" : "Purchasinging Price");?></td>
			<td><?php echo ($lang == 1 ? "মোট" : "Total");?></td>
		</tr>

	</thead>
	<tbody>


<?php $subtotal = 0;  $discount = ($det[0][20]+$det[0][17])/$det[0][21] ; $transport = $det[0][19]/$det[0][21];  $i = 0; $tot = 0; 
	foreach($det2 as $d){ ?>
		<tr>
			<td><?php echo $inp->cb(++$i);?></td>
			<td><?php echo "P-".$d[0];?></td>
			<td><?php echo $d[1];?></td>
			<td><?php echo $inp->cb($d[2])?> </td>
			<td><?php echo $d[3];?></td>
			<td><?php echo $inp->cb(two_dec($d[4]/$det[0][21]));  ?></td>
			<td><?php echo $inp->cb(two_dec($d[3]*$d[4]/$det[0][21])); $subtotal = $subtotal + $d[3]*$d[4]/$det[0][21];  ?></td>
			<td><?php $dis = 0; if($d[5]==1){ $dis = $det[0][18]; }else if($d[5]==2){ $dis = $det[0][16]; }  echo $inp->cb(two_dec($dis))."%";  ?></td>
			
			<td><?php $sp = ($d[4]/$det[0][21])-(($d[4]/$det[0][21])/100)*$dis;  echo $inp->cb(two_dec($sp));  ?></td>
			<td style = 'text-align:right'><?php $tp = ($d[3]*$sp);  echo $inp->cb(two_dec($tp));  ?></td>
			
			
		</tr>

<?php  }  ?>

	</tbody>

</table>
<table width = '30%' style = 'float:right' border = '0px'>
	<tr>
		<td>Subtotal : </td> <td style = 'text-align:right'> <? echo $subtotal;?> </td>
	</tr>
	<tr>
		<td>Discount : </td><td style = 'text-align:right'><? echo $discount; ?></td>
	</tr>
	<tr>
		<td>Transport : </td><td style = 'text-align:right'><? echo $transport; ?></td>
	</tr>
	<tr>
		<td>Total : </td><td style = 'text-align:right'> <?php  echo $subtotal-$discount+$transport; ?> </td>
	</tr>

</table>
</br>

							
<br/>
<table>
	<tr>
		<td>
		<?php 
		if($det[0][21] != 1){
			echo ($lang? 'ডলার রেট :'.$det[0][21].' টাকা' :'Dollar Rate :'.$det[0][21].' TK');
		}
		?>
		</td>
	</tr>
	<tr>
		<td><?php echo($lang?'মন্তব্য ':'Comments ');?> : <?php  echo $det[0][3];?></td>
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
		<br/><br/>

		
		<div  class="col-lg-4">
			<div class="input-group margin-bottom-sm">
				<button type ='button'  class='inactive page-loader box-entry link0212 btn btn-info ' data =  "&id=<?php echo $id; ?>&ln=<?php echo $lang; ?>&rtype=2"><?php echo ($lang == 1 ? "দেখুন " : "Show ");?><i>৳</i></button> 									
			</div>                   
		</div>
		</br></br>
		
 	<?php include('rf_bill.php'); ?>

<?php
 	} else 
		{ $error = $qur->custom_select_query("SELECT @software_error"); 
     			echo ($lang ?   " ব্যর্থ হয়েছে " : "Failed To Do :  ").$error[0][0];
		}
      	

      	
?>


