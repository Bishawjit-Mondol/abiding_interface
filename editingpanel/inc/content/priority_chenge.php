<?php	$img=$_REQUEST["img"];	$r=$_REQUEST["r"];	if($img&&$r)	{		$q=1;		$qr=mysql_query("SELECT img.id, 										imgtype.imgtype 										FROM img 										LEFT JOIN imgtype ON (img.imgtype_id=imgtype.id)										WHERE img.id='".$img."'										");		$qd=mysql_fetch_assoc($qr);		if(file_exists("../images/db/".$qd['id'].$qd['imgtype'])) $q=unlink("../images/db/".$qd['id'].$qd['imgtype']);		if($q) $q=mysql_query("DELETE FROM img WHERE id='".$img."'");		include("inc/q_check.php");	}	else{       $say=null;		}		include("inc/message.php");		$type=$_REQUEST["type"];	echo "<h3>CHANGE ".strtoupper($type)." PRIORITY</h3>";									$qm=mysql_query("SELECT img.id, 	img.caption, img.priority																			FROM ".$type." 																			LEFT JOIN img ON (".$type.".img_id=img.id)																			ORDER BY img.priority DESC																			");																											$count=0;								echo "<form method='POST'>";								echo "<table align='center' class='rb'>";								echo "<tr><th>".$page_visual." Articles</th><th>Priority</th</tr>";								while($qmd=mysql_fetch_assoc($qm))								{									if($_POST[$sc.'submit']&&($_POST['priority_'.$qmd['id']]!=$qmd['priority']))									{										$q=mysql_query("UPDATE  img SET priority='".$_POST['priority_'.$qmd['id']]."' WHERE id='".$qmd['id']."'");									}									echo "<tr>";										echo "<td><p><b>";											echo $qmd['caption'];										echo "</b></p></td>";										echo "<td>";											if($_POST['priority_'.$qmd['id']])												$priority=$_POST['priority_'.$qmd['id']];											else												$priority=$qmd['priority'];											echo "<select name='priority_".$qmd['id']."'>";											for($i=1;$i<101;$i++)											{												echo "<option value='".$i."'";												if($priority==$i)													echo "selected='selected'";												echo ">".$i." % </option>";											}										echo "</select>";										echo "</td>";									echo "</tr>";									$count++;								}								echo "<tr><th colspan='2'><input type='submit' value='Refresh' onClick='showloading();'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='submit' name='".$sc."submit' value='Change' onClick='showloading();'></th></tr>";									echo "</table>";								echo "</form>";?>