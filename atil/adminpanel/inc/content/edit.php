<h1>Edit Website</h1>
<div id="bigmenu">
	<a href="index.php?page=home_edit">Edit Home</a>
	<?php
		$q=all_data("page","priority");
		while($data=mysql_fetch_assoc($q))
		{
			if($data['pagetype_id']>(-1))  echo "<a href='index.php?page=".$data['page']."'>Edit ".rep_br_sp($data['visual'])."</a>";
		}
	?>
	<a href="index.php?page=page_priority">Edit Page Priority</a>
</div>