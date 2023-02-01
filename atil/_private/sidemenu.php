<?php
  $qt=mysql_query("SELECT * FROM page WHERE pagetype_id='3' OR  pagetype_id='6' ORDER BY priority");
  while($datat=mysql_fetch_assoc($qt))
  {
	{
			$qt2=mysql_query("SELECT id, heading FROM text_data WHERE page_id='".$datat['id']."' ORDER BY priority DESC LIMIT 17");
			while($datat2=mysql_fetch_assoc($qt2))
			{
				echo "<a href='index.php?page=".$datat['page']."&&data_id=".$datat2['id']."'>".$datat2['heading']."</a>";
			}
			echo "<a href='index.php?page=".$datat['page']."'> View All ".$datat['visual']."</a>";
	}
  }
