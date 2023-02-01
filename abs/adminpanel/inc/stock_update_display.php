<?php
	if($q)
	{
		$num=mysql_num_rows($q);
			if($num>0){
				echo "<h3>".$num." Records Found</h3>";
				echo "<table align='center' class='rb'>";
				echo "<tr><th>Date</th><th>Product</th><th>Entry</th><th>Exit</th><th>Method</th></tr>";
				while($data=mysql_fetch_assoc($q)){
					echo "<tr>
								<td>".dateconvert($data['date'])."</td>
								<td>".$data['heading']."</td>";
								if($data['stock']>0)
									echo "<td>".$data['stock']."</td><td></td>";
								elseif($data['stock']<0)
									echo "<td></td><td>".(-$data['stock'])."</td>";
								if($data['status']==0)
									echo "<td>Manual</td>";
								elseif($data['status']==1)
									echo "<td>Sold</td>";
								elseif($data['status']==2)
									echo "<td>Purchase</td>";
								elseif($data['status']==3)
									echo "<td>Sell Delete</td>";
								elseif($data['status']==4)
									echo "<td>Purchase Delete</td>";
								else
									echo "<td>Trade</td>";
					echo "</tr>";
				}
				echo "</table>";
			}
			else{
				echo "<h1>No Records Found</h1>";
			}
	}
