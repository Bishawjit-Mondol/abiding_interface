<?php
	echo "<div id='sidemenu'>";
		include("_private/sidemenu_p.php");
	echo "</div>";
	if($data_id){
		$q=get_text_data($data_id);
		while($data=mysql_fetch_assoc($q))
		{
			$text_data_id=$data['id']; 	
			$heading=$data['heading']; 	
			$content=$data['content']; 	
			echo "<div class='embossed'>";
				echo "<h2>".$heading."</h2>";
					display_multi_image($page_id,$text_data_id);
					echo "<p>".nl2br($content)."</p>";
					display_multi_link($page_id,$text_data_id);
			echo "</div>";
		}
	}
	else{
	echo "<h1>".$page_visual."<a onClick='showAll()' class='button' id='showAll'>Expand All</a><a onClick='hideAll()' class='button' id='hideAll'>Minimize All</a></h1>";		
	echo "<div class='embossed'>";
			echo "<a onClick='showit(0)'><h2>Our Contact Information</h2></a>";
			echo "<div id='sud0'>";
			echo "<table class='structure' align='center' width='700px'>";
			$q=get_page_text_data($page_id);
			while($data=mysql_fetch_assoc($q))
			{
				$contact_id=$data['id']; 	
				$contact=$data['heading']; 	
				$description=$data['content'];
				echo "<tr>";
					echo "<td width='150px'>";
					echo "<b>".$contact."</b>";
					echo "</td>";
					echo "<td>";
					display_multi_image($page_id,$contact_id);
					echo nl2br($description);
					display_multi_link($page_id,$contact_id);
					echo "</td>";
				echo "</tr>";
			}
			echo "</table>";
			echo "</div>";
	echo "</div>";
	echo "<div class='embossed'>";
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
							echo "<h2><b class='green'>Mail Sent. Thanks for your feedback</b></h2>";
						}
						else
						{
							echo "<h2><b class='red'>Could not send Mail. Sorry for the inconvenience.</b></h2>";
						}
					}
			}
			else
			{
				echo "<h2><b class='red'>Please Fill All Fields to Send E-mail</b></h2>";
			}
		}
	  echo "<a onClick='showit(1)'><h2>Send E-mail</h2></a>";
	  echo "<div id='sud1'>";
	  echo "<form method='POST'>";
	  echo "<table class='structure' align='center' width='700px'>";
			echo "<tr><td>Name : </td><td><input type='text' name='name'/></td></tr>";
			echo "<tr><td>Company : </td><td><input type='text' name='company'/></td></tr>";
			echo "<tr><td>E-mail : </td><td><input type='text' name='email'/></td></tr>";
			echo "<tr><td>Subject : </td><td><input type='text' name='subject'/></td></tr>";
			echo "<tr><td>Message : </td><td><textarea name='message' rows='10' cols='60'/></textarea></td></tr>";
			echo "<tr><th colspan='2'><input type='submit' name='send' value='Send'></th></tr>";
	  echo "</table>";
	  echo "</form>";
	  echo "</div>";
	echo "</div>";
	$count=1;
	$width=780;
	include("_private/pg.php");
	$count=$count+1;
	echo "<br/><img src='images/blank1by1.gif'  alt='Blank' onload='hideAllButZero(".$count.")' class='customwidth' width='0px'>";
}
?>