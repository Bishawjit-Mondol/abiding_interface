<?php

	echo "<div id='sidemenu'>";
		include("_private/sidemenu.php");
	echo "</div>";
	if($searchword&&$_POST['search'])
	{
		echo "<h1>Search result for <b class='green'>".$searchword."</b></h1>";
		$searchword= trim($searchword);
		if(strlen($searchword)>1)
		{
			$searchword_exploded=explode(" ",$searchword);
			for($i=0; $searchword_exploded[$i]; $i++)
			{
				if($i==0)
				{
					$q1="SELECT page, visual FROM page WHERE visual LIKE '%".$searchword_exploded[$i]."%' ";	
					$q2="SELECT id, page_id, heading, content FROM text_data WHERE hidden='0' AND heading LIKE '%".$searchword_exploded[$i]."%' OR content LIKE '%".$searchword_exploded[$i]."%' ";
					$q3="SELECT id FROM img WHERE caption LIKE '%".$searchword_exploded[$i]."%' ";
				}	
				else
				{
					$q1=$q1."OR visual LIKE '%".$searchword_exploded[$i]."%' ";
					$q2=$q2."OR heading LIKE '%".$searchword_exploded[$i]."%' OR content LIKE '%".$searchword_exploded[$i]."%' ";
					$q3=$q3."OR caption LIKE '%".$searchword_exploded[$i]."%' ";
				}
			}
			$query1=mysql_query($q1);
			$query2=mysql_query($q2);
			$query3=mysql_query($q3);
			$num1=mysql_num_rows($query1);
			$num2=mysql_num_rows($query2);
			$num3=mysql_num_rows($query3);
			$total_num=$num1+$num2+$num3;
			if($total_num>0)
			{
				echo "<h3><i class='green'>";
					echo $total_num;
					echo " result";
					if($total_num>1) echo "s";
					echo " found.</i></h3>";
				if($num3>0)
				{
					echo "<table class='decorfulwidth' align='center'>";
						echo "<tr>";
							echo "<td>";
								echo "<h2>Image Results</h2>";
								echo "<table width='760px'>";
									echo "<tr>";
										$count=0;
										while($data3=mysql_fetch_assoc($query3))
										{
											if(($count%3)==0)
											{
												echo "</tr><tr>";
											}
											$img_id=$data3['id']; 
											echo "<td>";
												display_img_largeview_link($img_id);
											echo "</td>";
											$count++;
										}
									echo "</tr>";
								echo "</table>";
							echo "</td>";
						echo "</tr>";
					echo "</table>";
				}	
				if($num1>0)
				{
					while($data1=mysql_fetch_array($query1))
					{
						echo "<a href='index.php?page=".$data1['page']."'>
									<div class='embossed'>
										<h2>".rep_br_sp($data1['visual'])."</h2>
									</div>
								</a>";
					}
				}
				if($num2>0)
				{
					while($data2=mysql_fetch_array($query2))
					{
						$mainpage=get_page_by_id($data2['page_id']);
						echo "<a href='index.php?page=".$mainpage."&&data_id=".$data2['id']."'>
									<div class='embossed'>
										<h2>".$data2['heading']."</h2>
										<p class='green'>";
										for($j=0;$j<200;$j++)
										{
											echo $data2['content'][$j];
										}
										echo " ... ...</p>
									</div>
								</a>";
					}
				}
			}
			else
			{
				echo "<div class='embossed'><h2><i class='red'>No results Found</i></h2></div>";
			}
		}
		else
		{
			echo "<h2><i class='red'>Provide proper search word with at least 4 characters.</i></h1>";
		}
	}
	else
	{
		echo "<div class='embossed'>";
			echo "<h2>";
				echo "Enter Search words and click GO to view search results: ";
				include("_private/search_form.php");
			echo "</h2>";
		echo "</div>";
	}
?>