<h1>Home Slide show &amp; Intro </h1>
<?php
    if($_POST[$sc.'submit'])
	{
		$company=htmlentities($_POST['company']);
		$home_heading=htmlentities($_POST['home_heading']);
		$home_intro=htmlentities($_POST['home_intro']);
		$slogan=htmlentities($_POST['slogan']);
		if($company){
			$q=update_fixedtext(1,$company);
			if($q){
				$q=update_fixedtext(2,$home_heading);
				if($q){
					$q=update_fixedtext(3,$home_intro);
					if($q){
						$q=update_fixedtext(6,$slogan);
					}
				}
			}
			include("inc/q_check.php");
		}
		elseif($_FILES["newimage"]["name"]&&$_POST['caption']){
			$caption=htmlentities($_POST["caption"]);
			$link=$_POST["link"];
			$fileerror=$_FILES["newimage"]["error"];
			if(!$fileerror){
				$filetype = $_FILES["newimage"]["type"];
				$imgtype_id=null;
				$qft=mysql_query("SELECT * FROM imgtype");
				while($data=mysql_fetch_assoc($qft)){
					if($filetype==$data['phpcheck']){
						$imgtype_id=$data['id'];
						$imgtype=$data['imgtype'];					
					}
				}
				$filesize = $_FILES["newimage"]["size"];
				if(($imgtype_id!=null)&&($filesize<500000)){
					$filetempname = $_FILES["newimage"]["tmp_name"];
					$q=mysql_query("INSERT INTO img VALUES('','$caption','0','0','$imgtype_id','$link','0','100')");
					$img_id=mysql_insert_id();
					$url=$img_id.$imgtype;
					if($q){
						$q=move_uploaded_file($filetempname,"../images/db/$url"); 
						if($q){
							$say=2;
							$_SESSION[sc]=++$sc;
						}
					}
					else{
						$say=3;
					}
				}
				else{
					$say=5;
				}
			}
			else{
				$say=4;
			}
        }
		elseif($_POST['image_id_r']){
			$img_id=$_POST['image_id_r'];
			$url=imgurl_by_id($img_id);
			if(file_exists($url))
			{
			   $delete=unlink($url);
			}
			$q=mysql_query("DELETE FROM img WHERE id='$img_id'");
			include("inc/q_check.php");
        }
		elseif($_POST['priority_change']){
			$q=1;
			$q_c=mysql_query("SELECT id, priority FROM img WHERE page_id='0' AND text_data_id='0' ORDER BY priority");
			mysql_query("START TRANSACTION");
			while($data_c=mysql_fetch_assoc($q_c)){
				if($data_c['priority']!=$_POST['priority_'.$data_c['id']])
				{
					if($q)
					{
						$q=mysql_query("UPDATE  img SET priority='".$_POST['priority_'.$data_c['id']]."' WHERE id='".$data_c['id']."'");
					}
				}
			}
			if($q){
					mysql_query("COMMIT");
			}
			else{
					mysql_query("ROLLBACK");
			}
			include("inc/q_check.php");
		}
		elseif($_POST[$sc.'submit']=="Save Features")
		{
			$qf=mysql_query("SELECT * FROM featured ORDER BY id");
			if(mysql_num_rows($qf))
			{
				mysql_query("START TRANSACTION");
				while($df=mysql_fetch_assoc($qf))
				{
					$f_id=$df['id'];
					$old_text_data_id=$df['text_data_id'];
					$new_text_data_id=$_POST['text_data_id_'.$f_id];
					if($old_text_data_id!=$new_text_data_id)
					{
						$q=mysql_query("UPDATE featured SET text_data_id='".$new_text_data_id."' WHERE id='".$f_id."'");
					}
				}
				if($q)
				{
					mysql_query("COMMIT");
				}
				else
				{
						mysql_query("ROLLBACK");
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
	$company=get_fixedtext(1);
	$home_heading=get_fixedtext(2);
	$home_intro=get_fixedtext(3);
	$domain=get_fixedtext(4);
	$slogan=get_fixedtext(6);
?>
<a class="button" onClick="showit(0)">Slide Show</a>
<a class="button" onClick="showit(1)">Slide Show Priority</a>
<a class="button" onClick="showit(2)">Introduction</a>
<a class="button" onClick="showit(3)">Set Feature</a>
<div id="sud0">
	<table class="structured">
		<tr>
		  <td colspan="2">
				<h4>Add Slide Show Image</h4>
					<form method="POST" enctype="multipart/form-data">
					<table class="formaligner" align="center">
						<tr>
							<td>
								Image : 
							</td>
							<td>
								<input type="file" name="newimage"/>
								<br/><small>Size : 955px X 318px (JPG, GIF or PNG)</small>
							</td>
						</tr>
						<tr>
							<td>
								Caption : 
							</td>
							<td>
								<input type="text" name="caption"/>
							</td>
						</tr>
						<tr>
							<td>
								Link : 
							</td>
							<td>
								<input type="text" name="link"/>
								<br/><small class="red">Optional</small>
							</td>
						</tr>
						<tr>
						  <th colspan="2">
							<input type="submit" name="<?php echo $sc;?>submit" value="Add  Image" onClick="showloading();"/>
						  </th>
						</tr>
					</table>
					</form>
		  </td>
		</tr>
		<tr>
			<td>
				<h4>Edit Slide Show Image</h4>
				<form method="POST" action="index.php?page=common_edit_image">
								<select name="img_id">
									<?php
										    $q2=mysql_query("SELECT id, caption FROM img WHERE page_id='0' AND text_data_id='0' ORDER BY priority DESC");
											while($data2=mysql_fetch_assoc($q2))
											{
												echo "<option value='".$data2['id']."'>".$data2['caption']."</option>";
											}
									?>
								</select>
								<br/>
								<br/><input type="submit" name="submit" value="Edit Image" onClick="showloading();"/>
				</form>
		  </td>
			<td>
				<h4>Reomove Slide Show Image</h4>
				<form method="POST">
								<select name="image_id_r">
									<?php
										    $q2=mysql_query("SELECT id, caption FROM img WHERE page_id='0' AND text_data_id='0' ORDER BY priority DESC");
											while($data2=mysql_fetch_assoc($q2))
											{
												echo "<option value='".$data2['id']."'>".$data2['caption']."</option>";
											}
									?>
								</select>
								<br/>
								<br/><input type="submit" name="<?php echo $sc;?>submit" value="Remove <?php echo $page_visual;?> Image" onClick="showloading();"/>
				</form>
			</td>
		</tr>
	</table>
</div>
<div id='sud1'>	
	<table class="structured">
		<tr>
			<td colspan="2">
				<form method="POST">
					<h4>Set Priority</h4>
					<table align='center' class='formaligner'>
						<tr><th>Slide Show Images</th><th>Priority</th></tr>
							<?php
								$q2=mysql_query("SELECT id, caption, priority FROM img WHERE page_id='0' AND text_data_id='0' ORDER BY priority DESC");
								while($data2=mysql_fetch_assoc($q2))
								{
									echo "<tr>";
										echo "<td>".$data2['caption']."</td>";
										echo "<td>";
												echo "<select name='priority_".$data2['id']."'>";
													for($i=1;$i<101;$i++)
													{
														echo "<option value='".$i."'";
														if($data2['priority']==$i)
															echo "selected='selected'";
														echo ">".$i." % </option>";
													}
												echo "</select>";
										echo "</td>";
									echo "</tr>";
								}
							?>
						<tr>
							<th colspan="2">
								<input type="hidden" name="priority_change" value="ok">
								<input type="submit" name="<?=$sc?>submit" value="Save Priority Changes" onClick="showloading();">
							</th>
						</tr>
					</table>
				</form>
		  </td>
		</tr>
	</table>
</div>
<div id="sud2">
	<table class="structured">	
		<tr>
		  <td colspan="2">
					<h4>Editing Introduction</h4>
				    <form method="POST">
				    <table class="formaligner" align="center">
						<tr>
							<td>
								Website Title :
							</td>
							<td>
								<input type="text" name="company" value="<?php echo stripslashes($company);?>"/>
							</td>
						</tr>
						<tr>
							<td>
								Slogan :
							</td>
							<td>
								<input type="text" name="slogan" value="<?php echo stripslashes($slogan);?>"/>
							</td>
						</tr>
						<tr>
							<td>
								Home Heading :
							</td>
							<td>
								<textarea name="home_heading" rows="2px" cols="40px"><?php echo stripslashes($home_heading);?></textarea>
							</td>
						</tr>
							<tr>
							<td>
								Home Main Article :
							</td>
							<td>
								<textarea name="home_intro" rows="10px" cols="80px"><?php echo stripslashes($home_intro);?></textarea>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" name="<?php echo $sc;?>submit" value="Save Changes" onClick="showloading();"/>
							</th>
						</tr>
					</table>
					</form>
		  </td>
		</tr>
	</table>
</div>

<div id="sud3">
	<table class="structured">
		<tr>
			<td>
				<h4>Set Articles as Feature</h4>
				<?
					$qf=mysql_query("SELECT featured.*, text_data.heading FROM featured LEFT JOIN text_data ON (text_data.id=featured.text_data_id) ORDER BY id");
					$qtd=mysql_query("SELECT id, heading FROM text_data");
					if(mysql_num_rows($qf)&&mysql_num_rows($qtd))
					{	
						$td_oprions="";
						while($dtd=mysql_fetch_assoc($qtd))
						{
							$td_oprions=$td_oprions."<option value='".$dtd['id']."'>".$dtd['heading']."</option>";;
						}
						echo "
						<form method='POST'>
							<table class='formaligner' align='center'>";
							while($df=mysql_fetch_assoc($qf))
							{								
								echo "<tr>
									<td>Featured ".$df['id']."</td>
									<td>
										<select name='text_data_id_".$df['id']."'>
										<option value='".$df['text_data_id']."'>".$df['heading']."</option>
										".$td_oprions."
										</select>
									</td>
								</tr>";
							}
						echo "
							<tr><th colspan='2'><input type='submit' value='Save Features' name='".$sc."submit'></th></tr>
							</table>
						</form>"; 
					}
				?>
			</td>
		</tr>
	</table>
</div>

<br/><img src="images/blank1by1.gif"  alt="Blank" onload="hideAllButZero(4)" width="0px">
<?php
	if($_POST[$sc.'submit'])
	{
		$submit_ck=$_POST[$sc.'submit'];
	}
	else
	{
		$scmin=$sc-1;
		$submit_ck=$_POST[$scmin.'submit'];
	}	
	if($submit_ck)
	{
		if($submit_ck=="Save Priority Changes")
		{
			echo "<img src='images/blank1by1.gif'  alt='Blank' onload='showit(1)' width='0px'>";
		}
		elseif($submit_ck=="Save Changes")
		{
			echo "<img src='images/blank1by1.gif'  alt='Blank' onload='showit(2)' width='0px'>";
		}
		elseif($submit_ck=="Save Features")
		{
			echo "<img src='images/blank1by1.gif'  alt='Blank' onload='showit(3)' width='0px'>";
		}
	}
?>