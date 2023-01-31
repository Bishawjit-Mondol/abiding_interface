<?php
	$img=$_REQUEST["img"];
	$r=$_REQUEST["r"];
	if($img&&$r)
	{
		$q=1;
		$qr=mysql_query("SELECT img.id, 
										imgtype.imgtype 
										FROM img 
										LEFT JOIN imgtype ON (img.imgtype_id=imgtype.id)
										WHERE img.id='".$img."'
										");
		$qd=mysql_fetch_assoc($qr);
		if(file_exists("../images/db/".$qd['id'].$qd['imgtype'])) $q=unlink("../images/db/".$qd['id'].$qd['imgtype']);
		if($q) $q=mysql_query("DELETE FROM img WHERE id='".$img."'");
		include("inc/q_check.php");
	}
	else{
       $say=null;	
	}
	
	include("inc/message.php");
	
	$type=$_REQUEST["type"];
	echo "<h3>EDIT ".strtoupper($type)."</h3>";
									$qm=mysql_query("SELECT img.id, 	img.caption, 	 SUBSTR(img.description,1,500) as description,
																			imgtype.imgtype 
																			FROM ".$type." 
																			LEFT JOIN img ON (".$type.".img_id=img.id)
																			LEFT JOIN imgtype ON (img.imgtype_id=imgtype.id)
																			ORDER BY img.priority DESC
																			");
																			
								$count=0;
								echo "<table align='center' class='rb'>";
								while($qmd=mysql_fetch_assoc($qm))
								{
									echo "<tr><td>";
										echo "<h2>";
											echo $qmd['caption'];
										echo "</h2>";
										echo "<p>";
											if(file_exists("../images/db/".$qmd['id'].$qmd['imgtype'])) echo "<img src='../images/db/".$qmd['id'].$qmd['imgtype']."' alt='".$qmd['caption']."' class='preview'>";
											echo nl2br($qmd['description']);
										echo "...</p>";
											echo "<a href='../index.php?page=large_img&&img=".$qmd['id']."' class='button' target='_blank'>View</a>";
											echo "<a href='index.php?page=post_editor&&img=".$qmd['id']."' class='button'>Edit</a>";
											echo "<a href='index.php?page=post_edit&&img=".$qmd['id']."&&type=".$type."&&r=1' class='button'>Delete</a>";
									echo "</td></tr>";
									$count++;
								}
								echo "</table>";
?>

