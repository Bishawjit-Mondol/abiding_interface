<ul>
	<?if($soft&&(($logeduserlevel==1)||($logeduserlevel==2)))
	{
	?>
	<li>
		<a href="index.php">Home</a>
	</li>

	<li>
		<a href="index.php?page=soft">Soft</a>
		<ul>
			<li>
				<a href="index.php?page=soft_purchase">Purchase<img src="images/arrow.png" alt=">"></a>
				<ul>
					<li><a href="index.php?page=soft_purchase_new">New</a></li>
					<li><a href="index.php?page=soft_purchase_daily">Daily Purchase</a></li>
					<li><a href="index.php?page=soft_purchase_datewise">Date-wise Purchase</a></li>
					<li><a href="index.php?page=soft_purchase_search">Purchase Search</a></li>
				</ul>
			</li>
			<li>
				<a href="index.php?page=soft_sell">Sell<img src="images/arrow.png" alt=">"></a>
				<ul>
					<li><a href="index.php?page=soft_sell_new">New</a></li>
					<li><a href="index.php?page=soft_sell_order">Orders</a></li>
					<li><a href="index.php?page=soft_sell_dues">Receivables</a></li>
					<li><a href="index.php?page=soft_sell_daily">Daily Sell </a></li>
					<li><a href="index.php?page=soft_sell_datewise">Date-wise Sell</a></li>
					<li><a href="index.php?page=soft_sell_search">Sell Search</a></li>
				</ul>
			</li>
			<li>
				<a href="index.php?page=soft_stock">Stock<img src="images/arrow.png" alt=">"></a>
				<ul>
					<li><a href="index.php?page=soft_stock_current">Current Stock</a></li>
					<li><a href="index.php?page=soft_stock_daily">Daily Stock</a></li>
					<li><a href="index.php?page=soft_stock_datewise">Date-wise Stock</a></li>
				</ul>
			</li>
			<li>
				<a href="index.php?page=soft_revenue">Revenue<img src="images/arrow.png" alt=">"></a>
				<ul>
					<li><a href="index.php?page=soft_revenue_daily">Daily Revenue</a></li>
					<li><a href="index.php?page=soft_revenue_datewise">Date-wise Revenue</a></li>
					<li><a href="index.php?page=soft_revenue_manual">New Revenue</a></li>
				</ul>
			</li>
			<li>
				<a href="index.php?page=soft_expenses">Expenses<img src="images/arrow.png" alt=">"></a>
				<ul>
					<li><a href="index.php?page=soft_expenses_daily">Daily Expenses</a></li>
					<li><a href="index.php?page=soft_expenses_datewise">Date-wise Expenses</a></li>
					<li><a href="index.php?page=soft_expenses_manual">New Expenses</a></li>
				</ul>
			</li>
			<?if($soft&&($logeduserlevel==1)){?>
			<li>
				<a href="index.php?page=soft_profit">Profit<img src="images/arrow.png" alt=">"></a>
				<ul>
					<li><a href="index.php?page=soft_profit_daily">Daily Profit</a></li>
					<li><a href="index.php?page=soft_profit_datewise">Date-wise Profit</a></li>
				</ul>
			</li>
			<?php
				$q=mysql_query("SELECT * FROM page WHERE pagetype_id='3' ORDER BY priority");
				while($data=mysql_fetch_assoc($q))
				{
					if($data['pagetype_id']>(-1)) echo "<li><a href='index.php?page=".$data['page']."'>".rep_br_sp($data['visual'])."</a></li>";
				}
			?>
			<?}?>
		</ul>
	</li>
	<?
	}?>
	<li>
		<a href="index.php?page=edit">Website</a>
		<ul>		
			<li>
				<a href="index.php?page=home_edit">Edit Home</a>
			</li>
		<?php
			$q=all_data("page","priority");
			while($data=mysql_fetch_assoc($q))
			{
				if($data['pagetype_id']>(-1)) echo "<li><a href='index.php?page=".$data['page']."'>Edit ".rep_br_sp($data['visual'])."</a></li>";
			}
		?>
			<li>		
				<a href="index.php?page=priority">Priority<?if($soft){?><img src="images/arrow.png" alt=">"><?}?></a>
				<?if($soft){?>
				<ul>
					<li><a href="index.php?page=page_priority">Page Priority</a></li>
					<?php
							$q=all_data("page","priority");
							while($data=mysql_fetch_assoc($q))
							{
								if($data['pagetype_id']>=0)
									echo "<li><a href='index.php?page=".$data['page']."&&p=priority'>".rep_br_sp($data['visual'])." Priority</a></li>";
							}
					?>
				</ul>
				<?}?>
			</li>
		</ul>
	</li>	
	<li>
		<a href="index.php?page=other">Other</a>
		<ul>
			<li>
				<a href="index.php?page=mail">Mail<img src="images/arrow.png" alt=">"></a>
				<ul>
					<li><a href="index.php?page=mail_check">Check Mail</a></li>
					<?if($soft&&($logeduserlevel==1)){?><li><a href="index.php?page=mail_set">Mail Settings</a></li><?}?>
				</ul>
			</li>
			<li>
				<a href="index.php?page=security">Security<img src="images/arrow.png" alt=">"></a>
				<ul>
					<li><a href="index.php?page=change_id">Change ID</a></li>
					<li><a href="index.php?page=change_pass">Change Password</a></li>
				</ul>
			</li>
		<?if($soft&&($logeduserlevel==1)){?>
			<li>
				<a href="index.php?page=user">User<img src="images/arrow.png" alt=">"></a>
				<ul>
					<li><a href="index.php?page=user_add">Add User</a></li>
					<li><a href="index.php?page=user_status">Change User Status</a></li>
				</ul>
			</li>
		<?}?>
		<?if($soft&&($logeduserlevel==1)){?>
			<li>
				<a href="index.php?page=clear">Clear Transactions</a>
			</li>
		<?}?>
		</ul>
	</li>
</ul>
<ul class="isolated">
	<li><a href="logout.php">Logout  <img src="images/cross.gif" align="middle" alt="X" width="15px"/></a></li>
	<?if($soft&&(($logeduserlevel==1)||($logeduserlevel==2))){?><li><a onclick="printpage()">Print</a></li><?}?>
</ul>