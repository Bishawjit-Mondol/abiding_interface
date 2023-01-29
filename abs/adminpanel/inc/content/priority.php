<h1>Priority</h1>
<div id="bigmenu">
	<a href="index.php?page=page_priority">Page Priority</a>
	<?php
		$q=mysql_query("SELECT * FROM page ORDER BY priority");
		while($data=mysql_fetch_assoc($q))
		{
			echo "<a href='index.php?page=".$data['page']."&&p=priority'>".rep_br_sp($data['visual'])." Priority</a>";
		}
	?>
</div>