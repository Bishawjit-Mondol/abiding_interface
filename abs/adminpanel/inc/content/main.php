<div id="bigmenu">
	<table class="rb">
		<tr>
			<?if($soft&&(($logeduserlevel==1)||($logeduserlevel==2))){?>
			<th>
				<h1>Software</h1>
					<a href="index.php?page=soft_purchase">Purchase</a>
					<a href="index.php?page=soft_sell">Sell</a>
					<a href="index.php?page=soft_stock">Stock</a>
					<a href="index.php?page=soft_revenue">Revenue</a>
					<a href="index.php?page=soft_expenses">Expenses</a>
					<?if($soft&&($logeduserlevel==1)){?>
					<a href="index.php?page=soft_profit">Profit</a>
					<?}?>
				<h1>Security</h1>
					<a href="index.php?page=change_id">Change ID</a>
					<a href="index.php?page=change_pass">Change Password</a>
					<?if($soft&&($logeduserlevel==1)){?>
					<a href="index.php?page=clear">Clear Transactions</a>
					<?}?>
			</th>		
			<?}?>
			<th>
				<h1>Edit Website</h1>
						<a href="index.php?page=home_edit">Edit Home</a>
						<?php
							$q=all_data("page","priority");
							while($data=mysql_fetch_assoc($q))
							{
								if($data['pagetype_id']>(-1))  echo "<a href='index.php?page=".$data['page']."'>Edit ".rep_br_sp($data['visual'])."</a>";
							}
						?>
						<a href="index.php?page=page_priority">Edit Page Priority</a>
						<a href="index.php?page=priority">Content Priority</a>
				<h1>Mail</h1>
					<a href="index.php?page=mail_check">Check Mail</a>
					<?if($soft&&($logeduserlevel==1)){?><a href="index.php?page=mail_set">Mail Settings</a><?}?>
			</th>
		</tr>
		
		<tr>
			<?if($soft&&(($logeduserlevel==1)||($logeduserlevel==2))){?>
			<td>
				<h1>Opening Balance : <?echo $ob=bfn(opening_balance(date("Y-m-d")));?></h1>
				<h1>Closing Balance : <?echo $cb=bfn(closing_balance(date("Y-m-d")));?></h1>
				<h1>
					<?
							$profit=$cb-$ob;
							if($profit>0)
								echo "Profit : ".bfn($profit);
							elseif($profit<0)
								echo "Loss : ".bfn(-$profit);
							else
								echo "No apparent profit or loss recorded today.";
					?>
				</h1>
			</td>
			<?}?>
			<td>
				<center>
					<a href="logout.php">Logout  <img src="images/cross.gif" align="middle" alt="X" width="15px"/></a>
				<center>
			</td>
		</tr>
	</table>
</div>