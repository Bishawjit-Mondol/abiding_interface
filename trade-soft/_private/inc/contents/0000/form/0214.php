<?php 

	date_default_timezone_set("Asia/Dhaka");
	$label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	$label_2 =  ($lang == 1 ? "ক্রেতা " : "Client"); 
	$label_3 =  ($lang == 1 ? "গুদাম " : "Godown");   

	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_5 =  ($lang == 1 ? "মূল্যছাড় " : "Discount");   
	$label_6 =  ($lang == 1 ? "মোট" : "Total");   
	$label_s = ($lang?"যোগ করুন":"Add");
	
	$id = req('id'); //2 ;//
	
	if($id){

		
		$det1 = $qur->custom_select_query("SELECT idpestablishment,stock_transfer_date ,stock_transfer_comments ,
						   stock_transfer_entrytime,pestablishment_name,stock_product_input_qunatity,
						   stock_product_input_type, name , unite_name,idunite,product_name ,idproduct
						   FROM stock_transfer
						   Left join stock_transfer_stock_product_input_stock_product_output s using (idstock_transfer)
						   LEFT join stock_product_input using(idstock_product_input)
						   LEFT JOIN product USING(idproduct)
						   Left join pestablishment using(idpestablishment)
            					   LEFT JOIN unite as u using(idunite)
						   LEFT JOIN ___users using(iduser)
						   where idstock_transfer=$id;");

		
		$det2 = $qur->custom_select_query("SELECT idpestablishment,stock_transfer_date , stock_transfer_comments ,
						   stock_transfer_entrytime,pestablishment_name , stock_product_output_qunatity,
						   stock_product_output_type ,name , unite_name , idunite,product_name ,idproduct
						   FROM stock_transfer
						   left join stock_transfer_stock_product_input_stock_product_output s using (idstock_transfer)
						   LEFT JOIN stock_product_output USING(idstock_product_output)
            					   LEFT JOIN product USING(idproduct)
						   Left join pestablishment using(idpestablishment)
            					   LEFT JOIN unite as u using(idunite)
						LEFT JOIN ___users using(iduser)
						where idstock_transfer=$id;");
		
	}
	
?>


<?php  include('rh_bill3.php'); ?>
<div class="bs-example table-responsive ">
 
    <table class="table" border = '2' width = '750px'>
	<tbody>
		<tr>
			<td>
				<table height="180px" width="100%";>
					<tr style="border-bottom:solid 1px #000">
						<td width="352px"><b><?php echo($lang == 1 ? "স্থানান্তর আইডি":"Transfer ID ");?></b><?php echo $id;?></td>
					</tr>
					<tr style="border-bottom:solid 1px #000">
						<td><b><?php echo($lang == 1 ? "থেকে":"From ");?></b> <?php echo $det2[0][4];?></td>
					</tr>
					<tr>
						<td><b><?php echo($lang == 1 ? "এই জায়গায়":"To ");?> </b> <?php echo $det1[0][4];?></td>
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
								<table>
								<tr>
									<td><b><?php echo($lang == 1 ? "তারিখ" : " Date ");?> </b> <?php echo dateconvert($det1[0][1]);?></td>
								</tr>
								<tr>
									<td><b><?php echo($lang == 1 ? "প্রিন্টের সময়" : "Print Time ");?> </b> <?php echo date("g:i A", time()); ?></td>
								</tr>
								<tr>
									<td><b><?php echo($lang == 1 ? "প্রুস্তুতকারক" : "Prepared By ");?> </b> <?php echo $det2[0][7];?></td>
								</tr>
								</table>
							  </td>
							  
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
			<td><?php echo ($lang == 1 ? "পন্য " : "Product");?></td>
			<td><?php echo ($lang == 1 ? "পরিমান " : "Qty.");?></td>
		</tr>

<?php  $i = 0; $subtotal = 0 ; $tot = 0; foreach($det1 as $d){ ?>
		<tr>
			<td><?php echo ++$i;?></td>
			<td><?php echo $d[10];?></td>
			<td><?php echo cb($inp,$d[5]).' '.$d[8];?> </td>
		</tr>

<?php  }  ?>

	</tbody>

</table>


<table>
	<tr>
		<td><?php echo($lang?'মন্তব্য ':'Comments ');?> :  <?php  echo $det1[0][2];?></td>
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
 
                                       	
			
			<?php  include('rf_bill3.php'); ?>
