<?php
echo "<div id='sidemenu'>";
include("_private/sidemenu.php");
echo "</div>";
echo "<div class='embossed'>";
echo "<h2>
				Enter Invoice Number and click view:
				<form  method='POST' class='searchform'/>
					<input type='text' name='sells_id'  class='searchword' value='" . $_POST['sells_id'] . "' required/>
					<input type='submit' name='search'  class='searchsubmit' value='View'/>
				</form>
			</h2>";
if ($_POST['sells_id']) {
	$sells_id = $_POST['sells_id'];
	$q = mysql_query("SELECT * FROM sells WHERE id='" . $sells_id . "' ");
	if ($q) {
		$num = mysql_num_rows($q);
		if ($num > 0) {
			while ($data = mysql_fetch_assoc($q)) {
?>
				<br />
				<table class="structure" align="center" width='600px' border='1px'>
					<tr>
						<td colspan='4' class='l'>
							<b>Invoice Number : </b><?= $data['id'] ?>
							<br />
							<b>Date : </b><?= dateconvert($data['date']) ?>
							<br />
							<b>Status : </b>
							<?
							if ($data['status'] == 0)
								echo "Ordered";
							elseif ($data['status'] == 1)
								echo "Delivered and Paid";
							elseif ($data['status'] == 2)
								echo "Delivered but Payment Due";
							elseif ($data['status'] == 3)
								echo "Delivered and settled deal as bad depts";
							elseif ($data['status'] == 4)
								echo "Internal Transaction";
							elseif ($data['status'] == 5)
								echo "Internal Transaction";

							if ($data['status'] == 0) { ?>
								<br />
								<b>Customer Name and Details :</b> <?= nl2br($data['customer']); ?>
						</td>
					<? } ?>
					</tr>
				</table>
<?
			}
		} else {
			echo "<center><h2><i class='red'>No results found for " . $_POST['sells_id'] . "</i></h2></center>";
		}
	}
}
echo "</div>";
?>