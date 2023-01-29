<div class = 'cl-lg-12' class='report-head'>
		   <table align='center' width = '100%' class = 'report-head'>
			<tr>
				<td colspan = '2' width = '100%' ><h2 style = 'text-align:center'>Purchase ID : <?php echo $id;?></h2></td>
			</tr>
		
			<tr>
				<td width = '35%'>
					<table height="180px" width = '100%' border = '1px'>
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
			<td width = '65%' >
				<table height="180px" width = '100%' border = '1px'>
					<tr>
						<td width="354px" valign="top"> <?php echo($lang == 1 ? "ক্রয়কারী ও ঠিকানা   " : "Supplier & Address  ");?> :   <?php echo $det[0][13]."<br/>".$det[0][14];?></td>
					</tr>

					<tr>
						<td> <?php echo($lang == 1 ?  "ক্রেতা " : "Receiver Officer");?> :    <?php echo $det[0][11];?>, <?php echo($lang == 1 ? "মোবাইল" : "Mobile");?>  :  <?php  echo $det[0][12]; ?> </td>
					</tr>

				</table>

			</td>
		
					
			</tr>
			
			</table>

</div>
