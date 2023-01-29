<?if($soft&&($logeduserlevel==1)){?>
	<table class="structured">
		<tr>
			<td width="600px">
				<h2>Select user to change status</h2>
				<?
					if($_POST['edit']&&$_POST['user_id'])
					{
						if($_POST['edit']=="Admin") $level='1';
						elseif($_POST['edit']=="Operator") $level='2';
						elseif($_POST['edit']=="Site Editor") $level='3';
						elseif($_POST['edit']=="Suspend User") $level='0';
						$q=mysql_query("UPDATE user SET level='".$level."' WHERE id='".$_POST['user_id']."'");
						if($q)
						{
							$say=2;
						}
						else
						{
							$say=3;
						}
						include("inc/message.php");
					}
				?>
				<form method='POST'>
				    <table class="formaligner" align="center">
						<tr>
							<td>
								User :
							</td>
							<td>
								<select name='user_id'>
									<?
										$qu=mysql_query("SELECT id, user, level FROM user ORDER BY level DESC");
										while($qudata=mysql_fetch_assoc($qu))
										{
											if($qudata['level']==1) $type="Admin";
											elseif($qudata['level']==2) $type="Operator";
											elseif($qudata['level']==3) $type="Site Editor";
											elseif($qudata['level']==0) $type="Suspended";
											echo "<option value='".$qudata['id']."'>".$type." - ".$qudata['user']."</option>";
										}
									?>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								Change to :
							</td>
							<td>
								<input type="submit" name="edit" value="Site Editor" onClick="showloading();">
								<input type="submit" name="edit" value="Operator" onClick="showloading();">
								<br/>
								<input type="submit" name="edit" value="Admin" onClick="showloading();">
								<input type="submit" name="edit" value="Suspend User" onClick="showloading();">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
<?}?>