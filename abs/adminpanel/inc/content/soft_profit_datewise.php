<?if($soft&&($logeduserlevel==1)){?>
<h1>Datewise Profit</h1>
<?php
	include("inc/double_date.php");
	$ob=opening_balance($date1);
?>
	<table class="rb">
		<tr>
			<th class='l' width='300px' colspan='3'>Opening Balance of <?=dateconvert($date1);?></th>
			<th class='r'><?=bfn($ob)?></th>
		<tr>
				<?
			$q=mysql_query("SELECT * FROM payments WHERE date between '".$date1."' AND '".$date2."' ORDER BY date");
			if($q)
			{
				$ggt=$ob;
				$num=mysql_num_rows($q);
				if($num>0)
				{
					echo "<tr>";
						echo "<th>Date</th>";
						echo "<th>Sells ID</th>";
						echo "<th>Amount</th>";
						echo "<th>Balance</th>";
					echo "</tr>";
					while($data=mysql_fetch_assoc($q)){
						$ggt=$ggt+$data['amount'];
						echo "<tr>";
							echo "<th class='l'><a href='index.php?page=soft_sell_individual&&sells_id=".$data['sells_id']."'>".dateconvert($data['date'])."</a></th>";
							echo "<td><a href='index.php?page=soft_sell_individual&&sells_id=".$data['sells_id']."'>".$data['sells_id']."</a></td>";
							echo "<td class='r'><a href='index.php?page=soft_sell_individual&&sells_id=".$data['sells_id']."'>".bfn($data['amount'])."</a></td>";
							echo "<td class='r'>".bfn($ggt)."</td>";
						echo "</tr>";
					}
				}
			}
		?>
		<tr>
			<th class='l' colspan='3'>Closing Balance of <?=dateconvert($date2);?></th>
			<td class='r'><?=bfn($ggt)?></td>
		<tr>
		<tr>
			<?
				$profit=$ggt-$ob;
				if($profit>=0)
					echo "
						<th class='l' colspan='3'>Profit : </th>
						<th class='r'>".bfn($profit)."</th>
					";
				else
					echo "
						<th class='l' colspan='3'>Loss : </th>
						<th class='r'>".bfn($profit)."</th>
					";
			?>
			
		<tr>
	</table>
<?}?>