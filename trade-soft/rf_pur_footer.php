
	

			<div class = 'cl-lg-12' class='report-ender' >
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
			 </div>

