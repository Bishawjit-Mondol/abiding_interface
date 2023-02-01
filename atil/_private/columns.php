<table border="0px" width="960px" align="center">
	<tr>
		<?php
		$qcol = mysql_query("SELECT * FROM page WHERE pagetype_id>0 ORDER BY priority DESC LIMIT 3");
		while ($datacol = mysql_fetch_assoc($qcol)) {
			echo "<td width='320px'>";
			echo "<h2><a href='index.php?page=" . $datacol['page'] . "'>" . rep_br_sp($datacol['visual']) . "</a></h2>";
			echo "<ul>";
			$qcol2 = mysql_query("SELECT id, heading FROM text_data WHERE page_id='" . $datacol['id'] . "' AND hidden='0' ORDER BY priority DESC LIMIT 3");
			while ($datacol2 = mysql_fetch_assoc($qcol2)) {
				echo "<li><a href='index.php?page=" . $datacol['page'] . "&&data_id=" . $datacol2['id'] . "'>" . $datacol2['heading'] . "</a></li>";
			}
			echo "<li><a href='index.php?page=" . $datacol['page'] . "'>View All ...</a></li>";
			echo "</ul>";
			echo "</td>";
		}
		?>
	</tr>
</table>