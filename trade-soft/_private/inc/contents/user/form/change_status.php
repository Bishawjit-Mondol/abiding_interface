<br />
<?php $user = $qur->custom_select_query("SELECT iduser,name,level,status FROM ___users WHERE iduser != '".$idstaff."'"); ?>

<table border='1px' class='rb'>
<?php
foreach($user as $u){
	echo "<form method = 'post'><input type='hidden' name = 'id' value = '".$u[0]."'/><tr><td>".$u[1]."</td>"."<td>".($u[2]==1?"Administrator":"DEO")."</td>"."<td><input type = 'submit' name = 'ab' value = '".($u[3]==1 ? "Disable" : "Enable")."'/></td></tr></form>";
}
?>
</table>
