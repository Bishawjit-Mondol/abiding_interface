<?php
if ($q) {
	$num = mysql_num_rows($q);
	if ($num > 0) {
		while ($data = mysql_fetch_assoc($q)) {
?>
			<form method='POST' action='index.php?page=soft_sell_individual'>
				<input type="hidden" name="sells_id" value='<?= $data['id'] ?>' />
				<input type="hidden" name="sells_status" value='<?= $data['status'] ?>' />
				<table class="rb" align="center">
					<tr>
						<td colspan='4' class='l'>
							<b>Invoice Number : </b><a href='index.php?page=soft_sell_individual&&sells_id=<?= $data['id'] ?>'><?= $data['id'] ?></a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b>Date : </b><?= dateconvert($data['date']) ?>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b>Status : </b>
							<?php
							if ($data['status'] == 0)
								echo "Ordered";
							elseif ($data['status'] == 1)
								echo "Delivered and Paid";
							elseif ($data['status'] == 2)
								echo "Delivered but Payment Due";
							elseif ($data['status'] == 3)
								echo "Delivered and settled deal as bad depts";
							elseif ($data['status'] == 4)
								echo "Purchase";
							elseif ($data['status'] == 5)
								echo "Manual Transaction";
							?>
							<br /><br />
							<b><?php if ($data['status'] == 4) echo "Supplier  Details :";
								elseif ($data['status'] == 5) echo "Transaction Purpose :";
								else echo "Customer Details :"; ?></b> <?= nl2br($data['customer']); ?>
						</td>
					</tr>

					<?php
					if ($data['status'] == 5) {
						$q3 = mysql_query("SELECT SUM(amount) as paid FROM  payments WHERE payments.sells_id='" . $data['id'] . "' ");
						$data3 = mysql_fetch_assoc($q3);
						$paid = $data3['paid'];
						if ($paid < 0)
							echo "<tr><th colspan='3' class='l'>Paid</th><td class='r'>" . (-$paid) . "</td></tr>";
						else
							echo "<tr><th colspan='3' class='l'>Received</th><td class='r'>" . ($paid) . "</td></tr>";
					}
					$q2 = mysql_query("SELECT sells_details.*, 
															text_data.heading, 
															page.page 
															FROM sells_details 
															LEFT JOIN text_data ON (text_data.id=sells_details.text_data_id)
															LEFT JOIN page ON (text_data.page_id=page.id)
															WHERE sells_details.sells_id='" . $data['id'] . "' ");
					if ($q2) {
						$num2 = mysql_num_rows($q2);
						if ($num2 > 0) {
					?>
							<tr>
								<th class='l'>
									Product
								</th>
								<th>
									Quantity
								</th>
								<th>
									Rate
								</th>
								<th class='r'>
									Total
								</th>
							</tr>
							<?php
							$gt = 0;
							while ($data2 = mysql_fetch_assoc($q2)) {
								$st = $data2['quantity'] * $data2['rate'];
								$gt = $gt + $st;
								echo "
										<tr>
											<td class='l'><a target='_blank' href='../index.php?page=" . $data2['page'] . "&&data_id=" . $data2['text_data_id'] . "'>"
									. $data2['heading'] .
									"</a></td>
											<td>
												" . $data2['quantity'] . "
											</td>
											<td>
												" . $data2['rate'] . "
											</td>
											<td class='r'>
												" . bfn($st) . "
											</td>
										</tr>
									";
							}
							?>
							<tr>
								<th colspan='3' class='l'>
									Total Charges
								</th>
								<td class='r'>
									<?php if ($gt) echo bfn($gt);
									else echo "0"; ?>
								</td>
							</tr>
							<tr>
								<th colspan='3' class='l'>
									Discount
								</th>
								<td class='r'>
									<?php if ($data['discount']) echo "(-) " . bfn($data['discount']);
									else echo "0"; ?>
								</td>
							</tr>
							<tr>
								<th colspan='3' class='l'>
									Grand Total after Discount:
								</th>
								<td class='r'>
									<?php if ($gt) echo bfn(($gt - $data['discount']));
									else echo "0"; ?>
								</td>
							</tr>
							<?php
							$q4 = mysql_query("SELECT date, amount FROM  payments WHERE payments.sells_id='" . $data['id'] . "' ");
							if (mysql_num_rows($q4)) {
								while ($data4 = mysql_fetch_assoc($q4)) {
									echo "<tr>";
									echo "<th colspan='3' class='l'>";
									if ($data['status'] == 4) echo "Paid on ";
									else echo "Received on ";
									echo dateconvert($data4['date']);
									echo "</th>";
									echo "<td class='r'>";
									echo  bfn($data4['amount']);
									echo "</td>";
									echo "</tr>";
								}
							}
							?>
							<tr>
								<th colspan='3' class='l'>
									<?php
									if ($data['status'] == 4)
										echo "Total Paid";
									else
										echo "Total Received";
									?>
								</th>
								<td class='r'>
									<?php
									$q3 = mysql_query("SELECT SUM(amount) as paid FROM  payments WHERE payments.sells_id='" . $data['id'] . "' ");
									$data3 = mysql_fetch_assoc($q3);
									if ($data['status'] == 4)
										$paid = (-$data3['paid']);
									else
										$paid = $data3['paid'];
									if ($paid) echo bfn($paid);
									else echo "0";
									?>
								</td>
							</tr>
							<?php
							$due = $gt - $data['discount'] - $paid;
							if ($due) {
							?>
								<tr>
									<th colspan='3' class='l'>
										Remaining Due
									</th>
									<td class='r'>
										<?php
										echo bfn($due);
										?>
									</td>
								</tr>
							<?php } else {
							?>
								<tr>
									<th colspan='4'>
										<i class='green'>Fully Paid</i>
										<input type="hidden" name="fully_paid" value="1" />
									</th>
								</tr>
							<?php
							}

							?>
					<?php
						}
					}
					include("inc/sell_inputs.php");
					?>
				</table>
			</form>
			<br />
			<br />
<?php
		}
	} else {
		echo "<h3><i class='blue'>No records Found.</i></h3>";
	}
}
?>