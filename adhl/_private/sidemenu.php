<?php
  $qt=mysql_query("SELECT * FROM page WHERE pagetype_id='3' OR  pagetype_id='6' ORDER BY priority");
  while($datat=mysql_fetch_assoc($qt))
  {
	echo "<h2>".$datat['visual']."</h2>";
			$qt2=mysql_query("SELECT id, heading FROM text_data WHERE page_id='".$datat['id']."' ORDER BY priority DESC LIMIT 17");
			echo "<nav><ul>";
			while($datat2=mysql_fetch_assoc($qt2))
			{
				echo "<li><a href='index.php?page=".$datat['page']."&&data_id=".$datat2['id']."'>".$datat2['heading']."</a></li>";
			}
			
			echo "<li><a href='index.php?page=".$datat['page']."'> View All ".$datat['visual']."</a></li>";
			echo "</ul></nav>";
  }
