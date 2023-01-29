<h1>Other</h1>
<div id="bigmenu">
	<a href="index.php?page=mail">Mail</a>
	<a href="index.php?page=security">Security</a>
	<?if($soft&&($logeduserlevel==1)){?>
		<a href="index.php?page=clear">Clear Transactions</a>
		<a href="index.php?page=user">User</a>
	<?}?>
</div>