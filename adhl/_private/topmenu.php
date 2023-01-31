<ul class="clear">
	<?php
	if (!empty($_GET['page'])) {
		$page = $_GET['page'];
	} else {
		$page = "home";
	}
	$qt = all_data("page", "priority");
	while ($datat = mysql_fetch_assoc($qt)) {
		echo "<li>";
		echo "<a href='index.php?page=" . $datat['page'] . "'";
		if ($page == $datat['page']) {
			echo "class='active'";
		}
		echo ">" . $datat['visual'] . "</a>";
		if ($datat['pagetype_id'] == 3) {
			$qcatm = mysql_query("SELECT * FROM category WHERE page_id='" . $datat['id'] . "'ORDER BY priority DESC");
			if (mysql_num_rows($qcatm) > 0) {
				echo "<ul>";
				while ($datatcatm = mysql_fetch_assoc($qcatm)) {
					echo "<li><a href='index.php?page=" . $datat['page'] . "&&category=" . $datatcatm['id'] . "'>" . $datatcatm['category'];
					$qctd = mysql_query("SELECT text_data_id FROM category_vs_text_data WHERE category_id=" . $datatcatm['id']);
					if (mysql_num_rows($qctd) > 0) {
						echo "<img src='images/arrow.png' alt='>'>";
						echo "</a>";
						$ct = 1;
						while ($datactd = mysql_fetch_assoc($qctd)) {
							if ($ct == 1) {
								$qcond = " id='" . $datactd['text_data_id'] . "' ";
								$ct = 2;
							} else {
								$qcond = $qcond . "OR id='" . $datactd['text_data_id'] . "' ";
							}
						}
						$qtdd = mysql_query("SELECT id, SUBSTR(heading,1,25) as heading FROM text_data WHERE " . $qcond . " AND hidden='0' ORDER BY priority DESC");
						if (mysql_num_rows($qtdd) > 0) {
							echo "<ul>";
							while ($datattdd = mysql_fetch_assoc($qtdd)) {
								echo "<li><a href='index.php?page=" . $datat['page'] . "&&data_id=" . $datattdd['id'] . "'>" . $datattdd['heading'] . "</a></li>";
							}
							echo "</ul>";
						}
					} else {
						echo "</a>";
					}
					echo "</li>";
				}
				echo "<li><a href='index.php?page=" . $datat['page'] . "'> View all " . $datat['visual'] . "</a></li>";
				echo "</ul>";
			}
		} elseif ($datat['pagetype_id'] > 0) {
			echo "<ul>";
			$qt2 = mysql_query("SELECT id, SUBSTR(heading,1,25) as heading FROM text_data WHERE page_id='" . $datat['id'] . "'  AND hidden='0' ORDER BY priority DESC LIMIT 10");
			while ($datat2 = mysql_fetch_assoc($qt2)) {
				echo "<li><a href='index.php?page=" . $datat['page'] . "&&data_id=" . $datat2['id'] . "'>" . $datat2['heading'] . "</a></li>";
			}
			echo "<li><a href='index.php?page=" . $datat['page'] . "'> View all " . $datat['visual'] . "</a></li>";
			echo "</ul>";
		}
		echo "</li>";
	}
	?>
</ul>