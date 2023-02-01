<div class="embossed">
	<?php
	echo "<h1>Send E-mail to " . $heading . "</h1>";
	if ($_POST['send']) {
		if ($_POST['name'] && $_POST['email'] && $_POST['subject'] && $_POST['message']) {
			$subject = $_POST['subject'];
			$message = " Name : " . htmlentities(stripslashes($_POST['name'])) . "\n E-mail : " . htmlentities(stripslashes($_POST['email'])) . "\n\n" . htmlentities(stripslashes($_POST['message']));
			$date = date('Y-m-d');
			mysql_query("INSERT INTO mail VALUES('','$date','$subject','$message')");
			$to = $email;
			if ($to) {
				$headers = "From: visitor@" . $domain;
				ini_set("SMTP", "localhost");
				$mail = mail($to, $subject, $message, $headers);
				if ($mail) {
					echo "<h2><b class='green'>Mail Sent to " . $to . "</b></h2>";
				} else {
					echo "<h2><b class='red'>Could not send Mail to " . $to . "</b></h2>";
				}
			}
		} else {
			echo "<h2><b class='red'>Please Fill All Fields to Send E-mail</b></h2>";
		}
	}
	?>
	<form method="POST">
		<table class="structure" align="center" width="700px">
			<tr>
				<td>Name : </td>
				<td><input type="text" name="name" value="<?php echo htmlentities(stripslashes($_POST['name'])); ?>" /></td>
			</tr>
			<tr>
				<td>E-mail : </td>
				<td><input type="text" name="email" value="<?php echo htmlentities(stripslashes($_POST['email'])); ?>" /></td>
			</tr>
			<tr>
				<td>Subject : </td>
				<td><input type="text" name="subject" value="<?php echo htmlentities(stripslashes($_POST['subject'])); ?>" /></td>
			</tr>
			<tr>
				<td>Message : </td>
				<td><textarea name="message" rows="10" cols="60" /><?php echo htmlentities(stripslashes($_POST['message'])); ?></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" name="send" value="Send"></th>
			</tr>
		</table>
	</form>
</div>