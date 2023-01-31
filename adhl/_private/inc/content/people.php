<div class="wrapper row3">
	<div id="container">
		<?php
		echo "<div id='sidebar_1' class='sidebar one_quarter first'>";
		echo "<aside>";
		include("_private/sidemenu_p.php");
		echo "</aside>";
		echo "</div>";
		if ($data_id) {
			echo "<div class='three_quarter'>";
			$q = get_text_data($data_id);
			while ($data = mysql_fetch_assoc($q)) {
				$text_data_id = $data['id'];
				$heading = $data['heading'];
				$content = $data['content'];
				echo "<section>";
				echo "<h3>" . $heading . "</h3>";
				display_multi_image_slides($page_id, $text_data_id);
				echo "<p>" . nl2br($content) . "</p>";
				display_multi_link($page_id, $text_data_id);
				echo "</section>";
			}
			echo "</div>";
		} else {
			$qc = mysql_query("SELECT id, heading FROM text_data WHERE page_id='" . $page_id . "'  AND hidden='0' ORDER BY priority DESC");
			if (mysql_num_rows($qc) > 0) {
				if ($_GET['start']) {
					$start = mysql_escape_string($_GET['start']);
				} else {
					$start = 0;
				}
				$perpage = 3;
				$pageurl = "index.php?page=" . $page;
				$q = mysql_query("SELECT id, heading, SUBSTR(content,1,50) as content  FROM text_data WHERE page_id='" . $page_id . "'  AND hidden='0' ORDER BY priority DESC LIMIT " . $start . "," . $perpage . "");
				$pagination = get_pagination($perpage, $start, $pageurl, $qc);

				echo "<div id='portfolio' class='three_quarter'>";
				echo "<div class='clear'></div>";
				echo "<ul class='clear'>";
				$count = 0;
				while ($data = mysql_fetch_assoc($q)) {
					if (($count % 3) == 0) {
						echo "<li class='one_third first'>";
					} else {
						echo "<li class='one_third'>";
					}
					$text_data_id = $data['id'];
					$heading = $data['heading'];
					$content = $data['content'];
					echo "<article class='clear'>";
					echo "<a href='index.php?page=" . $page . "&&data_id=" . $text_data_id . "'>";
					echo "<figure class='post-image'>";
					display_preview_image($page_id, $text_data_id);
					echo "</figure>";
					echo "<h2>" . $heading . "</h2>";
					echo "<p>" . $content . "...</p>";
					echo "</a>";
					echo "</article>";
					echo "</li>";
					$count++;
				}
				echo "</ul>";
				echo $pagination;
				echo "</div>";
			}
		}
		?>
		<div class="clear"></div>
	</div>
</div>