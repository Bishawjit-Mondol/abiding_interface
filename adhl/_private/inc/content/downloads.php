<?php

	echo "<div id='sidemenu'>";
		include("_private/sidemenu.php");
	echo "</div>";
?>
<h1>Downloads</h1>
<div class="embossed">
<center><br/>
<?php
		$q=mysql_query("SELECT id, downloadtype_id, title, description FROM download");
		if(mysql_num_rows($q)>0)
		{
			echo "<div class='linkcontainer'>";
			while($data=mysql_fetch_assoc($q))
			{
				$downloadtype_id=$data['downloadtype_id'];
				$downloadtype=downloadtype_by_id($downloadtype_id);
				$url="download/db/".$data['id'].$downloadtype;
				echo "<a href='".$url."' target='_blank'>Download ".$data['title']."</a>";
				if($data['description'])
				{
					echo nl2br($data['description']);
				}
				echo "<br/><br/><br/>";
			}
			echo "</div>";
		}
		else
		{
			echo "<h3><b class='blue'>No downloads available.</b></h3>";
		}
?>
</center>
</div>