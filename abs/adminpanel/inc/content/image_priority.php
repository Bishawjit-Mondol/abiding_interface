<h1>Image Priority</h1>
<a href="index.php?page=<?=$_POST['backpage']?>&&imgedted=1" class="button">Back</a><br/>
<?php
	$text_data_id=$_POST['text_data_id'];
	
    if($_POST[$sc.'submit']){
			$q=1;
			$q_c=mysql_query("SELECT id, priority FROM img WHERE text_data_id='".$text_data_id."'");
			mysql_query("START TRANSACTION");
			while($data_c=mysql_fetch_assoc($q_c)){
				if($data_c['priority']!=$_POST['priority_'.$data_c['id']])
				{
					if($q)
					{
						$q=mysql_query("UPDATE  img SET priority='".$_POST['priority_'.$data_c['id']]."' WHERE id='".$data_c['id']."'");
					}
				}
			}
			if($q){
					mysql_query("COMMIT");
			}
			else{
					mysql_query("ROLLBACK");
			}
			include("inc/q_check.php");
	}
	else{
       $say=null;	
	}
	include("inc/message.php");

	echo "<table class='structured'><tr><td>";
	$q2=mysql_query("SELECT id, caption, priority FROM img WHERE text_data_id='".$text_data_id."' ORDER BY priority DESC");
	if(mysql_num_rows($q2))
	{
		echo "<form method='POST'>";
		echo "<table align='center' class='formaligner'>";
		echo "<tr><th colspan='2'><big>".$data['heading']."</big></th></tr>";
		while($data2=mysql_fetch_assoc($q2))
		{
			echo "<tr>";
				echo "<td>".$data2['caption']."</td>";
				echo "<td>";
						echo "<select name='priority_".$data2['id']."'>";
							for($i=1;$i<101;$i++)
							{
								echo "<option value='".$i."'";
								if($data2['priority']==$i)
									echo "selected='selected'";
								echo ">".$i." % </option>";
							}
						echo "</select>";
				echo "</td>";
			echo "</tr>";
		}
		echo "
			<tr>
				<th colspan='2'>
					<input type='hidden' name='backpage' value='".$_POST['backpage']."'/>
					<input type='hidden' name='text_data_id' value='".$text_data_id."'>
					<input type='submit' name='".$sc."submit' value='Save Priority Changes' onClick='showloading();'>
				</th>
			</tr>";
		echo "</table>";
		echo "</form>";
	}
	else{
		echo "<h2>No images uploaded yet under this category.</h2>";
	}
	echo "</td></tr></table>";
?>