<?php
	echo "<div id='sidemenu'>";
		include("_private/sidemenu_p.php");
	echo "</div>";
	if($data_id){
		$qo=get_text_data($data_id);
		while($data=mysql_fetch_assoc($qo))
		{
			$text_data_id=$data['id']; 	
			$heading=$data['heading']; 	
			$content=$data['content']; 
			if($_GET['order']==1) include("_private/order_soft.php");
			echo "<div class='embossed'>";
				echo "<h2>".$heading."</h2>";
					echo "<div class='price'>";
					echo get_price($text_data_id);
					if($_GET['order']!=1) echo "<a href='index.php?page=".$page."&&data_id=".$data_id."&&order=1' class='bluebutton'>Order Now</a>";
					echo "</div>";
					display_multi_image_slides($page_id,$text_data_id);
					echo "<p class='inblock'>".nl2br($content)."</p>";
					display_multi_link($page_id,$text_data_id);
			echo "</div>";
		}
	}
	elseif($_GET['category'])
	{
		$category_id=$_GET['category'];
		$qctd=mysql_query("SELECT text_data_id FROM category_vs_text_data WHERE category_id=".$category_id);
		if(mysql_num_rows($qctd)>0)
		{
			$ct=1;
			while($datactd=mysql_fetch_assoc($qctd))
			{
				if($ct==1)
				{
					$qcond=" id='".$datactd['text_data_id']."' ";
					$ct=2;
				}
				else
				{
					$qcond=$qcond."OR id='".$datactd['text_data_id']."' ";
				}
			}
			$qc=mysql_query("SELECT id, heading,content FROM text_data WHERE ".$qcond."  AND hidden='0' ORDER BY priority DESC");
			if(mysql_num_rows($qc)>0)
			{	
				if($_GET['start'])
				{
					$start=mysql_escape_string($_GET['start']);
				}
				else
				{
					$start=0;
				}
				$perpage=16;
				$pageurl="index.php?page=".$page."&&category=".$category_id;
				$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='".$page_id."' AND (".$qcond.")  AND hidden='0' ORDER BY priority DESC LIMIT ".$start.",".$perpage."");
				$pagination=get_pagination($perpage,$start,$pageurl,$qc);
				$qcat=mysql_query("SELECT category FROM category WHERE id=".$category_id);
				$datacat=mysql_fetch_assoc($qcat);
				echo "<h1>".$page_visual."  - <small>".$datacat['category']."</small> ".$pagination."</h1>";
				echo "<table class='decorfulwidth' align='center'>";
					echo "<tr>";
					$count=0;
					while($data=mysql_fetch_assoc($q))
					{
						if(($count%4)==0)
						{
							echo "</tr><tr>";
						}
						$text_data_id=$data['id']; 	
						$heading=$data['heading']; 
						echo "<td width='25%'><a href='index.php?page=".$page."&&data_id=".$text_data_id."'>";					
							echo "<h3>".$heading."</h3>"; 
							display_preview_image($page_id,$text_data_id);
							echo "<h4><i class='green'>".get_price($text_data_id)."</i></h4>";
						echo "</a></td>";
						$count++;
					}
					echo "</tr>";
				echo "</table>";
				echo $pagination;
			}
		}
		else
		{
			$qcat=mysql_query("SELECT category FROM category WHERE id=".$category_id);
			$datacat=mysql_fetch_assoc($qcat);
			echo "<h1>".$page_visual."  - <small>".$datacat['category']."</small></h1>";
			echo "<h2>No data uploaded under this category.</h2>";
		}
	}
	else{
		$qc=mysql_query("SELECT id, heading FROM text_data WHERE page_id='".$page_id."'  AND hidden='0' ORDER BY priority DESC");
		if(mysql_num_rows($qc)>0)
		{	
			if($_GET['start'])
			{
				$start=mysql_escape_string($_GET['start']);
			}
			else
			{
				$start=0;
			}
			$perpage=16;
			$pageurl="index.php?page=".$page;
			$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='".$page_id."'  AND hidden='0' ORDER BY priority DESC LIMIT ".$start.",".$perpage."");
			$pagination=get_pagination($perpage,$start,$pageurl,$qc);
			echo "<h1>".$page_visual." ".$pagination."</h1>";
			echo "<table class='decorfulwidth' align='center'>";
				echo "<tr>";
				$count=0;
				while($data=mysql_fetch_assoc($q))
				{
					if(($count%4)==0)
					{
						echo "</tr><tr>";
					}
					$text_data_id=$data['id']; 	
					$heading=$data['heading']; 
					echo "<td width='25%'><a href='index.php?page=".$page."&&data_id=".$text_data_id."'>";					
						echo "<h3>".$heading."</h3>";
						display_preview_image($page_id,$text_data_id);
						echo "<h4><i class='green'>".get_price($text_data_id)."</i></h4>";
					echo "</a></td>";
					$count++;
				}
				echo "</tr>";
			echo "</table>";
			echo $pagination;
		}
	}
