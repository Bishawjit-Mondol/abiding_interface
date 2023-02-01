<tr class='notforprint'>
	<th colspan='4'>
		<?php
		if ($due > 0 && $data['status'] == 4) {
		?>
			Give Payment :
			<input type="number" name="paying" value='<?= $_POST['paying'] ?>' />
			<input type="hidden" name="due" value='<?= $due ?>' />
			<input type="submit" name="<?php echo $sc; ?>submit" value="Give Payment" onClick="showloading();" />

		<?php
		} elseif ($due > 0) {
		?>
			Receive Payment :
			<input type="number" name="paying" value='<?= $_POST['paying'] ?>' />
			<input type="hidden" name="due" value='<?= $due ?>' />
			<input type="submit" name="<?php echo $sc; ?>submit" value="Receive Payment" onClick="showloading();" />
		<?php }
		if (($data['status'] == 2) || ($data['status'] == 0)) {
		?>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" name="<?php echo $sc; ?>submit" value="Just Close Deal" onClick="showloading();" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<?php
		}
		if (($data['status'] == 0)) {
		?>
			<input type="submit" name="<?php echo $sc; ?>submit" value="Delivered" onClick="showloading();" />
		<?php
		}
		if ($soft && ($logeduserlevel == 1)) {
		?>
			<input type="submit" name="<?php echo $sc; ?>submit" value="Delete" onClick="showloading();" />
		<?php
		}
		?>
		&nbsp;&nbsp;&nbsp;
		<a href="index.php?page=soft_sell_new&&customer=<?= $data['customer']; ?>" class='button'>New Sell</a>
		<a href="index.php?page=soft_purchase_new&&customer=<?= $data['customer']; ?>" class='button'>New Purchase</a>
	</th>
</tr>