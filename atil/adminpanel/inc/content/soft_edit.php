<h1>Editing <a href="index.php?page=<?php echo $page?>"><?php echo $page_visual;?></a></h1>
<?php
    if($_POST[$sc.'submit'])
	{
		if($_POST['text_data_id']&&$_POST['heading']&&$_POST['content']){
			$text_data_id=$_POST['text_data_id'];
			$heading=htmlentities($_POST['heading']);
			$content=$_POST['content'];
			$price=htmlentities($_POST['price']);
			$negotiable=htmlentities($_POST['negotiable']);
			$note=htmlentities($_POST['note']);
			$p_price=htmlentities($_POST['p_price']);
			$hidden=htmlentities($_POST['hidden']);
			$category_id=htmlentities($_POST['category_id']);
			mysql_query("START TRANSACTION");
			$q=mysql_query("UPDATE text_data SET heading='$heading', content='$content', hidden='$hidden' WHERE id='$text_data_id'");
			if($q)
			{
				$q=mysql_query("UPDATE price SET price='".$price."', p_price='".$p_price."', negotiable='".$negotiable."', note='".$note."' WHERE text_data_id='".$text_data_id."'");
			}
			if($q)
			{
				$q=mysql_query("UPDATE category_vs_text_data SET category_id='".$category_id."' WHERE text_data_id='".$text_data_id."'");
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
		else{
			$say=1;
		}
	}
	else{
       $say=null;	
	}
	include("inc/message.php");
		
	if($_POST['text_data_id']&&$_POST['edit_text_data']){
						$text_data_id=$_POST['text_data_id'];
						$text_data_query=mysql_query("SELECT 
																				text_data.heading, text_data.content,  text_data.hidden, 
																				price.price, price.p_price, price.negotiable, price.note,
																				category_vs_text_data.category_id
																				FROM text_data
																				LEFT JOIN price ON (text_data.id=price.text_data_id)
																				LEFT JOIN category_vs_text_data ON (text_data.id=category_vs_text_data.text_data_id)
																				WHERE text_data.id='".$text_data_id."'");
						$data=mysql_fetch_assoc($text_data_query);			
						$heading=htmlentities($data['heading']);
						$content=$data['content'];
						$price=$data['price'];
						$negotiable=$data['negotiable'];
						$note=$data['note'];
						$p_price=$data['p_price'];
						$category_id=$data['category_id'];
						$hidden=$data['hidden'];
	}
?>
	<a href="index.php?page=<?php echo $page;?>" class="button">Back</a>
	<a href="../index.php?page=<?php echo $page;?>&&data_id=<?php echo $text_data_id;?>" class="button" target="_blank">Visit</a>
	<br/>
	<table class="structured">
		<tr>
		  <td colspan="2">
				<h4>Editing : <i><?php echo $heading;?></i></h4>
				<form method="POST">
					<input type="hidden" name="text_data_id" value="<?php echo $_POST['text_data_id'];?>"/>
				    <table class="formaligner" align="center">
						<tr>
							<td>
								Title
							</td>
							<td>
								:
							</td>
							<td>			
								<input type="text" name="heading" value="<?php echo stripslashes($heading);?>"/>							
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
										<input type="text" name="price" value="<?php echo $price;?>"/>
										<select name='negotiable'>
											<option value='0' <?if($negotiable==0) echo "selected";?>>Fixed</option>
											<option value='1' <?if($negotiable==1) echo "selected";?>>Negotiable</option>
											<option value='2' <?if($negotiable==2) echo "selected";?>>Contact For Price</option>
										</select>
										<input type="text" name="note" value="<?php echo $note;?>" placeholder='Note' />
							</td>
						</tr>
						</tr>
							<tr>
							<td>
								Purchase Price
							</td>
							<td>
								:
							</td>
							<td>
										<input type="text" name="p_price" value="<?php echo $p_price;?>"/>
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
												if($datacat['id']==$category_id) echo "selected";
											echo ">".$datacat['category']."</option>";
										}
									?>
								</select>
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
								<textarea name="content" rows="20px" cols="60px"><?php echo stripslashes($content);?></textarea>
							</td>
						</tr>
						<tr>
							<th colspan="3">
								<input type="submit" name="<?php echo $sc;?>submit" value="Save" onClick="showloading();"/>
							</th>	
						</tr>
					</table>
			</td>
		</tr>
	</table>