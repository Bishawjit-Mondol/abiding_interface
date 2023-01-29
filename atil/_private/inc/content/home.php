<?php
	echo "<div id='sscontainer'>";
		display_slide_show();
	echo "</div>";
	echo "<img src='images/shadow.png' border='0px' alt='".$companyname."' width='960px' height='15px'/>";
	/*$qf=mysql_query("SELECT 
								featured.text_data_id, 
								text_data.heading, 
								page.id  as page_id,
								page.page
								FROM featured
								LEFT JOIN text_data ON (text_data.id=featured.text_data_id)
								LEFT JOIN page ON (text_data.page_id=page.id)
								ORDER BY featured.id");
	if($qf)
	{
		echo "<div class='embossedfull'><center><h1>Our Best Selling Products</h1></center><marquee direction='left' scrollamount='5' scrolldelay='10' ONMOUSEOVER='this.stop();' ONMOUSEOUT='this.start();' width='920px' class='pgf'><table align='center'><tr>";
			while($dataf=mysql_fetch_assoc($qf))
			{
				$qfi=mysql_query("SELECT img.id, imgtype.imgtype FROM img LEFT JOIN imgtype ON (img.imgtype_id=imgtype.id) WHERE page_id='".$dataf['page_id']."' AND text_data_id='".$dataf['text_data_id']."' LIMIT 1");
				if($qfi)
				{
					while($datafi=mysql_fetch_assoc($qfi))
					{
						echo "<td>";
							echo "<a href='index.php?page=".$dataf['page']."&&data_id=".$dataf['text_data_id']."'><img src='images/db/".$datafi['id'].$datafi['imgtype']."' height='150px' class='bordered'/></a>";
						echo "</td>";
					}
				}
			}
		echo "</tr></table></marquee></div>";
	}*/
	echo "<div id='sidemenu'>";
		include("_private/sidemenu.php");
	echo "</div>";
	echo "<div class='embossed'>";
				echo"<h2>".nl2br($home_heading)."</h2>";
				echo "<p>".nl2br($home_intro)."</p>";
	echo "</div>";
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
						$q_p=mysql_query("SELECT id, heading FROM text_data WHERE page_id='".$pro_page_id."' ORDER BY priority DESC LIMIT 8");
						if(mysql_num_rows($q_p))
						{
							echo "<table align='center' class='decorfulwidth'>";
								echo "<tr>";
								$count=0;
								while($data=mysql_fetch_assoc($q_p))
								{
									if(($count%4)==0)
									{
										echo "</tr><tr>";
									}
									$text_data_id=$data['id']; 	
									$heading=$data['heading']; 
									echo "<td width='25%'><a href='index.php?page=".$pro_page."&&data_id=".$text_data_id."'>";		
										echo "<h4>".$heading."</h4>"; 
										display_preview_image($pro_page_id,$text_data_id);		
										//echo "<h4><i class='green'>".get_price($text_data_id)."</i></h4>";										
									echo "</a></td>";
									$count++;
								}
								echo "</tr>";
								echo "<tr>";
									echo "<th colspan='4'>";		
										echo "<center>
													<a href='index.php?page=".$pro_page."' class='bluebutton'>View all ".$pro_visual."</a>
												</center>";
									echo "</th>";
								echo "</tr>";
							echo "</table>";
						}
					}
				}
	echo "</table>";
	echo "<div id='bigemboss'>";
	$count=0;
	$width=780;
	include("_private/pg.php");
	$count=$count+1;
	echo "<br/><img src='images/blank1by1.gif'  alt='Blank' onload='hideAllButZero(".$count.")' class='customwidth' width='0px'>";
	echo "</div>";
?>