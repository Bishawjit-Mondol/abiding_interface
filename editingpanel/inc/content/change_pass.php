<h1>Change Password</h1>
	<table class="structured">
		<tr>
		  <td width="600px">
			<?php
				if($_POST[$sc.'submit']){
					if($_POST['pre_id']&&$_POST['pre_pass']&&$_POST['new_pass_1']&&$_POST['new_pass_2']){
					   $pre_id=md5($_POST['pre_id']);
					   $pre_pass=md5($_POST['pre_pass']);
					   $new_pass_1=$_POST['new_pass_1'];
					   $new_pass_2=$_POST['new_pass_2'];
					   $real_pass=file_get_contents("inc/security/p.php");
					   $real_id=file_get_contents("inc/security/i.php");
						if(($new_pass_1!=$new_pass_2)||($pre_id!=$real_id)){
							$say=5;
						}
						elseif($pre_pass!=$real_pass){
							$say=4;
						}
						else{		
							$q=fwrite(fopen("inc/security/p.php",w),md5($new_pass_2));
							if(!$q){
								$say=3;
							}
							else{
								$_SESSION[pass]=md5($new_pass_2);
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
				else{
					echo "<h3 class='blue'>Please fill all fields to Change Password</h3>";
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
								New Password :
							</td>
							<td>
								<input type='password' name='new_pass_1'/>
							</td>
						</tr>
						<tr>
							<td>
								Re-type :
							</td>
							<td>
								<input type='password' name='new_pass_2'/>
							</td>
						</tr>
						<tr>
							<th colspan='2'><input type="submit" name="<?php echo $sc;?>submit" value="Change Password" onClick="showloading();"></th>
						</tr>
					</table>
				</form>
		  </td>
		</tr>
	</table>
