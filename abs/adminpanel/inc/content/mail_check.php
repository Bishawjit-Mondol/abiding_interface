<h2>Mail</h2>
<?php
	if($_POST['delete']&&$_POST['mail_id']){
	    $mail_id=$_POST['mail_id'];
		$q=mysql_query("DELETE FROM mail WHERE id='$mail_id'");
		include("inc/q_check.php");
	}
	include("inc/message.php");

	$q2=mysql_query("SELECT * FROM mail ORDER BY date DESC");
	if($q2)
	{
		$num=mysql_num_rows($q2);
		if($num>0){
			echo "<h3>".$num." Messages Received</h3>";
			echo "<table align='center' class='rb' width='800px'>";
			echo "<tr><th width='80px'>Date</th><th width='100px'>Subject</th><th>Message</th><th class='notforprint'>Action</th></tr>";
			while($data=mysql_fetch_assoc($q2)){
				$mail_id=$data['id']; 	
				$date=dateconvert($data['date']); 	
				$subject=$data['subject']; 	
				$message=nl2br($data['message']);
				echo "<tr>
							<td>".$date."</td>
							<td>".$subject."</td>
							<td class='just'>".$message."</td>
				            <th class='notforprint'><form method='post'><input type='hidden' name='mail_id' value='".$mail_id."'><input type='submit' name='delete' value='Delete'  onClick='showloading();'/></form></th>
						</tr>";
			}
			echo "</table>";
		}
		else{
			echo "<h1>No Messages Received</h1>";
		}
	}
?>