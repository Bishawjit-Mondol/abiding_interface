<div>
<?php 
 
	$flag = false;

	$id =req('id'); 


	if(true){

		$query = "SELECT idsales, sales_date,  sales_status,  sales_comments, sales_ispurchase_return, iduser, sales_entrytime,
		sales_delivery_address, idproduct_catagory,sales_details_billing_date, sales_details_chalan_date, staff_name, staff_mobile, 
		company_name,  company_address, company_contactperson_phone FROM (
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

		$det2 = $qur->custom_select_query("SELECT idproduct, ___find_product_name_except_last(idproduct) , ___find_product_unit(idproduct), stock_product_output_qunatity , ammount 
FROM
(SELECT idstock_product_output FROM sales_stock_product_output s WHERE idsales = $id)
as a
LEFT JOIN stock_product_output USING(idstock_product_output)
LEFT JOIN pestablishment_product USING(idproduct) group by idproduct;");

		$cid__ = $det[0][1];

?>

<?php 

// include('rh_bill.php');

 ?>
<div class="bs-example table-responsive ">
 <br/>
    <table class="table" border = '2' width = '750px'>
	<tbody>
		<tr>
			<td>
				<table height="180px">
					<tr>
						<td width="352px"> <?php echo($lang == 1 ? "অর্ডারের তারিখ" : " Order Date");?> :  <?php echo dateconvert($det[0][1]);?></td>
					</tr>					
					
					<tr>
						<td> <?php echo($lang == 1 ? "ডি.ও আইডি" : "D.O.ID");?> :    <?php echo $id;?></td>
					</tr>
					
					<tr>
						<td> <?php echo($lang == 1 ? "ভ্যাট রেজ. নম্বর" : "Vat Reg. No");?> :    <?php echo '19051018738'; ?></td>
					</tr>
					<tr>
						<td> <?php echo($lang == 1 ? "বিক্রয় কর্মী" : "Sales Officer");?> :    <?php echo $det[0][11];?></td>
					</tr>
					
					<tr>
						<td> <?php echo($lang == 1 ? "যোগাযোগের নম্বর" : "Contact no");?> :    <?php echo $det[0][12];?></td>
					</tr>
				</table>
			</td>
			<td>
				<table height="180px">
					<tr>
						<td width="354px" valign="top"> <?php echo($lang == 1 ? "ক্রয়কারী ও ঠিকানা   " : "Customer & Address  ");?> :   <?php echo $det[0][13]."<br/>".$det[0][14];?></td>
					</tr>
					<tr>
						<td> <?php echo($lang == 1 ? "ডেলিভারীর  ঠিকানা " : "Delivery Address");?> :    <?php echo $det[0][7];?></td>
					</tr>
					<tr>
						<td> <?php echo($lang == 1 ?  "যোগাযোগের নম্বর" : "Contact No");?> :   <?php echo $det[0][15];?></td>
					</tr>

				</table>

			</td>
		</tr>
	</tbody>
   </table>


<table class="table table-striped table-hover report-table1" border = '1' width = '100%'>
	<thead>
		<tr>
			<td><?php echo ($lang == 1 ? "ক্রম " : "Sl");?></td>
			<td><?php echo ($lang == 1 ? "পন্যের কোড " : "Item Code");?></td>
			<td><?php echo ($lang == 1 ? "পন্য" : "Product");?></td>
			<td><?php echo ($lang == 1 ? "ইউনিট" : "Unite");?></td>
			<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
			<td><?php echo ($lang == 1 ? "ব্যবহারযোগ্যতা " : "Available");?></td>		
		
		</tr>

	</thead>
	<tbody>


<?php  $i = 0; $tot = 0; foreach($det2 as $d){ ?>
		<tr>
			<td><?php echo $inp->cb(++$i);?></td>
			<td><?php echo $d[0];?></td>
			<td><?php echo $d[1];?></td>
			<td><?php echo $inp->cb($d[2])?> </td>
			<td><?php echo $inp->cb($d[3]);?></td>
			<td><?php 
				
				if( $d[3]>$d[4] ){ echo 'Not available '.($d[3]-$d[4]);}
				elseif( ($d[3]<=$d[4])&&($d[3]!=0) ){ echo 'OK';}
				elseif( ($d[3]==$d[4])&&($d[3]==0) ){ echo 'Demanded can not be 0';} ?>
			</td>
		</tr>

<?php  }  ?>

	</tbody>

</table>
</br>

							
<br/>
<table>
	<tr>
		<td><?php echo($lang ? 'মন্তব্য ':'Comments ');?> : <?php  echo $det[0][20];?></td>
	</tr>
</table>

<br/>


<div class="form-group">
	<div class = 'col-lg-2'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-chalan-secial"><i class = 'fa fa-print'></i> </span>

								</div>                  
							</div>        
</div>
<br/>
 	
<?php
 	} else 
		{ $error = $qur->custom_select_query("SELECT @software_error"); 
     			echo ($lang ?   " ব্যর্থ হয়েছে " : "Failed To Do :  ").$error[0][0];
		}
 ?>


<div id = 'page_print_211' hidden>

<!--  ----------------------------------------------- -->

<?
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
	<table class='roundangled20'>
		<tr class='onlyprint'><td colspan='2' class='pspace'></td></tr>
		<tr><td align = 'center' colspan = '2' class='banner'>Delivery Challan : <?=$det[0][0];?></td></tr>
		<tr class='topinfo'>

			  <td width = '40%'>
		
				  <table>
					  <tr>
					     <td><?php echo($lang == 1 ? "অর্ডারের তারিখ" : " Order Date");?> :  <?php echo dateconvert($det[0][1]);?></td>
					  </tr>
					  <tr>
					      <td><?php echo($lang == 1 ? "ডি.ও আইডি" : "D.O.ID");?> :  <?php echo $id;?></td>
					  </tr>

					  <tr>
						<td> <?php echo($lang == 1 ? "ভ্যাট রেজ. নম্বর" : "Vat Reg. No");?> :    <?php echo '19051018738'; ?></td>
					  </tr>

					  <tr>
						<td> <?php echo($lang == 1 ? "বিক্রয় কর্মী" : "Sales Officer");?> :    <?php echo $det[0][11];?></td>
					  </tr>

					  <tr>
						<td> <?php echo($lang == 1 ? "যোগাযোগের নম্বর" : "Contact no");?> :    <?php echo $det[0][12];?></td>					  </tr>

				  </table>
		      </td>
			  <td width = '60%' >
<?
	
//$dis = $det_1[0][23]."( ID : ".(100+$det_1[0][24]).")<br/>".$det_1[0][20];

?>
				  <table>


					<tr>
					<td width="354px" valign="top"> <?php echo($lang == 1 ? "ক্রেতা ও ঠিকানা   " : "Customer & Address  ");?> :   <?php echo $det[0][13]."<br/>".$det[0][14];?></td>
					</tr>
						
					<tr>
						<td> <?php echo($lang == 1 ? "ডেলিভারীর ঠিকানা " : "Delivery Address");?> :    <?php echo substr($det[0][7] , 0 , 256); ?></td>      
					  </tr>

					  <tr>
						<td> <?php echo($lang == 1 ?  "যোগাযোগের নম্বর" : "Contact No");?> :   <?php echo $det[0][15];?></td>
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
				<td><?php echo ($lang == 1 ? "পন্যের কোড " : "Item Code");?></td>
				<td><?php echo ($lang == 1 ? "পন্য" : "Product");?></td>
				<td class='ral'><?php echo ($lang == 1 ? "ইউনিট" : "Unite");?></td>
				<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
				
			</tr>

</thead>
<tbody>

<?php 
for($i=0 , $tot = 0;  $i< $l && count($arr) ; $i++){
?>
		<tr>
			<td><?php echo $inp->cb($i+1);?></td>
			<td><?php echo $arr[$i][0];?></td>
			<td><?php echo $arr[$i][1];?></td>
			<td><?php echo $arr[$i][2]; ?> </td>
			<td class='ral'><?php echo $inp->cb($arr[$i][3]);?></td>
			</tr>
<?  }
 ?>

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
							  <td><br/><br/>___________________</td><td><br/><br/>___________________</td><td><br/><br/>___________________</td><td><br/><br/>___________________</td>
					  </tr>
					  <tr>
							  <td><?php echo ($lang == 1 ? "গ্রহীতার স্বাক্ষর" : "Receiver's Signature");?></td><td><?php echo ($lang == 1 ? "নিরাপত্তা কর্মীর স্বাক্ষর" : "Security Check");?></td><td> <?php echo ($lang == 1 ? "গুদাম কর্মীর স্বাক্ষর" : "Store Officer");?></td><td><?php echo ($lang == 1 ? "কর্তৃপক্ষের স্বাক্ষর" : "Authorized Signature");?>  </td>
					  </tr>
				</table>
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
					<td><?php echo ($lang == 1 ? "পন্যের কোড " : "Item Code");?></td>
					<td><?php echo ($lang == 1 ? "পন্য" : "Product");?></td>
					<td class='ral'><?php echo ($lang == 1 ? "ইউনিট" : "Unite");?></td>
				    	<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
				   </tr>


			<? for($i=$l, $tot = 0; $i< count($arr); $i++){ ?>
				    <tr>
						<td><?php echo $inp->cb($i);?></td>
						<td><?php echo $arr[$i][0];?></td>
						<td><?php echo $arr[$i][1];?></td>
						<td><?php echo $arr[$i][2];?> </td>
						<td class='ral'> <?php echo $inp->cb($arr[$i][3]);?> </td>
				    </tr>
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
							  <td><br/><br/>___________________</td><td><br/><br/>___________________</td><td><br/><br/>___________________</td><td><br/><br/>___________________</td>
					  </tr>
					  <tr>
							  <td><?php echo ($lang == 1 ? "গ্রহীতার স্বাক্ষর" : "Receiver's Signature");?></td><td><?php echo ($lang == 1 ? "নিরাপত্তা কর্মীর স্বাক্ষর" : "Security Check");?></td><td><?php echo ($lang == 1 ? "গুদাম কর্মীর স্বাক্ষর" : "Store Officer");?></td><td><?php echo ($lang == 1 ? "কর্তৃপক্ষের স্বাক্ষর" : "Authorized Signature");?>   </td>
					  </tr>
				</table>
			</td>
		   </tr>						  
		<? } ?>

</table>

			  
 

</div>
<? } ?>

</div>
</div>

