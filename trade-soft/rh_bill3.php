<div class = 'cl-lg-12' class='report-head'>
		   <table align='center' width = '100%' border = '0' class='report-head'>
		      <tr>
			  <td align='center' colspan='3'><h3>AME FASHION</h3></td>
		      </tr>
		      <tr>
			  <td align='center' colspan='3'><span class = 'print-adress'>Eastern Mollika (5th Floor), Shop No 32-33, Elephant Road, Dhaka. Mobile : +880119050027, +8801683186279, E-Mail : amefashion@live.com</span></td>
		     
			  </tr>

		   <tr>
			<td>
				<table height="150px">
					<!--<tr style="border-bottom:solid 1px #000">
						<td width="352px" v-align="top"><b>Bill Date : </b><?php echo $det[0][22];?> </td>
					</tr>-->	
					<tr style="border-bottom:solid 1px #000">
						<td width="352px"><b><?php echo ($lang == 1 ? " ক্রয় তারিখ " : "Purchase Date ");?> </b> <?php echo dateconvert($det[0][10]);?></td>
					</tr>
					<tr style="border-bottom:solid 1px #000">
						<td><b><?php echo ($lang == 1 ? " তারিখ " : " D.O.Date");?></b> <?php echo dateconvert($det[0][1]);?></td>
					</tr>
					<tr>
						<td><b><?php echo ($lang == 1 ? " ডি . ও . আইডি " : "D.O.ID");?></b> <?php echo $id;?></td>
					</tr>
					
				</table>
			</td>
			<td>
				<table height="150px">
					<tr style="border-bottom:solid 1px #000">
						<td width="354px" v-align="top"><b><?php echo ($lang == 1 ? " ক্রেতা ও ঠিকানা " : "Customer & Address");?></b><?php echo $det2[0][0].'  '.$det2[0][1];?></td>
					</tr>
					<tr>
						<td><b><?php echo ($lang == 1 ? " বিক্রয় কর্মী " : "Sales Officer");?></b> <?php echo $det3[0][3];?></td>
					</tr>
					
				</table>

			</td>
		</tr>
						      

	  </table>

</div>
