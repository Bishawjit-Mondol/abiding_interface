<?php if ($soft) { ?>
	<a href="index.php">Home</a>
	<a href="index.php?page=soft">Soft</a>
<?php } ?>
<a href="index.php?page=edit">Site</a>
<a href="index.php?page=Other">Other</a>
<a href="logout.php">Logout <img src="images/cross.gif" align="middle" alt="X" width="10px" border="0px" /></a>
<br />
Loged in as
<?php
echo "<b>" . $logeduser . "</b> ";
if ($logeduserlevel == 1) {
	echo "(Admin)";
} elseif ($logeduserlevel == 2) {
	echo "(Soft Operator)";
} elseif ($logeduserlevel == 3) {
	echo "(Site Editor)";
}
?>
<br /> <small>Designed and developed by <a href="http://uniquewebers.com/" class="significant" target="_blank">Unique Webers</a></small>