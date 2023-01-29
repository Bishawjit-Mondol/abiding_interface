</br></br>

<div class = 'cl-lg-12' class='report-ender'>
	<table class='report-ender' border="2" >
		<tr>
           <td width="450px">
		<table>
		<tr>
			<td><?php echo ($lang == 1 ? " পূর্বের পাওনা " : "Previous Due");?></td> <td></td><td class = 'sales-f-subt set-html-zero'><?php echo $inp->cb(two_dec(-$previous_due));?></td>
		</tr>
		<tr>
			<td><?php echo ($lang == 1 ? " বর্তমান বিল " : "Current bill");?></td> <td></td><td class = 'sales-f-dis set-html-zero'><?php echo $inp->cb($tot+$det[0][21]); ?></td>
		</tr>
		
		<tr>
			<td><?php echo ($lang == 1 ? " নগদ প্রদান " : "Cash Paid");?></td><td>-</td><td class = 'sales-f-trp set-html-zero'><?php   echo $inp->cb($cash_paid); $t=($previous_due-($tot+$det[0][21]));   ?></td>
		</tr>
		
		<tr>
			<td><?php echo ($lang == 1 ? "মোট পাওনা" : "Amount Receivable");?></td><td>:</td><td class = 'sales-f-dis set-html-zero'><?php echo $inp->cb(-($t+$cash_paid)); ?></td>
		</tr>
		</table>
		  </td>
		
		  <td width="400px"> 
		    <table>
			<tr>
				<td><?php echo ($lang == 1 ? "মোট " : "SubTotal");?></td><td></td><td class = 'sales-f-subt set-html-zero'><?php echo $inp->cb(two_dec($subtotal));?></td>
			</tr>
			<tr>
				<td><?php echo ($lang == 1 ? "মূল্য হ্রাস" : "Discount");?></td><td>-</td><td class = 'sales-f-dis set-html-zero'><?php echo $inp->cb($subtotal-$tot);?></td>
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
  	<table align='center' width = '100%' border = '0' class='report-ender'>
		      <tr>
			  <td align='center'>________________________  </td> 
			  <td align='center'>________________________  </td>
			  <td align='center'>________________________  </td>
			  <td align='center'>________________________  </td>
		      </tr>
		      <tr>
			  <td align='center'><?php echo ($lang == 1 ? " গ্রহ্নকারীর সাক্ষর " : "Receiver Signature");?></td>
			  <td align='center'><?php echo ($lang == 1 ? " নিরাপত্তা কর্মীর সাক্ষর  " : "Security Check");?></td>
			  <td align='center'><?php echo ($lang == 1 ? " গুদামের কর্মীর সাক্ষর " : "Store Check");?></td>
			  <td align='center'><?php echo ($lang == 1 ? " কর্তৃপক্ষের সাক্ষর " : "Authorized Signature");?></td>
		      </tr>
	 </table>
 </div>

