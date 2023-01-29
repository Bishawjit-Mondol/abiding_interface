<div class = 'cl-lg-12' class='report-head'>
		   <table align='center' width = '100%' class = 'report-head'>
			<tr>
				<td colspan = '2' width = '100%' ><h2 style = 'text-align:center'>Delivery Challan : <?php echo $id;?></h2></td>
			</tr>
		
			<tr>
				<td width = '35%'>
					<table height="180px" width = '100%' border = '1px'>
						<tr>
							<td width="100%" > <?php echo($lang == 1 ? "অর্ডারের তারিখ" : " Order Date");?> :  <?php echo dateconvert($det[0][1]);?></td>
						</tr>					
						
						<tr>
							<td width="100%"> <?php echo($lang == 1 ? "ডি.ও আইডি" : "D.O.ID");?> :    <?php echo $id;?></td>
						</tr>
						
						<tr>
							<td width="100%"> <?php echo($lang == 1 ? "ভ্যাট রেজ. নম্বর" : "Vat Reg. No");?> :    <?php echo '19051018738'; ?></td>
						</tr>
						<tr>
							<td> <?php echo($lang == 1 ? "বিক্রয় কর্মী" : "Sales Officer");?> :    <?php echo $det[0][11];?></td>
						</tr>
						
						<tr>
							<td> <?php echo($lang == 1 ? "যোগাযোগের নম্বর" : "Contact no");?> :    <?php echo $det[0][12];?></td>
						</tr>
					</table>
				</td>
			<td width = '65%' >
				<table height="180px" width = '100%' border = '1px'>
					<tr>
						<td width="100%" valign="top"> <?php echo($lang == 1 ? "ক্রয়কারী ও ঠিকানা   " : "Customer & Address  ");?> :   <?php echo $det[0][13]."<br/>".$det[0][14];?></td>
					</tr>
					<tr>
						<td> <?php echo($lang == 1 ? "ডেলিভারীর জায়গা" : "Delivery Address");?> :    <?php echo $det[0][7];?></td>
					</tr>
					<tr>
						<td> <?php echo($lang == 1 ?  "যোগাযোগের নম্বর" : "Contact No");?> :   <?php echo $det[0][15];?></td>
					</tr>

				</table>

			</td>
		
					
			</tr>
			
			</table>

</div>
