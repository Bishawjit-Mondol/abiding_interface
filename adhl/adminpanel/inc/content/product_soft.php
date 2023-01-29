<h1>Editing <?php echo $page_visual;?></h1>
<?php
    if($_POST[$sc.'submit']){
		if($_POST['heading']&&$_POST['content']&&$_POST['category_id']){
			$heading=mysql_real_escape_string($_POST['heading']);
			$content=mysql_real_escape_string($_POST['content']);
			$category_id=htmlentities($_POST['category_id']);
			$price=htmlentities($_POST['price']);
			$p_price=htmlentities($_POST['p_price']);
			$hidden=$_POST['hidden'];
			$date=date("Y-m-d");
			if(is_numeric($_POST['i_stock']))
			{
				$i_stock=$_POST['i_stock'];
			}
			else
			{
				$i_stock=$_POST['i_stock'];
			}
			if(!$price) $price=0;
			$negotiable=htmlentities($_POST['negotiable']);
			$note=htmlentities($_POST['note']);
			mysql_query("START TRANSACTION");
			$q=mysql_query("INSERT INTO text_data VALUES('','$page_id','$heading','$content','50','$hidden')");
			$text_data_id=mysql_insert_id();
			for($i=1;$i<6;$i++)
			{
				if($q&&$text_data_id&&$_FILES["newimage".$i]["name"])
				{
					if($_POST["caption".$i])
					{
						$caption=$_POST["caption".$i];
					}
					else
					{
						$caption="View ".$i." of ".mysql_real_escape_string($_POST["heading"]);
					}
					$link=null;
					$border=0;
					$priority=100-$i;
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
						if(($imgtype_id!=null)&&($filesize<500000)){
							$filetempname = $_FILES["newimage".$i]["tmp_name"];
							$q=mysql_query("INSERT INTO img VALUES('','$caption','$page_id','".$text_data_id."','$imgtype_id','$link','$border','100')");
							$img_id=mysql_insert_id();
							$url=$img_id.$imgtype;
							if($q){
								$q=move_uploaded_file($filetempname,"../images/db/$url"); 
								if($q){
									$say=2;
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
			}
			if($q&&$text_data_id)
			{
				$q=mysql_query("INSERT INTO category_vs_text_data VALUES('','".$text_data_id."','$category_id')");
			}
			if($q&&$text_data_id)
			{
				$q=mysql_query("INSERT INTO price VALUES('".$text_data_id."','".$price."','".$p_price."','".$negotiable."','".$note."')");
			}
			if($q&&$text_data_id)
			{
				$q=mysql_query("INSERT INTO stock VALUES('".$text_data_id."','".$i_stock."')");
			}
			if($q&&$text_data_id)
			{
				$q=mysql_query("INSERT INTO stock_update VALUES('', '".$text_data_id."', '".$date."', '".$i_stock."','0')");
			}
			if($q&&$text_data_id)
			{
				mysql_query("COMMIT");
			}
			else
			{
					mysql_query("ROLLBACK");
			}
			include("inc/q_check.php");
		}
		elseif($_POST['text_data_id_r']){
			    $text_data_id=$_POST['text_data_id_r'];
				$img_details=mysql_query("SELECT id, imgtype_id FROM img WHERE page_id='".$page_id."' AND text_data_id='$text_data_id'");
				mysql_query("START TRANSACTION");
				$q=true;
				while($data=mysql_fetch_assoc($img_details)){
						$img_id=$data['id'];
						$img_url=imgurl_by_id($img_id);
						if(file_exists($img_url)&&$q)
						{
							$q=unlink($img_url);
						}
				}
				if($q)
				{
					$q=mysql_query("DELETE FROM img WHERE text_data_id='$text_data_id'");
				}
				if($q)
				{
					$q=mysql_query("DELETE FROM price WHERE text_data_id='$text_data_id'");
				}
				if($q)
				{
					$q=mysql_query("DELETE FROM category_vs_text_data WHERE text_data_id='$text_data_id'");
				}
				if($q)
				{
					$q=mysql_query("DELETE FROM a WHERE page_id='".$page_id."' AND text_data_id='$text_data_id'");
				}
				if($q)
				{
					$qd=mysql_query("SELECT id FROM download WHERE page_id='".$page_id."' AND text_data_id='$text_data_id'");
					while($ddata=mysql_fetch_assoc($qd))
					{
						$download_id=$ddata['id'];
						$url=downloadurl_by_id($download_id);
						if(file_exists($url))
						{
							$delete=unlink($url);
						}
					}
					$q=mysql_query("DELETE FROM download WHERE page_id='".$page_id."' AND text_data_id='$text_data_id'");
				}
				if($q)
				{
					$q=mysql_query("DELETE FROM stock WHERE text_data_id='$text_data_id'");
				}
				if($q)
				{
					$q=mysql_query("DELETE FROM text_data WHERE id='$text_data_id'");
				}
				if($q){
					mysql_query("COMMIT");
				}
				else{
					mysql_query("ROLLBACK");
				}
				include("inc/q_check.php");
		}
		elseif($_POST['text_data_id_i']&&$_FILES["newimage"]["name"]&&$_POST['caption']){
			$text_data_id=$_POST["text_data_id_i"];
			$caption=htmlentities($_POST["caption"]);
			$link=$_POST["link"];
			$border=$_POST["border"];
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
					$q=mysql_query("INSERT INTO img VALUES('','$caption','$page_id','$text_data_id','$imgtype_id','$link','$border','50')");
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
		elseif($_POST['text_data_id_a']&&$_POST['a']&&$_POST['visual']&&$_POST['comment']){
			$text_data_id=$_POST['text_data_id_a'];
			$a=$_POST['a'];
			$visual=htmlentities($_POST['visual']);
			$comment=htmlentities($_POST['comment']);
			$q=mysql_query("INSERT INTO a VALUES('','$a','$visual','$comment','$page_id','$text_data_id')");
			include("inc/q_check.php");
		}
		elseif($_POST['a_id_r']){
			$a_id=$_POST['a_id_r'];
			$q=mysql_query("DELETE FROM a WHERE id='$a_id'");
			include("inc/q_check.php");
		}
		elseif($_POST['text_data_id_d']&&$_FILES["newdownload"]["name"]&&$_POST['title']&&$_POST['description']){
		    $text_data_id=$_POST["text_data_id_d"];
			$title=htmlentities($_POST["title"]);
			$description=htmlentities($_POST["description"]);
			$fileerror=$_FILES["newdownload"]["error"];
			if(!$fileerror){
				$filetype = $_FILES["newdownload"]["type"];
				$downloadtype_id=null;
				$qft=mysql_query("SELECT * FROM downloadtype");
				while($data=mysql_fetch_assoc($qft)){
					if($filetype==$data['phpcheck']){
						$downloadtype_id=$data['id'];
						$downloadtype=$data['downloadtype'];					
					}
				}
				$filesize = $_FILES["newdownload"]["size"];
				if(($downloadtype_id!=null)&&($filesize<5000000000000000)){
					$filetempname = $_FILES["newdownload"]["tmp_name"];
					$q=mysql_query("INSERT INTO download VALUES('','$downloadtype_id','$title','$description','$page_id','$text_data_id')");
					$download_id=mysql_insert_id();
					$url=$download_id.$downloadtype;
					if($q){
						$q=move_uploaded_file($filetempname,"../download/db/$url"); 
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
		elseif($_POST['download_id_r']){
			$download_id=$_POST['download_id_r'];
			$url=downloadurl_by_id($download_id);
			if(file_exists($url))
			{
			   $delete=unlink($url);
			}
			$q=mysql_query("DELETE FROM download WHERE id='$download_id'");
			include("inc/q_check.php");
        }
		elseif($_POST['category']){
			$category=mysql_real_escape_string($_POST['category']);
			$q=mysql_query("INSERT INTO category VALUES('','".$category."','".$page_id."','100')");
			include("inc/q_check.php");
		}
		elseif($_POST['r_category']){
			$r_category=mysql_real_escape_string($_POST['r_category']);
			$q=mysql_query("DELETE FROM category WHERE id='".$r_category."'");
			include("inc/q_check.php");
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
<a class="button" onClick="showit(0)">Articles</a>
<a class="button" onClick="showit(1)">Images</a>
<a class="button" onClick="showit(2)">Links</a>
<a class="button" onClick="showit(3)">Files</a>
<a class="button" onClick="showit(4)">Category</a>
<a class="button" href="index.php?page=<?php echo $page;?>&&p=priority">Priority</a>
<a href="../index.php?page=<?php echo $page?>" class='button' target="_blank">Visit</a>
<div id="sud0">
	<table class="structured">
		<tr>
		  <td colspan="2">
				<h4>Add <?php echo $page_visual;?> Articles</h4>
							<form method="POST" enctype="multipart/form-data">
				    <table class="formaligner" align="center">
						<tr>
							<td>
								Title
							</td>
							<td>
								:
							</td>
							<td>
								<input type="text" name="heading" value="<?php echo stripslashes($_POST['heading']);?>"/>
										<select name='hidden'>
											<option value='0' <?if($hidden==0) echo "selected";?>>Display in Website</option>
											<option value='1' <?if($hidden==1) echo "selected";?>>Hidden in Website</option>
										</select>
							</td>
						</tr>
						<tr>
							<td>
								Price
							</td>
							<td>
								:
							</td>
							<td>
										<input type="text" name="price" value="<?php echo stripslashes($_POST['price']);?>"/>
										<select name='negotiable'>
											<option value='0'>Fixed</option>
											<option value='1'>Negotiable</option>
											<option value='2'>Contact For Price</option>
										</select>
										<input type="text" name="note" value="<?php echo stripslashes($_POST['note']);?>" placeholder='Note' />
							</td>
						</tr>
						<tr>
							<td>
								Purchase Price
							</td>
							<td>
								:
							</td>
							<td>
										<input type="text" name="p_price" value="<?php echo stripslashes($_POST['p_price']);?>"/>
							</td>
						</tr>
						<tr>
							<td>
								Category
							</td>
							<td>
								:
							</td>
							<td>
								<select name="category_id">
									<option></option>
									<?php
										$qcat=mysql_query("SELECT id, category FROM category WHERE page_id='$page_id'");
										while($datacat=mysql_fetch_assoc($qcat))
										{
											echo "<option value='".$datacat['id']."'";
												if($datacat['id']==$_POST['category']) echo "selected";
											echo ">".$datacat['category']."</option>";
										}
									?>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								Initial Stock
							</td>
							<td>
								:
							</td>
							<td>
								<input type="text" name="i_stock" value="<?php echo stripslashes($_POST['i_stock']);?>"/>
							</td>
						</tr>
						<tr>
							<td>
								Description
							</td>
							<td>
								:
							</td>
							<td>
								<textarea name="content" rows="8" cols="50"><?php echo stripslashes($_POST['content']);?></textarea>
							</td>
						</tr>
						<tr>
							<td>
								Images<small style='font-size:8;color:#888888;'>(Optional)</small> 
							</td>
							<td>
								:
							</td>
							<td>
								<?php 
									for($i=1;$i<6;$i++)
										echo "<input type='file' name='newimage".$i."'/>&nbsp&nbsp<input type='text' name='caption".$i."' placeholder='Caption'/><br/>";
								?>
							</td>
						</tr>
						<tr>
							<th colspan="3">
								<input type="submit" name="<?php echo $sc;?>submit" value="Add <?php echo $page_visual;?>" onClick="showloading();"/>
							</th>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
		  <td>
				<h4>Edit <?php echo $page_visual;?> Articles</h4>
				<form action="index.php?page=<?php echo $page;?>&&p=edit_soft" method="POST">
					<select name="text_data_id">
						<option></option>
						<?php
							$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
							while($data=mysql_fetch_assoc($q))
							{
								echo "<option value='".$data['id']."'>";
								for($i=0;$i<40;$i++)
								{
									echo $data['heading'][$i];
								}
								echo"...</option>";
							}
						?>
					</select>
					<br/>
					<br/><input type="submit" name="edit_text_data" value="Edit <?php echo $page_visual;?>"/>
				</form>
		  </td>
		  <td>
				<h4>Remove <?php echo $page_visual;?> Articles</h4>
				<form method="POST">
				    <select name="text_data_id_r">
						<option></option>
						<?php
							$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
							$c=0;
							while($data=mysql_fetch_assoc($q))
							{
								if(check_product_sell($data['id'])==0)
								{
									echo "<option value='".$data['id']."'>";
									for($i=0;$i<40;$i++)
									{
										echo $data['heading'][$i];
									}
									echo"...</option>";
									$c=1;
								}
							}
							if($c==0)
							echo "<option value='NULL'>No Removeable Items</option>";
						?>
					</select>
					<br/>
					<br/><input type="submit" name="<?php echo $sc;?>submit" value="Remove <?php echo $page_visual;?>" onClick="showloading();"/>
				</form>
		  </td>
		</tr>
	</table>
</div>
<div id="sud1">
	<table class="structured">
		<tr>
		  <td colspan="2">
				<h4>Add <?php echo $page_visual;?> Image</h4>
					<form method="POST" enctype="multipart/form-data">
					<table class="formaligner" align="center">
						<tr>
							<td>
								<?php echo $page_visual;?> : 
							</td>
							<td>
								<select name="text_data_id_i">
									<option></option>
									<?php
										$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
										while($data=mysql_fetch_assoc($q))
										{
											echo "<option value='".$data['id']."'>";
											for($i=0;$i<40;$i++)
											{
												echo $data['heading'][$i];
											}
											echo"...</option>";
										}
									?>
								</select>
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
								Caption : 
							</td>
							<td>
								<textarea name="caption" rows='5' cols='40'><?php echo stripslashes($_POST['caption']);?></textarea>
							</td>
						</tr>
						<tr>
							<td>
								Link : 
							</td>
							<td>
								<input type="text" name="link" value="<?php echo $_POST['link'];?>"/>
								<br/><small class="red">Optional</small>
							</td>
						</tr>
						<tr>
							<td>
								Border : 
							</td>
							<td>
								<select name="border">
									<option value="1">Bordered</option>
									<option value="0">No Border</option>
								</select>
							</td>
						</tr>
						<tr>
						  <th colspan="2">
							<input type="submit" name="<?php echo $sc;?>submit" value="Add <?php echo $page_visual;?> Image" onClick="showloading();"/>
						  </th>
						</tr>
					</table>
					</form>
		  </td>
		</tr>
		<tr>
		  <td>
				<h4>Edit Image</h4>
				<form method="POST" action="index.php?page=common_edit_image">
								<select name="img_id">
									<option></option>
									<?php
										$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
										while($data=mysql_fetch_assoc($q))
										{
										    $text_data_id=$data['id'];
											echo "<optgroup label='".$data['heading']."'>";
										    $q2=mysql_query("SELECT id, caption FROM img WHERE page_id='$page_id' AND text_data_id='$text_data_id'");
											while($data2=mysql_fetch_assoc($q2))
											{
												echo "<option value='".$data2['id']."'>";
														echo $data2['caption'];
												echo "</option>";
											}
											echo "</optgroup>";
										}
									?>
								</select>
								<br/><input type="hidden" name="page_id" value="<?php echo $page_id;?>"/>
								<br/><input type="submit" name="submit" value="Edit <?php echo $page_visual;?> Image" onClick="showloading();"/>
				</form>
		  </td>
		  <td>
				<h4>Reomove Image</h4>
				<form method="POST">
								<select name="image_id_r">
									<option></option>
									<?php
										$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
										while($data=mysql_fetch_assoc($q))
										{
										    $text_data_id=$data['id'];
											echo "<optgroup label='".$data['heading']."'>";
										    $q2=mysql_query("SELECT id, caption FROM img WHERE page_id='$page_id' AND text_data_id='$text_data_id'");
											while($data2=mysql_fetch_assoc($q2))
											{
												echo "<option value='".$data2['id']."'>";
													echo $data2['caption'];
												echo "</option>";
											}
											echo "</optgroup>";
										}
									?>
								</select>
								<br/>
								<br/><input type="submit" name="<?php echo $sc;?>submit" value="Remove <?php echo $page_visual;?> Image" onClick="showloading();"/>
				</form>
		  </td>
		</tr>
		<tr>
			<td colspan='2'>
				<h4>Set <?php echo $page_visual;?> Image Priority</h4>
				<form method="POST" action='index.php?page=image_priority'>
				    <select name="text_data_id">
						<option></option>
						<?php
							$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
							while($data=mysql_fetch_assoc($q))
							{
								echo "<option value='".$data['id']."'>";
								for($i=0;$i<40;$i++)
								{
									echo $data['heading'][$i];
								}
								echo"...</option>";
							}
						?>
					</select>
					<br/><input type="hidden" name="backpage" value="<?=$page?>"/>
					<br/><input type="submit" name="set" value="Set Priority" onClick="showloading();"/>
				</form>
		  </td>
		</tr>
	</table>
</div>
<div id="sud2">
	<table class="structured">
		<tr>
		  <td>
				<h4>Add <?php echo $page_visual;?> Link</h4>
					<form method="POST">
					<table class="formaligner" align="center">
						<tr>
							<td>
								<?php echo $page_visual;?> : 
							</td>
							<td>
								<select name="text_data_id_a">
									<option></option>
									<?php
										$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
										while($data=mysql_fetch_assoc($q))
										{
											echo "<option value='".$data['id']."'>";
											for($i=0;$i<40;$i++)
											{
												echo $data['heading'][$i];
											}
											echo"...</option>";
										}
									?>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								Link : 
							</td>
							<td>
								<input type="input" name="a" value="<?php echo $_POST['a'];?>"/>
							</td>
						</tr>
						<tr>
							<td>
								Visual : 
							</td>
							<td>
								<input type="text" name="visual" value="<?php echo stripslashes($_POST['visual']);?>"/>
							</td>
						</tr>
						<tr>
							<td>
								Comment : 
							</td>
							<td>
								<input type="text" name="comment" value="<?php echo stripslashes($_POST['comment']);?>"/>
							</td>
						</tr>
						<tr>
						  <th colspan="2">
							<input type="submit" name="<?php echo $sc;?>submit" value="Add <?php echo $page_visual;?> Link" onClick="showloading();"/>
						  </th>
						</tr>
					</table>
					</form>
		  </td>
		  <td>
				<h4>Reomove <?php echo $page_visual;?> Link</h4>
				<form method="POST">
								<select name="a_id_r">
									<option></option>
									<?php
										$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
										while($data=mysql_fetch_assoc($q))
										{
										    $text_data_id=$data['id'];
										    $q2=mysql_query("SELECT id, a FROM a WHERE page_id='$page_id' AND text_data_id='$text_data_id'");
											while($data2=mysql_fetch_assoc($q2))
											{
												echo "<option value='".$data2['id']."'>";
													for($i=0;$i<40;$i++)
													{
														echo $data['heading'][$i];
													}
													echo"... (";
												for($i=0;$i<20;$i++)
												{
													echo $data2['a'][$i];
												}
												echo "...)</option>";
											}
										}
									?>
								</select>
								<br/>
								<br/><input type="submit" name="<?php echo $sc;?>submit" value="Remove <?php echo $page_visual;?> Link" onClick="showloading();"/>
				</form>
		  </td>
		</tr>
	</table>
</div>
<div id="sud3">
	<table class="structured">
		<tr>
		  <td>
				<h4>Add <?php echo $page_visual;?> Downloadable File</h4>
					<form method="POST" enctype="multipart/form-data">
					<table class="formaligner" align="center">
						<tr>
							<td>
								<?php echo $page_visual;?> Article : 
							</td>
							<td>
								<select name="text_data_id_d">
									<option></option>
									<?php
										$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
										while($data=mysql_fetch_assoc($q))
										{
											echo "<option value='".$data['id']."'>";
											for($i=0;$i<40;$i++)
											{
												echo $data['heading'][$i];
											}
											echo"...</option>";
										}
									?>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								Title : 
							</td>
							<td>
								<input type="text" name="title" value="<?php echo stripslashes($_POST['title']);?>"/>
							</td>
						</tr>
						<tr>
							<td>
								File : 
							</td>
							<td>
								<input type="file" name="newdownload"/>
							</td>
						</tr>
						<tr>
							<td>
								Description : 
							</td>
							<td>
								<input type="text" name="description" value="<?php echo stripslashes($_POST['description']);?>"/>
							</td>
						</tr>
						<tr>
						  <th colspan="2">
							<input type="submit" name="<?php echo $sc;?>submit" value="Add <?php echo $page_visual;?> Downloadable File" onClick="showloading();"/>
						  </th>
						</tr>
					</table>
					</form>
		  </td>
		  <td>
				<h4>Reomove Downloadable File</h4>
				<form method="POST">
								<select name="download_id_r">
									<option></option>
									<?php
										$q=mysql_query("SELECT id, heading FROM text_data WHERE page_id='$page_id'");
										while($data=mysql_fetch_assoc($q))
										{
										    $text_data_id=$data['id'];
										    $q2=mysql_query("SELECT id, title FROM download WHERE page_id='$page_id' AND text_data_id='$text_data_id'");
											while($data2=mysql_fetch_assoc($q2))
											{
												echo "<option value='".$data2['id']."'>";
											for($i=0;$i<40;$i++)
											{
												echo $data['heading'][$i];
											}
											echo"... (".$data2['title'].")</option>";
											}
										}
									?>
								</select>
								<br/>
								<br/><input type="submit" name="<?php echo $sc;?>submit" value="Remove <?php echo $page_visual;?> Downloadable File" onClick="showloading();"/>
				</form>
		  </td>
		</tr>
	</table>
</div>
<div id="sud4">
	<table class="structured">
		<tr>
		  <td>
				<h4>Add <?php echo $page_visual;?> Category</h4>
				<form method="POST">
				    <table class="formaligner" align="center">
						<tr>
							<td>
								Category :
							</td>
							<td>
								<input type="text" name="category" value="<?php echo ($_POST['category']);?>"/>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" name="<?php echo $sc;?>submit" value="Add Category" onClick="showloading();"/>
							</th>
						</tr>
					</table>
				</form>
		  </td>
		</tr>
		<tr>
		  <td>
				<h4>Remove <?php echo $page_visual;?> Category</h4>
				<form method="POST">
				    <table class="formaligner" align="center">
						<tr>
							<td>
								Category :
							</td>
							<td>
								<select name="r_category">
									<?php
										$qcat=mysql_query("SELECT id, category FROM category WHERE page_id='$page_id'");
										$h=0;
										while($datacat=mysql_fetch_assoc($qcat))
										{
											$qdck=mysql_query("SELECT id FROM category_vs_text_data WHERE category_id='".$datacat['id']."'");
											if(mysql_num_rows($qdck)==0)
											{
												echo "<option value='".$datacat['id']."'";
													if($datacat['id']==$_POST['category']) echo "selected";
												echo ">".$datacat['category']."</option>";
												$h=1;
											}
										}
										if($h==0)
										{
											echo "<option>There are no empty Categories which can be removed.</option>";
										}
									?>
								</select>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" name="<?php echo $sc;?>submit" value="Remove Category" onClick="showloading();"/>
							</th>
						</tr>
					</table>
				</form>
		  </td>
		</tr>
	</table>
</div>
<br/><img src="images/blank1by1.gif"  alt="Blank" onload="hideAllButZero(5)" width="0px">
<?php
	if($_POST[$sc.'submit'])
	{
		$submit_ck=$_POST[$sc.'submit'];
	}
	elseif($_GET['imgedted']==1)
	{
		$submit_ck="Add ".$page_visual." Image";
	}
	else
	{
		$scmin=$sc-1;
		$submit_ck=$_POST[$scmin.'submit'];
	}	
	if($submit_ck)
	{
		if(($submit_ck=="Add ".$page_visual." Image")||($submit_ck=="Remove ".$page_visual." Image"))
		{
			echo "<img src='images/blank1by1.gif'  alt='Blank' onload='showit(1)' width='0px'>";
		}
		elseif(($submit_ck=="Add ".$page_visual." Link")||($submit_ck=="Remove ".$page_visual." Link"))
		{
			echo "<img src='images/blank1by1.gif'  alt='Blank' onload='showit(2)' width='0px'>";
		}
		elseif(($submit_ck=="Add ".$page_visual." Downloadable File")||($submit_ck=="Remove ".$page_visual." Downloadable File"))
		{
			echo "<img src='images/blank1by1.gif'  alt='Blank' onload='showit(3)' width='0px'>";
		}
		else
		{
			echo "<img src='images/blank1by1.gif'  alt='Blank' width='0px'>";
		}
	}
?>
