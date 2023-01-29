<?php
	if($q)
	{
		$ggt=0;
		$num=mysql_num_rows($q);
			if($num>0){
				echo "<table class='rb' align='center'>";
					echo "<tr>";
						echo "<th>Date</th>";
						echo "<th>Sells ID</th>";
						echo "<th>Amount</th>";
					echo "</tr>";
					while($data=mysql_fetch_assoc($q)){
						echo "<tr>";
							echo "<th><a href='index.php?page=soft_sell_individual&&sells_id=".$data['sells_id']."'>".dateconvert($data['date'])."</a></th>";
							echo "<td><a href='index.php?page=soft_sell_individual&&sells_id=".$data['sells_id']."'>".$data['sells_id']."</a></td>";
							echo "<td class='r'><a href='index.php?page=soft_sell_individual&&sells_id=".$data['sells_id']."'>".bfn($data['amount'])."</a></td>";
						echo "</tr>";
						$ggt=$ggt+$data['amount'];
					}
					echo "<tr>";
						echo "<th colspan='2' class='l'>Total Amount : </th>";
						echo "<th class='r'>".bfn($ggt)."</th>";
					echo "</tr>";
				echo "</table>";
			}
	}
?>