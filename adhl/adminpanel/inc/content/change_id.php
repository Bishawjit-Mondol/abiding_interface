<h1>Change ID</h1>
	<table class="structured">
		<tr>
		  <td width="600px">
			<?php
				if($_POST[$sc.'submit']){
					if($_POST['pre_id']&&$_POST['pre_pass']&&$_POST['new_id_1']&&$_POST['new_id_2']){
					   $pre_id=md5($_POST['pre_id']);
					   $pre_pass=md5($_POST['pre_pass']);
					   $new_id_1=$_POST['new_id_1'];
					   $new_id_2=$_POST['new_id_2'];
					   $real_id=$_SESSION[id];
					   $real_pass=$_SESSION[pass];
					   $exists=checkuser($new_id_1);
					   if($exists)
					   {
							$say=6;
					   }
					   elseif($new_id_1!=$new_id_2){
							$say=5;
						}
						elseif(($pre_id!=$real_id)||($pre_pass!=$real_pass)){
							$say=4;
						}
						else{		
							$q=mysql_query("UPDATE user SET user='".$new_id_1."' , enuser='".md5($new_id_1)."' WHERE enuser='".$real_id."' AND pass='".$real_pass."'");
							if(!$q){
								$say=3;
							}
							else{
								$_SESSION[id]=md5($new_id_1);
								$_SESSION[user]=$new_id_1;
								$say=2;
							}
						}			
					}
					else{
						$say=1;
					}
				}
				else{
				   $say=null;	
				}
				
				if($say==1){
					echo "<h3 class='red'>Please Select proper options and fill all Fields.</h3>";
				}
				elseif($say==2){
					echo "<h3 class='green'>Changes Saved.</h3>";
				}
				elseif($say==3){
					echo "<h3 class='red'>Could not save changes.</h3>";
				}
				elseif($say==4){
					echo "<h3 class='red'>Previous Data Miss-match.</h3>";
				}
				elseif($say==5){
					echo "<h3 class='red'>Retype Miss-match.</h3>";
				}
				elseif($say==6){
					echo "<h3 class='red'>ID :  ".$new_id_1." is already taken.</h3>";
				}
				else{
					echo "<h3 class='blue'>Please fill all fields to Change ID</h3>";
					echo "<h3 class='blue' id='loading'><img src='../images/loading.gif'></h3>";
				}
			?>

				<form method='POST'>
				    <table class="formaligner" align="center">
						<tr>
							<td>
								Previous ID :
							</td>
							<td>
								<input type='text' name='pre_id'/>
							</td>
						</tr>
						<tr>
							<td>
								Previous Password :
							</td>
							<td>
								<input type='password' name='pre_pass'/>
							</td>
						</tr>
						<tr>
							<td>
								New ID :
							</td>
							<td>
								<input type='text' name='new_id_1'/>
							</td>
						</tr>
						<tr>
							<td>
								Re-type New ID :
							</td>
							<td>
								<input type='text' name='new_id_2'/>
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
