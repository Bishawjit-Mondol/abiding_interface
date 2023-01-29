<?if($soft&&($logeduserlevel==1)){?>
	<table class="structured">
		<tr>
			<td width="400px">
				<h1>Add User</h1>
				<?
					if($_POST[$sc.'submit']){
						if($_POST['nu_id']&&$_POST['nu_pass']&&$_POST['level'])
						{
							$q=mysql_query("INSERT INTO user VALUES('','".mysql_escape_string($_POST['nu_id'])."','".mysql_escape_string(md5($_POST['nu_id']))."','".mysql_escape_string(md5($_POST['nu_pass']))."','".mysql_escape_string($_POST['level'])."')");
							if($q)
							{
								echo "<h3 class='green'>New User Added.</h3>";
							}
							else
							{
								echo "<h3 class='red'>Could not add new user.</h3>";
							}
						}
						else
						{
							echo "<h3 class='red'>Please Select proper options and fill all Fields.</h3>";
						}
					}
				?>
				<form method='POST'>
				    <table class="formaligner" align="center">
						<tr>
							<td>
								ID :
							</td>
							<td>
								<input type='text' name='nu_id'/>
							</td>
						</tr>
						<tr>
							<td>
								Password :
							</td>
							<td>
								<input type='password' name='nu_pass'/>
							</td>
						</tr>
						<tr>
							<td>
								Type :
							</td>
							<td>
								<select name='level'>
									<option></option>
									<option value='1'>Admin</option>
									<?if($soft){?><option value='2'>Operator</option><?}?>
									<option value='3'>Website Editor</option>
								</select>
							</td>
						</tr>
						<tr>
							<th colspan='2'><input type="submit" name="<?php echo $sc;?>submit" value="Change ID" onClick="showloading();"></th>
						</tr>
					</table>
				</form>
		  </td>
		</tr>
	</table>
<?}?>