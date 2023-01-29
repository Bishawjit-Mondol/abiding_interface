<h1>Editing <a href="index.php?page=<?php echo $page?>"><?php echo $page_visual;?></a> Priority</h1>
<a href="index.php?page=<?php echo $page?>" class='button'>Edit <?php echo $page_visual;?></a> 
<a href="../index.php?page=<?php echo $page?>" class='button' target="_blank">Visit <i><?php echo $page_visual;?></i></a>
<br/>
<?php
    if($_POST[$sc.'submit'])
	{
		$q=1;
		$q_c=mysql_query("SELECT id, priority FROM text_data WHERE page_id='".$page_id."' ORDER BY priority DESC");
		mysql_query("START TRANSACTION");
		while($data_c=mysql_fetch_assoc($q_c)){
			if($data_c['priority']!=$_POST['priority_'.$data_c['id']])
			{
				if($q)
				{
					$q=mysql_query("UPDATE text_data SET priority='".$_POST['priority_'.$data_c['id']]."' WHERE id='".$data_c['id']."'");
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
	
	echo "<form method='POST'>";
		echo "<table class='structured'>";
			echo "<tr>";
				echo "<td>";
					echo "<table align='center' class='formaligner'>";
						echo "<tr><th>".$page_visual." Articles</th><th>Priority</th</tr>";
						$q2=mysql_query("SELECT id, heading, priority FROM text_data WHERE page_id='".$page_id."' ORDER BY priority DESC");
						while($data2=mysql_fetch_assoc($q2)){
							echo "<tr>";
								echo "<td>".$data2['heading']."</td>";
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
					echo "<tr><th colspan='2'><input type='submit' name='".$sc."submit' value='Change' onClick='showloading();'></th></tr>";				
					echo "</table>";
				echo "</td>";
			echo "</tr>";
		echo "</table>";
	echo "</form>";
?>