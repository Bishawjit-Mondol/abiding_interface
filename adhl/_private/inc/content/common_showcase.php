<?php
	if($data_id){
		$q=get_text_data($data_id);
		while($data=mysql_fetch_assoc($q))
		{
			$text_data_id=$data['id']; 	
			$heading=$data['heading']; 	
			$content=$data['content']; 	
			echo "<div class='embossed'>";
				echo "<h2>".$heading."</h2>";
					display_multi_image_slides($page_id,$text_data_id);
					echo "<p>".nl2br($content)."</p>";
					display_multi_link($page_id,$text_data_id);
			echo "</div>";
		}
	}
	else{
		echo "<h1>".$page_visual."<a onClick='showAll()' class='button' id='showAll'>Expand All</a><a onClick='hideAll()' class='button' id='hideAll'>Minimize All</a></h1>";
		$q=get_page_text_data($page_id);
		$count=0;
		while($data=mysql_fetch_assoc($q))
		{
			$text_data_id=$data['id']; 	
			$heading=$data['heading']; 	
			$content=$data['content'];
			echo "<div class='embossed'>";
				echo "<a onClick='showit(".$count.")'><h2>".$heading."</h2></a>";
				echo "<div id='sud".$count."'>";
				    display_multi_image($page_id,$text_data_id);
						echo "<p>".nl2br($content)."</p>";
					display_multi_link($page_id,$text_data_id);
				echo "</div>";
			echo "</div>";
			$count++;
		}
		$q=mysql_query("SELECT id FROM img WHERE text_data_id='0' AND page_id='$page_id'");
		if(mysql_num_rows($q)>0)
		{
			echo "<div id='slideshow'>";
				$count=1;
				while($data=mysql_fetch_assoc($q))
				{
					display_sliding($data['id'],$count);
					$count++;
				}
				echo "<br/><img src='images/blank1by1.gif'  alt='Blank' onload='hideintrorest()' class='customwidth' width='0px' alt=''>";
			echo "</div>";
		}
		echo "<br/><img src='images/blank1by1.gif'  alt='Blank' onload='hideAllButZero(".$count.")' class='customwidth' width='0px'>";
	}
