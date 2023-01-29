<div class="embossed">
<?php
	if($data_id||($order=='Order'))
	{
		if($_POST['order'])
		{
			if($_POST['name2']&&$_POST['phone']&&$_POST['country']&&$_POST['pieces'])
			{
				$subject="PRODUCT ORDER FROM SITE";
				$message="\n Name : ".htmlentities(stripslashes($_POST['name2']))."\n Address : ".htmlentities(stripslashes($_POST['address']))."\n E-mail : ".htmlentities(stripslashes($_POST['email2']))."\n Country : ".htmlentities(stripslashes($_POST['country']))."\n Phone : ".htmlentities(stripslashes($_POST['phone']))."\n\nBooking Description : ".htmlentities(stripslashes($_POST['description']))."\n\nOrdered : ".htmlentities(stripslashes($_POST['product']));
				$date=date('Y-m-d');
					mysql_query("INSERT INTO mail VALUES('','$date','$subject','$message')");
					/*-----------SOFT-------------*/
					$customer="".htmlentities(stripslashes($_POST['name2']))."\n".htmlentities(stripslashes($_POST['address']))."\nE-mail : ".htmlentities(stripslashes($_POST['email2']))."\nCountry : ".htmlentities(stripslashes($_POST['country']))."\nPhone : ".htmlentities(stripslashes($_POST['phone']))."\n".htmlentities(stripslashes($_POST['description']));
				
					$paying=0;
					$discount=0;
					$product_id=$data_id;
					$quantity=$_POST['pieces'];
					$rate=get_only_price($data_id);
					mysql_query("START TRANSACTION");
					$q=mysql_query("INSERT INTO sells VALUES('','".$date."','".$customer."','".$discount."','0')");
					if($q)
					{
						$sells_id=mysql_insert_id();
						$q=mysql_query("INSERT INTO sells_details VALUES('','".$sells_id."','".$product_id."','".$quantity."','".$rate."')");
					}
					if($q)
					{
						mysql_query("COMMIT");
					}
					else
					{
						mysql_query("ROLLBACK");
					}
					/*-----------SOFT-------------*/
					$to=$admin_email;
					if($to)
					{
						echo "<h2>";
						ini_set("SMTP", "localhost");
						$headers="From: visitor@".$domain;
						$mail=mail($to, $subject, $message, $headers);
						if($mail)
						{
							echo "<b class='green'>Order Message Sent. Thanks for Choosing ".$companyname."</b><br/><b class='red'>Invoice Number : ".$sells_id."</b>";
						}
						else
						{
							echo "<b class='red'>Could not send Booking.</b><b class='blue'>Sorry for the Error.</b>";
						}
						
						$to2=$_POST['email2']; 
						$subject2=$companyname." Invoice";
						$headers2="MIME-Version: 1.0" . "\r\n";
						$headers2=$headers2."Content-type:text/html;charset=UTF-8" . "\r\n";
						$headers2=$headers2."From: visitor@".$domain;
						$contact="";
						$q=get_page_text_data(4);
						while($data=mysql_fetch_assoc($q))
						{
								$contact=$contact."<b>".$data['heading']."</b> : ";
								$contact=$contact.nl2br($data['content'])."<br/>";
						}
						$contact=$contact."<b>Website</b> : <a href='http://".$domain."'>www.".$domain."</a>";
						$message2="
							<html>
								<head>
									<title>
										".$companyname." Invoice
									</title>
								</head>
								<body>
									<center>
										<table border='1px' style='border-collapse:collapse;'>
											<tr>
												<td colspan='4' align='right'>
													<img src='http://".$domain."/images/logo.jpg' width='200px' style='float:left;'>
													<small>".$contact."</small>
												</td>
											</tr>
											<tr>
												<th colspan='4'>
													Invoice Number : ".$sells_id."
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													Date : ".date('Y-m-d')."
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													Status :  Ordered 
												</th>
											</tr>
											<tr>
												<th align='left'>
													Product 
												</th>
												<th>
													Quantity 
												</th>
												<th>
													Rate 
												</th>
												<th align='right'>
													Total 
												</th>
											</tr>
											<tr>
												<th align='left'>
													".$_POST['product']."
												</th>
												<td>
													".$_POST['pieces']."
												</td>
												<td>
													".get_only_price($_POST['text_data_id'])." Taka
												</td>
												<th align='right'>
													".($_POST['pieces']*get_only_price($_POST['text_data_id']))." Taka
												</th>
											</tr>
										</table>
									</center>
								</body>
							</html>
						";
						$mail2=mail($to2, $subject2, $message2, $headers2);
						if($mail2)
						{
							echo "<br/><b class='green'>Invoice is sent to ".$to2." please check.</b>";
						}
						else
						{
							echo "<br/><b class='red'>Could not send Invoice.</b>";
						}
						echo "</h2>";
					}
					else
					{
						echo "<h2><b class='red'>Please fill all * marked fields to Book</b></h2>";
					}
			}
		}
	}
	else{
		echo "<h1>Order Now</h1>";
	}
?>
		<form method='POST' action="index.php?page=<?php echo $page;?>&&data_id=<?php echo $data_id;?>&&order=1">
			<?php echo "<h2 class='green'>".$heading."</h2>"; ?>
			<input type="hidden" name="text_data_id" value="<?php echo $data_id; ?>">
			<input type="hidden" name="product" value="<?php echo $heading; ?>">
			<table class="formalign" align="center" width="700px">
			<tr><td>Name  :</td><td><input type="text" name="name2"/><big class='red'>*</big></td></tr>
			<tr><td>Address :</td><td><input type="text" name="address"/></td></tr>
			<tr><td>E-mail :</td><td><input type="text" name="email2"/></td></tr>
			<tr>
				<td>Country :</td>
				<td>
					<?php include("_private/country_dd.php");?>
				</td>
			</tr>
			<tr><td>Phone :</td><td><input type="text" name="phone"/><big class='red'>*</big></td></tr>
			<tr>
				<td>Pieces :</td>
				<td>
					<select name="pieces">
						<?
							for($i=1;$i<500;$i++)
							{
								echo "<option value='".$i."'>".$i."</option>";
							}
						?>
					</select><big class='red'>*</big></td>
			</tr>
			<tr><td>Order Description :</td><td><textarea name="description" rows="5" cols="50"></textarea></td></tr>
			<tr><td colspan="2"><center><input type="submit" name="order" value="Order"></center></td></tr>
			</table>
		</form>
</div>