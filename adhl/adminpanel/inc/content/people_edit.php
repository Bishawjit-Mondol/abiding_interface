<h1>Editing <a href="index.php?page=<?php echo $page?>"><?php echo $page_visual;?></a></h1>
<?php
    if($_POST[$sc.'submit'])
	{
		if($_POST['text_data_id']&&$_POST['heading']&&$_POST['content']){
			$text_data_id=$_POST['text_data_id'];
			$heading=htmlentities($_POST['heading']);
			$content=htmlentities($_POST['content']);
			$email=htmlentities($_POST['email']);
			mysql_query("START TRANSACTION");
			$q=mysql_query("UPDATE text_data SET heading='$heading', content='$content' WHERE id='$text_data_id'");
			if($q)
			{
				$q=mysql_query("UPDATE people_email SET email='$email' WHERE text_data_id='$text_data_id'");
			}
			if($q){
					mysql_query("COMMIT");
			}
			else{
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
						$text_data_query=mysql_query("SELECT heading, content FROM text_data WHERE id='$text_data_id'");
						$data=mysql_fetch_assoc($text_data_query);			
						$heading=htmlentities($data['heading']);
						$content=htmlentities($data['content']);
						$email=htmlentities(people_email($text_data_id));
	}
	elseif($_POST['text_data_id']&&$_POST[$sc.'submit']){
						$text_data_id=$_POST['text_data_id'];
						$heading=htmlentities($_POST['heading']);
						$content=htmlentities($_POST['content']);
						$email=htmlentities($_POST['email']);
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
								Title :
							</td>
							<td>
								<input type="text" name="heading" value="<?php echo stripslashes($heading);?>"/>
							</td>
						</tr>
						<tr>
							<td>
								Description :
							</td>
							<td>
								<textarea name="content" rows="20px" cols="60px"><?php echo stripslashes($content);?></textarea>
							</td>
						</tr>
						<tr>
							<td>
								E mail :
							</td>
							<td>
								<input type="text" name="email" value="<?php echo stripslashes($email);?>"/>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" name="<?php echo $sc;?>submit" value="Save" onClick="showloading();"/>
							</th>	
						</tr>
					</table>
			</td>
		</tr>
	</table>