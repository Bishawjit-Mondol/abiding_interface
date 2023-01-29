<?php
  $qt=mysql_query("SELECT id, page, visual FROM page WHERE id='".$page_id."'");
  while($datat=mysql_fetch_assoc($qt))
  {
	echo "<br/><b>".$datat['visual']."</b>";
	$qt2=mysql_query("SELECT id, heading FROM text_data WHERE page_id='".$datat['id']."' ORDER BY priority DESC LIMIT 16");
	while($datat2=mysql_fetch_assoc($qt2))
	{
		echo "<a href='index.php?page=".$datat['page']."&&data_id=".$datat2['id']."'>".$datat2['heading']."</a>";
	}
  }
?>