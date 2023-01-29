<?php
	display_slide_show();
	echo "<div class='wrapper row3'>
				<div id='container'>";
					echo "<section class='clear'>";
					echo"<h1>".nl2br($home_heading)."</h1>";
					echo "<p>".nl2br($home_intro)."</p>";
		echo "</section>";
		echo "<section>";
						$q_p=mysql_query("SELECT id, page, visual FROM page WHERE pagetype_id='3' OR pagetype_id='6' ORDER BY priority DESC");
				$num_product_pages=mysql_num_rows($q_p);
				if($num_product_pages>0)
				{
					while($data1=mysql_fetch_assoc($q_p))
					{
						$pro_page_id=$data1['id'];
						$pro_page=$data1['page'];
						$pro_visual=$data1['visual'];
						//echo "<h2>".$pro_visual."</h2>";
						$q_p=mysql_query("SELECT id, heading,  SUBSTR(content,1,50) as content FROM text_data WHERE page_id='".$pro_page_id."' ORDER BY priority DESC LIMIT 4");
						if(mysql_num_rows($q_p))
						{
							echo "<ul class='nospace clear'>";
								$count=0;
								while($data=mysql_fetch_assoc($q_p))
								{
									$text_data_id=$data['id']; 	
									$heading=$data['heading']; 
									$content=$data['content']; 
									if($count==0)
									{
										echo "<li class='one_quarter first'>";$count=1;
									}
									else
									{
										echo "<li class='one_quarter'>";
									}
										echo "<article class='boxholder rnd8'>";
											echo "<a href='index.php?page=".$pro_page."&&data_id=".$text_data_id."'>";		
												echo "<div class='push20'>";
												display_preview_image($pro_page_id,$text_data_id);
												echo "</div>";
												echo "<h2 class='font-medium nospace'>".$heading."</h2>"; 			
												echo "<p class='nospace'>".$content."...</p>";										
											echo "</a>";										
										echo "</article>";										
									echo "</li>";
									$count++;
								}
							echo "</ul>";
						}
					}
				}
		echo "</section>";
		echo "<div class='clear'></div></div></div>";
?>