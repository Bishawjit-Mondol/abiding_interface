<h1>New Purchase</h1>
<?php
    if($_POST[$sc.'submit']){
		$paying=$_POST['paying'];
		$due=$_POST['due'];
		if($due>=$paying)
		{
			$customer=$_POST['customer'];
			$discount=$_POST['discount'];
			$gt=0;
			for($i=0;$i<11;$i++)
			{	
				if(($_POST['product'.$i]!=NULL)&&($_POST['quantity'.$i]!=NULL)&&($_POST['rate'.$i]!=NULL))
				{
				$product[$i]=$_POST['product'.$i];
				$quantity[$i]=$_POST['quantity'.$i];
				$rate[$i]=$_POST['rate'.$i];
				$gt=$gt+($quantity[$i]*$rate[$i]);
				}
			}
			$nt=$gt-$discount;
			$due=$nt-$paying;
			$status=4;
			$date=date("Y-m-d");
			mysql_query("START TRANSACTION");
			$q=mysql_query("INSERT INTO sells VALUES('','".$date."','".$customer."','".$discount."','".$status."')");
			$sells_id=mysql_insert_id();
			for($i=0;($i<11&&$q&&$product[$i]);$i++)
			{
				$q=mysql_query("INSERT INTO sells_details VALUES('','".$sells_id."','".$product[$i]."','".$quantity[$i]."','".$rate[$i]."')");
				$stock=product_stock($product[$i])+$quantity[$i];
				if($q)
				{
					$q=mysql_query("UPDATE stock SET stock='".$stock."' WHERE text_data_id='".$product[$i]."'");
					if($q)
					{
						$q=mysql_query("INSERT INTO stock_update VALUES('', '".$product[$i]."', '".$date."', '".$quantity[$i]."','2')");
					}
				}
			}
			if($q&&$paying)
			{
				$q=mysql_query("INSERT INTO payments VALUES('".$sells_id."','".$date."', '".(-$paying)."')");
			}
			if($q)
			{
				mysql_query("COMMIT");
			}
			else
			{
				mysql_query("ROLLBACK");
			}
			include("inc/q_check.php");
		}
		else
		{
			$say=7;	
		}
	}
	else{
       $say=null;	
	}
	include("inc/message.php");
	if($_POST['calculate']||$_POST[($sc-1).'submit']||$_POST[$sc.'submit'])
	{
?>
				<table class="structured">
					<tr>
						<td colspan="2">
								<form method="POST">
								<table class="formaligner" align="center">
									<tr>
										<td colspan='4'>
											<b>Supplier Details :</b>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<?="<b>Date : </b>".date('d M Y');?>
											<br/>
											<?php echo stripslashes($_POST['customer']);?>
											<input type="hidden" name="customer" value='<?=$_POST['customer']?>'/>
										</td>
									</tr>
						<?php
								echo "
									<tr>
										<th class='l'>
											Product
										</th>
										<th>
											Quantity
										</th>
										<th>
											Rate
										</th>
										<th class='r'>
											Total
										</th>
									</tr>
								";
							$gt=0;
							for($i=0;$i<11;$i++)
							{
								if(($_POST['product'.$i]!=NULL)&&($_POST['quantity'.$i]!=NULL)&&($_POST['rate'.$i]!=NULL))
								{
									$product_id=$_POST['product'.$i];
									$quantity=$_POST['quantity'.$i];
									$rate=$_POST['rate'.$i];
									echo "
										<tr>
											<td class='l'>"
												.product_heading($product_id).
												"<input type='hidden' name='product".$i."' value='".$product_id."'/>
											</td>
											<td class='l'>
												".$quantity." &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X
												<input type='hidden' name='quantity".$i."' value='".$quantity."'/>
											</td>
											<td class='r'>
												".$rate."
												<input type='hidden' name='rate".$i."' value='".$rate."'/>
											</td>
											<td class='r'>
												".sprintf("%.2f",$quantity*$rate)."
											</td>
										</tr>
									";
									$gt=$gt+($quantity*$rate);
								}
							}
						?>
									<tr>
										<th colspan='3' class='l'>
											Total Charges
										</th>
										<td class='r'>
											<?php if($gt) echo sprintf("%.2f",$gt); else echo "0";?>	
										</td>
									</tr>
									<tr>
										<th colspan='3' class='l'>
											Discount
										</th>
										<td class='r'>
											<?php if($_POST['discount']) echo sprintf("%.2f",$_POST['discount']); else echo "0";?>	
											<input type="hidden" name="discount" value='<?=$_POST['discount']?>'/>
										</td>
									</tr>
									<tr>
										<th colspan='3' class='l'>
											Grand Total after Discount: 
										</th>
										<td class='r'>
											<?php if($gt) echo sprintf("%.2f",($gt-$_POST['discount'])); else echo "0";  $due=$gt-$_POST['discount'];  ?>	
											<input type="hidden" name="due" value='<?=$due?>'/>
										</td>
									</tr>
									<tr>
										<th colspan='3' class='l'>
											Paying
										</th>
										<td class='r'>
											<?php if($_POST['paying']) echo sprintf("%.2f",$_POST['paying']); else echo "0";?>	
											<input type="hidden" name="paying" value='<?=$_POST['paying']?>'/>
										</td>
									</tr>
									<tr>
										<th colspan='3' class='l'>
											Remaining Due
										</th>
										<td class='r'>
											<?php if($_POST['paying']&&$gt) echo sprintf("%.2f",($gt-$_POST['discount']-$_POST['paying'])); else echo "0";?>	
											<input type="hidden" name="paying" value='<?=$_POST['paying']?>'/>
										</td>
									</tr>
									<tr class='notforprint'>
									  <th colspan="4">
										<input type="submit" name="new" value="New" onClick="showloading();"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="submit" name="<?php echo $sc;?>submit" value="Record Purchase" onClick="showloading();"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="submit" name="Edit" value="Edit" onClick="showloading();"/>
									  </th>
									</tr>
								</table>
								</form>  
						</td>
					</tr>
				</table>
<?
	}
	else{
?>
				<table class="structured">
					<tr>
						<td colspan="2">
								<form method="POST" enctype="multipart/form-data">
								<table class="formaligner" align="center">
									<tr>
										<td colspan='3' style=''vertical-align:top;">
											Supplier  Details
											<br/>
											<textarea name="customer" rows="2" cols="70"><?php echo stripslashes($_REQUEST['customer']);?></textarea>
										</td>
									</tr>
						<?php
								echo "
									<tr>
										<th>
											Product
										</th>
										<th>
											Quantity
										</th>
										<th>
											Rate
										</th>
									</tr>
								";
							$product_options=product_options();
							for($i=0;$i<11;$i++)
							{
								echo "
									<tr>
										<th>
											<select name='product".$i."'>";
											if($_POST[product.$i])
											{
												$product_id=$_POST[product.$i];
												echo "<option value='".$product_id."' selected>".product_heading($product_id)."</option>";
											}
											echo $product_options;
											echo "
											</select>
										</th>
										<th>
											<input type='text'  name='quantity".$i."' value='".$_POST['quantity'.$i]."'>
										</th>
										<th>
											<input type='text'  name='rate".$i."' value='".$_POST['rate'.$i]."'>
										</th>
									</tr>
								";
							}
						?>
									<tr>
										<th colspan='3'>
											<br/>Discount
											&nbsp;&nbsp;&nbsp;&nbsp;
											:
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="text" name="discount" value='<?=$_POST['discount']?>'/>
										</th>
									</tr>
									<tr>
										<th colspan='3'>
											Paying : 
											&nbsp;&nbsp;&nbsp;&nbsp;
											:
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="text" name="paying" value='<?=$_POST['paying']?>'/>
										</th>
									</tr>
									<tr class='notforprint'>
									  <th colspan="3">
										<input type="submit" name="calculate" value="Calculate" onClick="showloading();"/>
									  </th>
									</tr>
								</table>
								</form>  
						</td>
					</tr>
				</table>
<?
	}
?>