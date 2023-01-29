<?if($soft&&($logeduserlevel==1)){?>
<h2>Mail Settings</h2>
<?php
	if($_POST[$sc.'submit']){
		$admin_email=$_POST['admin_email'];
		if($admin_email){
			$q=update_fixedtext(5,$admin_email);
		}
		include("inc/q_check.php");
	}
	else{
       $say=null;	
	}
	include("inc/message.php");
	$admin_email=get_fixedtext(5);
?>
<table class="structured">
  <tr>
	<td>
	<form method="POST">
		<table class="formaligner">
			<tr>
				<td>Email Receiver : </td><td><input type="text" name="admin_email" value="<?php echo $admin_email;?>"></td>
			</tr>
			<tr>
				<br/>
				<th colspan='2'><input type="submit" name="<?php echo $sc;?>submit" value="Save Changes" onClick="showloading();"/><th>
			</tr>
		</table>
	</form>
	</td>
  </tr>
</table>
<?}?>

