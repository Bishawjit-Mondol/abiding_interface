<?php
  $q=mysql_query("SELECT * FROM page ORDER BY priority DESC LIMIT 7");
  while($data=mysql_fetch_assoc($q))
  {
		echo "<a href='index.php?page=".$data['page']."'";
		if($page==$data['page'])
		{
			echo "class='current'";
		}
		echo">";
		echo $data['visual'];
		echo "</a>";
  }
