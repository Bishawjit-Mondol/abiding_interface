<div class="wrapper row3">
	<div id="container">
		<?php
		echo "<div id='sidebar_1' class='sidebar one_quarter first'>";
		echo "<aside>";
		include("_private/sidemenu_p.php");
		echo "</aside>";
		echo "</div>";
		echo "<div class='three_quarter'>";
		if ($data_id) {
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
		} else {
			$q = get_page_text_data($page_id);
			$count = 0;
			echo "<section>";
			while ($data = mysql_fetch_assoc($q)) {
				$text_data_id = $data['id'];
				$heading = $data['heading'];
				$content = $data['content'];
				echo "<a onClick='showit(" . $count . ")'><br/><h3>" . $heading . "</h3></a>";
				echo "<div id='sud" . $count . "'>";
				display_multi_image($page_id, $text_data_id);
				echo "<p>" . nl2br($content) . "</p>";
				display_multi_link($page_id, $text_data_id);
				echo "</div>";
				echo "<hr/>";
				$count++;
			}
			echo "</section>";
			echo "<br/><img src='images/blank1by1.gif'  alt='Blank' onload='hideAllButZero(" . $count . ")' class='customwidth' width='0px'>";
		}
		echo "</div>";
		?>
		<div class="clear"></div>
	</div>
</div>