<?php
    if($_POST[$sc.'submit']){
			
		$slides=$_POST["slides"];
		$career=$_POST["career"];
		$contact=$_POST["contact"];
		$management=$_POST["management"];
		$units=$_POST["units"];
		if($_POST['caption']&&($slides||$career||$contact||$management||$units)){
		
			$description=mysql_real_escape_string($_POST["description"]);
			$caption=mysql_real_escape_string($_POST["caption"]);
			$link=mysql_real_escape_string($_POST["link"]);
			
			$imgtype_id=1;
			
			$priority=99;
			
			$image_ok=1;
			
			if($_FILES["newimage".$i]["name"])
			{
				$fileerror=$_FILES["newimage".$i]["error"];
				if(!$fileerror){
					$filetype = $_FILES["newimage".$i]["type"];
					$imgtype_id=null;
					$qft=mysql_query("SELECT * FROM imgtype");
					while($data=mysql_fetch_assoc($qft)){
						if($filetype==$data['phpcheck']){
							$imgtype_id=$data['id'];
							$imgtype=$data['imgtype'];					
						}
					}
					$filesize = $_FILES["newimage".$i]["size"];
					if(($imgtype_id!=null)&&($filesize<5000000)){
						$filetempname = $_FILES["newimage".$i]["tmp_name"];
						$image_ok=1;
					}
					else{
						$say=5;
						$image_ok=0;
					}
				}
				else{
					$say=4;
					$image_ok=0;
				}
			}
			if($image_ok)
			{
				mysql_query("START TRANSACTION");
				$q=mysql_query("INSERT INTO img VALUES('','".$caption."','".$description."','".$imgtype_id."','".$link."','".$priority."')");
				$img_id=mysql_insert_id();
				

				if($q&&$slides){$q=mysql_query("INSERT INTO slides VALUES('".$img_id."')");}
				if($q&&$career){$q=mysql_query("INSERT INTO career VALUES('".$img_id."')");}
				if($q&&$contact){$q=mysql_query("INSERT INTO contact VALUES('".$img_id."')");}
				if($q&&$management){$q=mysql_query("INSERT INTO management VALUES('".$img_id."')");}
				if($q&&$units){$q=mysql_query("INSERT INTO units VALUES('".$img_id."')");}
				
				if($q&&$imgtype)
				{
					$url=$img_id.$imgtype;
					if($q){
						$q=move_uploaded_file($filetempname,"../images/db/$url"); 
					}
					else
					{
						$say=3;
					}
				}
				
				if($q)
				{
					mysql_query("COMMIT");
					$say=2;
				}
				else
				{
					mysql_query("ROLLBACK");
					if(!$image_ok) $say=3;
				}
				
				include("inc/q_check.php");
			}
		}
		else{
			$say=1;
		}
	}
	else{
       $say=null;	
	}
	include("inc/message.php");
?>
	<table class="structured">
		<tr>
		  <td colspan="2">
				<h4>Add new post</h4>
					<form method="POST" enctype="multipart/form-data">
					<table class="formaligner" align="center">
						<tr>
							<td>
								Heading : 
							</td>
							<td>
								<input type="text" name="caption" value="<?php echo stripslashes($_POST['caption']);?>"/>
							</td>
						</tr>
						<tr>
							<td>
								Description :
							</td>
							<td>
								<textarea name="description" rows="5px" cols="20px"><?php echo stripslashes($_POST['description']);?></textarea>
							</td>
						</tr>
						<tr>
							<td>
								Show in : 
							</td>
							<td>
								<input type="checkbox" name="slides" value="slides" checked="1">Slides
								&nbsp;&nbsp;&nbsp;<input type="checkbox" name="units" value="units">Units
								&nbsp;&nbsp;&nbsp;<input type="checkbox" name="career" value="career">Career
								<br/><input type="checkbox" name="management" value="management">Management
								&nbsp;&nbsp;&nbsp;<input type="checkbox" name="contact" value="contact">Contact
							</td>
						</tr>
						<tr>
							<td>
								Image : 
							</td>
							<td>
								<input type="file" name="newimage"/>
							</td>
						</tr>
						<tr>
							<td>
								Link : 
							</td>
							<td>
								<input type="text" name="link" value="<?php echo $_POST['link'];?>"/><small class="red">Optional</small>
							</td>
						</tr>
						<tr>
						  <th colspan="2">
							<input type="submit" name="<?php echo $sc;?>submit" value="Add Post" onClick="showloading();"/>
						  </th>
						</tr>
					</table>
					</form>
		  </td>
		</tr>
	</table>