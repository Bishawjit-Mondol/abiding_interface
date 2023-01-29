<?php
	if($data_id||($order=='Order'))
	{
		if($_POST['order'])
		{
			if($_POST['name2']&&$_POST['phone']&&$_POST['country'])
			{
				$subject="PRODUCT ORDER FROM SITE";
				$message="\n Name : ".htmlentities(stripslashes($_POST['name2']))."\n Address : ".htmlentities(stripslashes($_POST['address']))."\n E-mail : ".htmlentities(stripslashes($_POST['email2']))."\n Country : ".htmlentities(stripslashes($_POST['country']))."\n Phone : ".htmlentities(stripslashes($_POST['phone']))."\n\nBooking Description : ".htmlentities(stripslashes($_POST['description']))."\n\nOrdered : ".htmlentities(stripslashes($_POST['product']));
				$date=date('Y-m-d');
					mysql_query("INSERT INTO mail VALUES('','$date','$subject','$message')");
					$to=$admin_email;
					if($to)
					{
						$headers="MIME-Version: 1.0" . "\r\n";
						$headers=$headers."Content-type:text/html;charset=UTF-8" . "\r\n";
						$headers=$headers."From: visitor@".$domain;
						ini_set("SMTP", "localhost");
						$mail=mail($to, $subject, $message, $headers);
						if($mail)
						{
							echo "<h2><b class='green'>Booking Message Sent to ".$to."</b><br/><b class='blue'>Thanks for choosing ".$companyname."</b></h2>";
						}
						else
						{
							echo "<h2><b class='red'>Could not send Booking to ".$to."</b></h2>";
						}
					}
			}
			else
			{
				echo "<h2><b class='red'>Please fill all * marked fields to Book</b></h2>";
			}
		}
	}
?>
		<form method='POST' class="embossed" action="index.php?page=<?php echo $page;?>&&data_id=<?php echo $data_id;?>&&order=1">
			<h1>Order Now</h1>
			<?php echo "<h2 class='green'>".$heading."</h2>"; ?>
			<input type="hidden" name="product" value="<?php echo $heading; ?>">
			<table class="formalign" align="center" width="700px">
			<tr><td>Name  :</td><td><input type="text" name="name2"  value="<?php echo htmlentities(stripslashes($_POST['name2']));?>"/><big class='red'>*</big></td></tr>
			<tr><td>Address :</td><td><input type="text" name="address" value="<?php echo htmlentities(stripslashes($_POST['company2']));?>"/></td></tr>
			<tr><td>E-mail :</td><td><input type="text" name="email2" value="<?php echo htmlentities(stripslashes($_POST['email2']));?>"/></td></tr>
			<tr>
				<td>Country :</td>
				<td>
					<?php include("_private/country_dd.php");?>
				</td>
			</tr>
			<tr><td>Phone :</td><td><input type="text" name="phone" value="<?php echo htmlentities(stripslashes($_POST['phone']));?>"/><big class='red'>*</big></td></tr>
			<tr><td>Booking Description :</td><td><textarea name="description" rows="5" cols="50"><?php echo htmlentities(stripslashes($_POST['description']));?></textarea></td></tr>
			<tr><td colspan="2"><center><input type="submit" name="order" value="Order"></center></td></tr>
			</table>
		</form>