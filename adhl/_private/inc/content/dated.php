<?php
	echo "<div id='sidemenu'>";
		include("_private/sidemenu_p.php");
	echo "</div>";
	if($data_id){
		$q=get_text_data($data_id);
		while($data=mysql_fetch_assoc($q))
		{
			$text_data_id=$data['id']; 	
			$heading=$data['heading']; 	
			$content=$data['content'];
			$dated=get_dated($page_id,$text_data_id);
			echo "<div class='embossed'>";
				echo "<h2>".$heading."</h2>";
					echo "<h4><i class='green'>Posted on : </i><b class='blue'>".$dated."</b></h4>";
					display_multi_image($page_id,$text_data_id);
					echo "<p>".nl2br($content)."</p>";
					display_multi_link($page_id,$text_data_id);
			echo "</div>";
		}
	}
	else{
		echo "<h1>".$page_visual."<a onClick='showAll()' class='button' id='showAll'>Expand All</a><a onClick='hideAll()' class='button' id='hideAll'>Minimize All</a></h1>";
		$q=get_dated_text_data_id($page_id);
		$count=0;
		while($data=mysql_fetch_assoc($q))
		{
			$text_data_id=$data['text_data_id']; 	
			$dated=dateconvert_wt($data['dated']);
			$data2=mysql_fetch_assoc(get_text_data($text_data_id));
			$heading=$data2['heading']; 	
			$content=$data2['content'];
			echo "<div class='embossed'>";
				echo "<a onClick='showit(".$count.")'><h2>".$heading."</h2></a>";
				echo "<div id='sud".$count."'>";
					echo "<h4><i class='green'>Posted on : </i><b class='blue'>".$dated."</b></h4>";
					display_multi_image($page_id,$text_data_id);
					echo "<p>".nl2br($content)."</p>";
					display_multi_link($page_id,$text_data_id);
				echo "</div>";
			echo "</div>";
			$count++;
		}
		echo "<br/><img src='images/blank1by1.gif'  alt='Blank' onload='hideAllButZero(".$count.")' class='customwidth' width='0px'>";
	}
