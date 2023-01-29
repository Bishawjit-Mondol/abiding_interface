<?
$wdis= 0;
$adis = 0;
?>
<div>
<?php 
 	$flag = false;
	
	$id =req('id'); 


	if(true){
		$query = "SELECT idsales, sales_date,  sales_status,  sales_comments, sales_ispurchase_return, iduser, sales_entrytime, sales_delivery_address, idproduct_catagory,sales_details_billing_date, sales_details_chalan_date, staff_name, staff_mobile, company_name,  company_address, company_contactperson_phone , sales_details_billing_date, sales_details_chalan_date, sales_discount_f_rate, sales_discount_f_ammount,sales_discount_p_rate, sales_discount_p_ammount,  sales_transport  FROM (
SELECT * FROM (
SELECT * FROM sales WHERE idsales = $id LIMIT 1
) AS a
LEFT JOIN
(SELECT * FROM sales_details WHERE idsales = $id LIMIT 1
) AS b USING(idsales)
LEFT JOIN
(SELECT idstaff,staff_name FROM staff
) AS d USING(idstaff)
LEFT JOIN 
staff_details USING(idstaff)
LEFT JOIN company USING(idcompany)
LEFT JOIN pestablishment USING(idpestablishment)
LEFT JOIN company_details USING(idcompany)

) as a LIMIT 1";
		
		$det = $qur->custom_select_query($query);

		$det2 = $qur->custom_select_query("SELECT idproduct, ___find_product_name_except_last(idproduct) , ___find_product_unit(idproduct), stock_product_output_qunatity, stock_product_output_price, ___find_product_type(idproduct)  FROM
(SELECT idstock_product_output FROM sales_stock_product_output s WHERE idsales = $id)
as a LEFT JOIN stock_product_output USING(idstock_product_output);");
		$cid__ = $det[0][1];
		$poid = $qur->custom_select_query("SELECT poid FROM sales_poid s WHERE idsales = $id LIMIT 1");
		$poid = $poid[0][0];
		if(!$poid){
			$poid = 'Nill';
		}
		$doid = $qur->custom_select_query("SELECT sales_delivery_address FROM sales_details s WHERE idsales = $id LIMIT 1;");
		$doid = $doid[0][0];
		if(!$doid){
			$doid = 'Nill';
		}


		//$det3 = $qur->custom_select_query("SELECT 3");
		

?>

<?php include('rh_bill.php'); ?>
<div class="bs-example table-responsive ">
 
    <table class="table" border = '2' width = '750px'>
	<tbody>
		<tr>
			<td>
				<table height="140px">
					<tr>
						<td width="352px"> <?php echo($lang == 1 ? "বিলের তারিখ" : " Billing Date");?> :  <?php echo ( $det[0][16] != null && $det[0][16] != '0000-00-00' ? dateconvert($det[0][16]) : "Not Yet" ); ?></td>
					</tr>					
					
					<tr>
						<td width="352px"> <?php echo($lang == 1 ? "চালানের তারিখ" : " Chalan Date");?> :  <?php echo ( $det[0][7] != null && $det[0][17] != '0000-00-00' ? dateconvert($det[0][17]) : "Not Yet" ); ?></td>
					</tr>
					
					<tr>
						<td width="352px"> <?php echo($lang == 1 ? "অর্ডারের তারিখ" : " Order Date");?> :  <?php echo ( $det[0][1] != null && $det[0][1] != '0000-00-00' ? dateconvert($det[0][1]) : "Not Yet" ); ?></td>
					</tr>
					<tr>
						<td width="352px"> <?php echo($lang == 1 ? "পি, ও, অাই, ডি" : " P.O. ID");?> : <?php echo $poid;?></td>
					</tr>
				</table>
			</td>
			<td>
				<table height="140px">
					<tr>
						<td width="354px" valign="top"> <?php echo($lang == 1 ? "ক্রেতার নাম ও ঠিকানা   " : "Customer Name & Address  ");?> :   <?php echo $det[0][13]."<br/>".$det[0][14]; ?></td>
					</tr>
					<tr>
						<td> <?php echo($lang == 1 ? "পৌছানোর ঠিকানা" : "Delivery Address");?> : <?php  echo $doid; ?> </td>
					</tr>

					<tr>
						<td> <?php echo($lang == 1 ? "বিক্রয় কর্মী" : "Sales Officer");?> :    <?php echo $det[0][11];?>, <?php echo($lang == 1 ? "মোবাইল" : "Mobile");?>  :  <?php  echo $det[0][12]; ?> </td>
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
			<td><?php echo ($lang == 1 ? "মোট" : "Subtotal");?></td>
			<td><?php echo ($lang == 1 ? "ছাড়ের হার" : "Dis Rate");?></td>
			<td><?php echo ($lang == 1 ? "বিক্রয় মূল্য" : "Selling Price");?></td>
			<td><?php echo ($lang == 1 ? "সর্ব মোট" : "Total"); ?></td>
			
			
			

		</tr>

	</thead>
	<tbody>


<?php $subtotal = 0;  $discount = $det[0][21] + $det[0][19] ; $transport = $det[0][22];  $i = 0; $tot = 0; foreach($det2 as $d){ ?>
		<tr>
			<td><?php echo $inp->cb(++$i);?></td>
			<td><?php echo "P-".$d[0];?></td>
			<td><?php echo $d[1];?></td>
			<td><?php echo $d[2];?> </td>
			<td><?php echo $inp->cb($d[3]);?></td>
			<td><?php echo $inp->cb(two_dec($d[4]));  ?></td>
			<td><?php echo $inp->cb(two_dec($d[4]*$d[3])); $subtotal = $subtotal + $d[3]*$d[4];  ?></td>
			<td><?php $dis = 0; if($d[5]==1){ $dis = $det[0][20]; }else if($d[5]==2){ $dis = $det[0][18]; }  echo $inp->cb(two_dec($dis))."%";  ?></td>
			
			<td><?php $sp = ($d[4])-(($d[4])/100)*$dis;  echo $inp->cb(two_dec($sp));  ?></td>
			<td style = 'text-align:right'><?php $tp = ($d[3]*$d[4])-(($d[3]*$d[4])/100)*$dis;  echo $inp->cb(two_dec($tp));  ?></td>
			
			
		</tr>

<?php  }  ?>

	</tbody>

</table>
<table width = '30%' style = 'float:right' border = '0px'>
	<tr>
		<td><?php echo ($lang == 1 ? "মোট  :" : "Subtotal :");?></td> <td style = 'text-align:right'> <? echo $inp->cb(two_dec($subtotal));?> </td>
	</tr>
	<tr>
		<td><?php echo ($lang == 1 ? "ছাড়  :" : "Discount :");?></td><td style = 'text-align:right'><? echo $inp->cb(two_dec($discount)); ?></td>
	</tr>
	<tr>
		<td><?php echo ($lang == 1 ? "যাতায়াত  :" : "Transport :");?></td><td style = 'text-align:right'><? echo $inp->cb(two_dec($transport)); ?></td>
	</tr>
	<tr>
		<td><?php echo ($lang == 1 ? "সর্ব মোট  :" : "Total :");?></td><td style = 'text-align:right'> <?php  echo $inp->cb(two_dec($subtotal-$discount+$transport)); ?> </td>
	</tr>

</table>
</br>

							
<br/>
<table>
	<tr>
		<td><?php echo($lang?'মন্তব্য ':'Comments ');?> : <?php  echo $det[0][20];?></td>
	</tr>
</table>

<br/>

<? if($det[0][16] != null && $det[0][16] != '0000-00-00'){ ?>

<div class="form-group">
	<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm pull-right">
									<button class="btn btn-info print-bill-secial"> <i class = 'fa fa-print'></i> Print Bill  </button>
								</div>                  
							</div>   
<? } ?>
<br/>


<?php
 	}
else 
	{ $error = $qur->custom_select_query("SELECT @software_error"); 
     			echo ($lang ?   " ব্যর্থ হয়েছে " : "Failed To Do :  ").$error[0][0];
	}
      	

      	
?>

</div>

<div id = 'page_print_306' hidden>
<!--  ----------------------------------------------- -->

<?php


 	$arr = $det2;

  if(count($arr)<= 22){
     $l = count($arr);
	$fpp = true;
  }
  else if(count($arr) > 27){
      $fpp = false;
      $l = 27;
  }
  else{
	$l = 22;
	$fpp = false;
  }
  
 
  $sub_tot = 0;
  $dis = 0;


?>
<br/>


<div class="print_reportx " style = 'disply:none'>

<div class = 'chalan_print_try <? if(!$fpp){ echo 'pagebreak'; } ?>' >
	<table class='roundangled20 <? if(!$fpp){ echo 'pagebreak'; } ?> '  >
		<tr class='onlyprint'><td colspan='2' class='pspace'></td></tr>
		<tr><td align = 'center' colspan = '2' class='banner'>Sales Invoice : AG<?=$det[0][0];?></td></tr>
		<tr class='topinfo'>

			  <td width = '40%'>
		
				  <table>
					  <tr>
					     <td> <?php echo($lang == 1 ? "বিলের তারিখ" : " Billing Date");?> :  <?php echo ( $det[0][16] != null && $det[0][16] != '0000-00-00' ? dateconvert($det[0][16]) : "Not Yet" ); ?></td>
					  </tr>
					  <tr>
					      <td width="352px"> <?php echo($lang == 1 ? "চালানের তারিখ" : " Chalan Date");?> :  <?php echo ( $det[0][7] != null && $det[0][17] != '0000-00-00' ? dateconvert($det[0][17]) : "Not Yet" ); ?></td>
					  </tr>

					  <tr>
						<td> <?php echo($lang == 1 ? "অর্ডারের তারিখ" : " Order Date");?> :  <?php echo ( $det[0][1] != null && $det[0][1] != '0000-00-00' ? dateconvert($det[0][1]) : "Not Yet" ); ?></td>
					  </tr>

					  <tr>
						<td> <?php echo($lang == 1 ? "পি, ও, অাই, ডি" : " P.O. ID");?> : <?php echo $poid;?></td>
					  </tr>


				  </table>
		      </td>
			  <td width = '60%' >
				  <table>
  					   <tr>
					      <td> <?php echo($lang == 1 ? "ক্রেতার নাম ও ঠিকানা   " : "Customer Name & Address  ");?> :   <?php echo $det[0][13]."<br/>".$det[0][14];?>
					      </td>
					  </tr>
					<tr>
						<td> <?php echo($lang == 1 ? "পৌছানোর ঠিকানা" : "Delivery Address");?> : <?php  echo $doid; ?> </td>
					</tr>

					  <tr>
					      <td><?php echo($lang == 1 ? "বিক্রয় কর্মী" : "Sales Officer");?> :    <?php echo $det[0][11];?>, <?php echo($lang == 1 ? "মোবাইল" : "Mobile");?>  :  <?php  echo $det[0][12]; ?> </td>
					  </tr>
					  
				  </table>
		      </td>

		</tr>

		<tr><td colspan='2' class='onlyprint'><br/></td></tr>

		<tr><td colspan = '2'>
		  <table class='data' class="report-table">

<thead>
			<tr>
			<td><?php echo ($lang == 1 ? "ক্রম " : "Sl");?></td>
			<td width = '80px'><?php echo ($lang == 1 ? "পন্যের কোড " : "Item<br/>Code");?></td>
			<td><?php echo ($lang == 1 ? "পন্য" : "Product");?></td>
			<td><?php echo ($lang == 1 ? "ইউনিট" : "Unite");?></td>
			<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
			<td><?php echo ($lang == 1 ? "দর" : "Rate");?></td>
			<td><?php echo ($lang == 1 ? "মোট" : "Subtotal");?></td>
			<td><?php echo ($lang == 1 ? "ছাড়ের হার" : "Dis Rate");?></td>
			<td><?php echo ($lang == 1 ? "বিক্রয় মূল্য" : "Selling Price");?></td>
			<td><?php echo ($lang == 1 ? "সর্ব মোট" : "Total");?></td>
			<!--<td class='ral'><?php echo ($lang == 1 ? "ইউনিট" : "Unite");?></td> -->
			</tr>

</thead>
<tbody>


<?php

$subtotal = 0;  $discount = $det[0][21] + $det[0][19] ; $transport = $det[0][22];

for($i=0 , $tot = 0;  $i< $l  ; $i++){ //&& count($arr)
?>
		<tr>
			<td><?php echo $inp->cb($i+1);?></td>
			<td><?php echo "P-".$arr[$i][0];?></td>
			<td><?php echo $arr[$i][1];?></td>
			<td><?php echo $arr[$i][2]; ?> </td>
			<td><?php echo $inp->cb($arr[$i][3]);?></td>
			<td><?php   echo $inp->cb(two_dec($arr[$i][4]));  ?></td>
			<td><?php $wdis = $wdis + $arr[$i][4]*$arr[$i][3];  echo $inp->cb(two_dec($arr[$i][4]*$arr[$i][3])); 
				$subtotal = $subtotal + $arr[$i][3]*$arr[$i][4];  ?></td>
			<td><?php $dis = 0; if($arr[$i][5]==1){ $dis = $det[0][20]; }else if($arr[$i][5]==2){ $dis = $det[0][18]; }  
			    echo $inp->cb(two_dec($dis))."%";  ?>
			</td>
			
			<td><?php  $sp = ($arr[$i][4])-(($arr[$i][4])/100)*$dis;  echo $inp->cb(two_dec($sp));  ?></td>
			<td style = 'text-align:right'><?php  $tp = ($arr[$i][3]*$arr[$i][4])-(($arr[$i][3]*$arr[$i][4])/100)*$dis;  echo $inp->cb(two_dec($tp));  $adis = $adis + $tp; ?></td>
		</tr>

<?php } ?>

<? 
	    if($fpp){
 ?>
											<tr><td colspan='6' class='nb'></td><td colspan='2'>Subtotal</td><td colspan='2' class='ral'><? echo $inp->cb(two_dec($wdis)); ?></td></tr>
											<tr><td colspan='6' class='nb'></td><td colspan='2'>Discount</td><td colspan='2' class='ral'><? echo $inp->cb(two_dec($wdis - $adis)); ?> </td></tr>
											<tr><td colspan='6' class='nb'></td><td colspan='2'>Transport</td><td colspan='2' class='ral'> <? echo $inp->cb(two_dec($transport)); ?> </td></tr>
											<tr><td colspan='6' class='nb'></td><td colspan='2'>Total</td><td colspan='2' class='ral'> <? echo $inp->cb(two_dec($adis + $transport)); ?>  </td></tr>




<? } ?>
</tbody>

	  </table>
		</td></tr>
<? 
	    if($fpp){ 
 ?>
		<tr class='onlyprint'>
			<td colspan='2'>
				<table  class='signature'>
					  <tr>
							  <td><br/><br/>___________________</td><td><br/><br/>___________________</td><td><br/><br/>___________________</td>
					  </tr>
					  <tr>
							  <td><?php echo ($lang == 1 ? "গ্রহীতার স্বাক্ষর" : "Receiver's Signature");?></td><td><?php echo ($lang == 1 ? "অ্যাকাউন্ট" : "Accounts");?></td><td><?php echo ($lang == 1 ? "কর্তৃপক্ষের স্বাক্ষর" : "Authorized Signature");?></td>
					  </tr>
				</table>
			</td>
		</tr>
		<tr class='onlyprint' style="border:0px";>
			<td colspan='2' style="text-align:center">
				<div style='font-family:Helvetica, Arial, Verdana, sans-serif; font-size:15px;'>সফটওয়্যার প্রস্তুতকারকঃ ইউনিক ওয়েবার্স লিমিটেড, ওয়েবসাইটঃ www.uniquewebers.com, মোবাইলঃ ০১৭৭৭৭-৪৩-৭০৩  </div>
			</td>
		</tr>		
<? } ?>

</div>

  <? if(count($arr)>$l){  ?>
<div class = 'chalan_print_try'>
<table class='roundangled20'>
<tr class='onlyprint'><td class='pspace'> </td></tr>

		<tr>
			<td>

			  <table class='data'>
				  <tr>
				<td><?php echo ($lang == 1 ? "ক্রম " : "Sl");?></td>
				<td width = '80px'><?php echo ($lang == 1 ? "পন্যের কোড " : "Item<br/>Code");?></td>
				<td><?php echo ($lang == 1 ? "পন্য" : "Product");?></td>
				<td><?php echo ($lang == 1 ? "ইউনিট" : "Unite");?></td>
				<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
				<td><?php echo ($lang == 1 ? "দর" : "Rate");?></td>
				<td><?php echo ($lang == 1 ? "মোট দর" : "Subtotal");?></td>
				<td><?php echo ($lang == 1 ? "ছাড়ের হার" : "Dis Rate");?></td>
				<td><?php echo ($lang == 1 ? "বিক্রয় মূল্য" : "Selling Price");?></td>
				<td><?php echo ($lang == 1 ? "মোট" : "Total");?></td>
			</td>
		</tr>


<?php  $subtotal = 0;  $discount = $det[0][21] + $det[0][19] ; $transport = $det[0][22];  
	

for($i=$l ; $i < count($arr) ; $i++){ //&& count($arr)

?>
		<tr>
			<td><?php echo $inp->cb($i+1);?></td>
			<td><?php echo "P-".$arr[$i][0];?></td>
			<td><?php echo $arr[$i][1];?></td>
			<td><?php echo $arr[$i][2]; ?> </td>
			<td><?php echo $inp->cb($arr[$i][3]);?></td>
			<td><?php   echo $inp->cb(two_dec($arr[$i][4]));  ?></td>
			<td><?php $wdis = $wdis + $arr[$i][4]*$arr[$i][3];  echo $inp->cb(two_dec($arr[$i][4]*$arr[$i][3])); 
				$subtotal = $subtotal + $arr[$i][3]*$arr[$i][4];  ?></td>
			<td><?php $dis = 0; if($arr[$i][5]==1){ $dis = $det[0][20]; }else if($arr[$i][5]==2){ $dis = $det[0][18]; }  
			    echo $inp->cb(two_dec($dis))."%";  ?>
			</td>
			
			<td><?php  $sp = ($arr[$i][4])-(($arr[$i][4])/100)*$dis;  echo $inp->cb(two_dec($sp));  ?></td>
			<td style = 'text-align:right'><?php  $tp = ($arr[$i][3]*$arr[$i][4])-(($arr[$i][3]*$arr[$i][4])/100)*$dis;  echo $inp->cb(two_dec($tp));  $adis = $adis + $tp; ?></td>
			
			
		</tr>



<?php  }  ?>
<? 
	    if(!$fpp){
 ?>
											<tr><td colspan='6' class='nb'></td><td colspan='2'>Subtotal</td><td colspan='2' class='ral'><? echo $inp->cb(two_dec($wdis)); ?></td></tr>
											<tr><td colspan='6' class='nb'></td><td colspan='2'>Discount</td><td colspan='2' class='ral'><? echo $inp->cb(two_dec($wdis - $adis)); ?> </td></tr>
											<tr><td colspan='6' class='nb'></td><td colspan='2'>Transport</td><td colspan='2' class='ral'> <? echo $inp->cb(two_dec($transport)); ?> </td></tr>
											<tr><td colspan='6' class='nb'></td><td colspan='2'>Total</td><td colspan='2' class='ral'> <? echo $inp->cb(two_dec($adis + $transport)); ?>  </td></tr>




<? } ?>
				</table>
			</td>
		</tr>

<?
	    if(!$fpp){
 ?>
		<tr class='onlyprint'>
			<td colspan='2'>
				<table  class='signature'>
					  <tr>
							  <td><br/><br/>___________________</td><td><br/><br/>___________________</td><td><br/><br/>___________________</td>
					  </tr>
					  <tr>
							  <td><?php echo ($lang == 1 ? "গ্রহীতার স্বাক্ষর" : "Receiver's Signature");?></td><td><?php echo ($lang == 1 ? "অ্যাকাউন্ট" : "Accounts");?></td><td><?php echo ($lang == 1 ? "কর্তৃপক্ষের স্বাক্ষর" : "Authorized Signature");?></td>
					  </tr>
				</table>
			</td>
		</tr>
		<tr class='onlyprint'>
			<td colspan='2' style="text-align:center">
				<div style='font-family:Helvetica, Arial, Verdana, sans-serif; font-size:15px;'>সফটওয়্যার প্রস্তুতকারকঃ ইউনিক ওয়েবার্স লিমিটেড, ওয়েবসাইটঃ www.uniquewebers.com, মোবাইলঃ ০১৭৭৭৭-৪৩-৭০৩  </div>
			</td>
		</tr>
		
<? } ?>

</table>

			  

</div>
<? } ?>

</div>
</div>
