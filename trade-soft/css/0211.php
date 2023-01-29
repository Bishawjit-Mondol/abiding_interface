<?php 
 
	$flag = false;
	
	$id =req('id'); 


	if(true){

		$query = "SELECT idsales, sales_date,  sales_status,  sales_comments, sales_ispurchase_return, iduser, sales_entrytime, sales_delivery_address, idproduct_catagory,sales_details_billing_date, sales_details_chalan_date, staff_name, staff_mobile, company_name,  company_address, company_contactperson_phone FROM (
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

		$det2 = $qur->custom_select_query("SELECT idproduct, ___find_product_name_except_last(idproduct) , ___find_product_unit(idproduct), stock_product_output_qunatity  FROM
(SELECT idstock_product_output FROM sales_stock_product_output s WHERE idsales = $id)
as a LEFT JOIN stock_product_output USING(idstock_product_output);");

		$cid__ = $det[0][1];

		$det3 = $qur->custom_select_query("SELECT 3");
		

?>

<?php include('rh_bill.php'); ?>
<div class="bs-example table-responsive ">
 
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


<table class="table table-striped table-hover report-table" border = '1' width = '100%'>
	<thead>
		<tr>
			<td><?php echo ($lang == 1 ? "ক্রম " : "Sl");?></td>
			<td><?php echo ($lang == 1 ? "পন্যের কোড " : "Item Code");?></td>
			<td><?php echo ($lang == 1 ? "পন্য" : "Product");?></td>
			<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
			<td><?php echo ($lang == 1 ? "ইউনিট" : "Unite");?></td>
		
		</tr>

	</thead>
	<tbody>


<?php  $i = 0; $tot = 0; foreach($det2 as $d){ ?>
		<tr>
			<td><?php echo $inp->cb(++$i);?></td>
			<td><?php echo $d[0];?></td>
			<td><?php echo $d[1];?></td>
			<td><?php echo $inp->cb($d[2])?> </td>
			<td><?php echo $d[3];?></td>
			
		</tr>

<?php  }  ?>

	</tbody>

</table>
</br>

							
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



<?php
 	} else 
		{ $error = $qur->custom_select_query("SELECT @software_error"); 
     			echo ($lang ?   " ব্যর্থ হয়েছে " : "Failed To Do :  ").$error[0][0];
		}
      	

?>


<!--  ----------------------------------------------- -->


<?
 /*
  $query_1 = "SELECT idparty, idstaff, iddelivery, date, a.comments, transport, iduser, sell_type, discount_1, discount_2, total_price, discount_amm_1, discount_amm_2, idsell, status, dd.address, percent, party.name, idparty_type, mobile, party.address, party.comments, staff.name, company,idparty,a.contact, sb.contact FROM (SELECT * FROM delivery WHERE iddelivery = $id) as a LEFT JOIN delivery_details dd USING(iddelivery) LEFT JOIN party USING(idparty) LEFT JOIN staff USING(idstaff) LEFT JOIN client_det USING(idparty) LEFT JOIN staff_bio sb USING(idstaff)";


 $query_2 = "SELECT code, CONCAT(st.sub,' ',pr.product_name), pu.product_unite_name,ammount,price,st.type,status FROM (SELECT * FROM delivery_stock WHERE iddelivery = $id ) as a LEFT JOIN product as pr USING(idproduct) LEFT JOIN stage as st USING(stage) LEFT JOIN product_code as pc USING(idproduct) LEFT JOIN product_unite as pu USING(idproduct_unite);";
*/

  $det_1 = $this->custom_select_query($query_1);
 // $det_2 = $this->custom_select_query($query_2);
  $det_k = $this->custom_select_query("SELECT idsell FROM delivery WHERE iddelivery = $id ");

	//$arr = $det_2;
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
<div>
<div class = 'chalan_print_try <? if(!$fpp){ echo 'pagebreak'; } ?>' >
	<table class='roundangled20'>
		<tr class='onlyprint'><td colspan='2' class='pspace'></td></tr>
		<tr><td align = 'center' colspan = '2' class='banner'>Delivery Challan : <?=$det_k[0][0];?></td></tr>
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
					<td width="354px" valign="top"> <?php echo($lang == 1 ? "ক্রয়কারী ও ঠিকানা   " : "Customer & Address  ");?> :   <?php echo $det[0][13]."<br/>".$det[0][14];?></td>
					</tr>
					<tr>
						<td> <?php echo($lang == 1 ? "ডেলিভারীর  ঠিকানা " : "Delivery Address");?> :    <?php echo $det[0][7];?></td>
					</tr>
					<tr>
						<td> <?php echo($lang == 1 ?  "যোগাযোগের নম্বর" : "Contact No");?> :   <?php echo $det[0][15];?></td>
					</tr>


					  <tr>
						<td><?php echo($lang == 1 ? "ক্রয়কারী ও ঠিকানা   " : "Customer & Address  ");?> :   <?php echo $det[0][13]."<br/>".$det[0][14];?></td>
					  </tr>

					  <tr>
						<td> <?php echo($lang == 1 ? "ডেলিভারীর  ঠিকানা " : "Delivery Address");?> :    <?php echo substr($det[0][7] , 0 , 256); ?></td>      
					  </tr>

					  <tr>
   					  <td> <?php echo($lang == 1 ? "যোগাযোগের নম্বর" : "Contact no");?> :    <?php echo $det[0][12];?></td>
			  		</tr>
	
				  </table>
		      </td>

		</tr>

		<tr><td colspan='2' class='onlyprint'><br/></td></tr>

		<tr><td colspan = '2'>
			  <table class='data'>
				<tr>
				<td><?php echo ($lang == 1 ? "ক্রম " : "Sl");?></td>
				<td><?php echo ($lang == 1 ? "পন্যের কোড " : "Item Code");?></td>
				<td><?php echo ($lang == 1 ? "পন্য" : "Product");?></td>
				<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
				<td class='ral'><?php echo ($lang == 1 ? "ইউনিট" : "Unite");?></td>
		
		</tr>

<? for($i=0; $i< $l && count($arr); $i++){ ?>
<?php //  $i = 0; $tot = 0; foreach($det2 as $d){ ?>
		<tr>
			<td><?php echo $inp->cb(++$i);?></td>
			<td><?php echo $d[0];?></td>
			<td><?php echo $d[1];?></td>
			<td><?php echo $inp->cb($d[2])?> </td>
			<td class='ral'><?php echo $d[3];?></td>
			
		</tr>
<? } ?>

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
						<td>Receiver's Signature</td><td>Security Check</td><td> Store Officer</td><td>Authorized Signature   </td>
					  </tr>
				</table>
			</td>
		</tr>
<? } ?>
	</table>
  </div>
  <? if(count($arr)>$l){  ?>
<div class = 'chalan_print_try'>
<table class='roundangled20'>
<tr class='onlyprint'><td class='pspace'> </td></tr>

		<tr>
			<td>

			  <table class='data'>
				    <tr>
					      <td>Sl</td>
					      <td>Item Code</td>
					      <td>Product Description</td>
					      <td>Unite</td>
					      <td class='ral'>Qty</td>
				    </tr>
<? for($i=$l; $i< count($arr); $i++){ ?>
				    <tr>
					      <td><?=($i+1)?></td>
					      <td><?=$arr[$i][0];?></td>
					      <td><?=($arr[$i][5]==2?"PVC ":"PPR ").$arr[$i][1];?></td>
					      <td><?=$arr[$i][2];?></td>
					      <td class='ral'><?=$arr[$i][3];?></td>
				    </tr>

<? }
?>
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
							  <td>Receiver's Signature</td><td>Security Check</td><td> Store Officer</td><td>Authorized Signature   </td>
					  </tr>
				</table>
			</td>
		</tr>						  
<? } ?>

</table>

			  

</div>
<? } ?>





