<div class="wrapper row3">
<div id="container">
<?php
	echo "<div id='sidebar_1' class='sidebar one_quarter first'>";
		echo "<aside>";
			include("_private/sidemenu.php");
		echo "</aside>";
	echo"</div>";
	echo "<div class='three_quarter'>";
		echo "<section>";
			echo "<h1>Contact Information</h1>";
			echo "<table>";
				$q=get_page_text_data($page_id);
						$count=0;
						while($data=mysql_fetch_assoc($q))
						{
							$contact_id=$data['id']; 	
							$contact=$data['heading']; 	
							$description=$data['content'];
							if(($count%2)==0)
							{
								echo "<tr class='dark'>";
							}
							else
							{
								echo "<tr class='light'>";
							}
								echo "<td>";
								echo "<b>".$contact."</b>";
								echo "</td>";
								echo "<td>";
								display_multi_image($page_id,$contact_id);
								echo nl2br($description);
								display_multi_link($page_id,$contact_id);
								echo "</td>";
							echo "</tr>";
							$count++;
						}
			echo "</table>";
		echo "</section>";
	echo "<div id='respond'>";
        echo "<h2>Send E-mail feedback</h2>";
		if($_POST['send'])
		{
			if($_POST['name']&&$_POST['company']&&$_POST['email']&&$_POST['subject']&&$_POST['message'])
			{
			    $subject=$_POST['subject'];
				$message=" Name : ".htmlentities(stripslashes($_POST['name']))."\n Company : ".htmlentities(stripslashes($_POST['company']))."\n E-mail : ".htmlentities(stripslashes($_POST['email']))."\n\n".htmlentities(stripslashes($_POST['message']));
				$date=date('Y-m-d');
				mysql_query("INSERT INTO mail VALUES('','$date','$subject','$message')");
					$to=$admin_email;
					if($to)
					{
						$headers="From: visitor@".$domain;
						ini_set("SMTP", "localhost");
						$mail=mail($to, $subject, $message, $headers);
						if($mail)
						{
						
							echo "<div class='alert-msg rnd8 success'>Mail Sent. Thanks for your feedback <a class='close' href='javascript:void(0)'>X</a></div>";
						}
						else
						{
							echo "<div class='alert-msg rnd8 error'>Could not send Mail. Sorry for the inconvenience.<a class='close' href='javascript:void(0)'>X</a></div>";
						}
					}
			}
			else
			{
				echo "<div class='alert-msg rnd8 warning'>Please Fill All Fields to Send E-mail<a class='close' href='javascript:void(0)'>X</a></div>";
			}
		}
			  echo "<form method='POST' class='rnd5'>";
			  echo "<table style='border-width:0px'>";
					echo "<tr><th>Name</th><th> : </th><th><input type='text' name='name'/></th></tr>";
					echo "<tr><th>Company</th><th> : </th><th><input type='text' name='company'/></th></tr>";
					echo "<tr><th>E-mail</th><th> : </th><th><input type='text' name='email'/></th></tr>";
					echo "<tr><th>Subject</th><th> : </th><th><input type='text' name='subject'/></th></tr>";
					echo "<tr><th>Message</th><th> : </th><th><textarea name='message' rows='10' cols='60'/></textarea></th></tr>";
					echo "<tr><th colspan='3'><center><input type='submit' name='send' value='Send'>&nbsp;&nbsp;<input type='reset' value='Reset'></center></th></tr>";
			  echo "</table>";
			  echo "</form>";
      echo "</div>";
	echo"</div>";
?>
<div class="clear"></div>
</div>
</div>