<?php

	echo "<div id='sidemenu'>";
		include("_private/sidemenu.php");
	echo "</div>";
				$qc=mysql_query("SELECT * FROM img");
				$num=mysql_num_rows($qc);
				if($num>0)
				{ 
							if($_GET['start'])
							{
								$start=mysql_escape_string($_GET['start']);
							}
							else
							{
								$start=0;
							}
							$perpage=15;
							$pageurl="index.php?page=".$page;
							$q=mysql_query("SELECT * FROM img ORDER BY priority DESC LIMIT ".$start.",".$perpage."");
							$pagination=get_pagination($perpage,$start,$pageurl,$qc);
							echo "<h1>".$page_visual." ".$pagination."</h1>";
								echo "<table width='780px' class='decorfulwidth' >";
									echo "<tr>";
										$count=0;
										while($data3=mysql_fetch_assoc($q))
										{
											if(($count%3)==0)
											{
												echo "</tr><tr>";
											}
											$img_id=$data3['id']; 
											echo "<td>";
												$data_id=$data3['text_data_id'];
												$q2=mysql_query("SELECT page_id FROM text_data WHERE id='".$data_id."'");
												$data2=mysql_fetch_assoc($q2);
												$backpage=get_page_by_id($data2['page_id']);
												echo "<a href='index.php?page=largeview&&img_id=".$img_id."&&data_id=".$data_id."&&backpage=".$backpage."'>";
													echo "<h4>";
														for($i=0;$i<20;$i++) echo $data3['caption'][$i];
														if(strlen(caption)>=20) echo "...";
													echo "</h4>";
													echo "<br/>";
													echo "<img src='images/db/".$img_id.imgtype_by_id($data3['imgtype_id'])."' alt='".$data3['caption']."'/>";
												echo "</a>";
											echo "</td>";
											$count++;
										}
									echo "</tr>";
								echo "</table>";
								echo $pagination;
				}
