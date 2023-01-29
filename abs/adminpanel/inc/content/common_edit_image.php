<h1>Edit Image</h1>
<?php
	$page_id=$_POST['page_id'];
	$page=get_page_by_id($page_id);
	echo "<a href='index.php?page=".$page."&&imgedted=1' class='button'>Back</a><br/>";
	$img_id=$_POST['img_id'];
	if($_POST[$sc.'submit']){
		if($_FILES["newimage"]["name"]&&$_POST['caption'])
		{
			$caption=htmlentities($_POST['caption']);
			$link=$_POST['link'];
			$border=$_POST['border'];
			$q=update_img($img_id,$caption,$link,$border);
			include("inc/img_q_check.php");
		}
		elseif($_POST['caption'])
		{
			$caption=htmlentities($_POST['caption']);
			$link=$_POST['link'];
			$border=$_POST['border'];
			$q=update_img_text($img_id,$caption,$link,$border);
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
		
		echo "<table class='structured' align='center'>";
			echo "<tr>";
				echo "<td>";
					display_image_preview($img_id);
				echo "</td>";
			echo "</tr>";
			echo "<tr>";
				echo "<td>";
					echo "<form method='POST' enctype='multipart/form-data'>";
					echo "<input type='hidden' name='img_id' value='".$img_id."'/>";
						echo "<table class='formaligner' align='center'>";
							echo "<tr>";
								echo "<td>";
									echo "Image file : ";
								echo "</td>";
								echo "<td>";
									echo "<input type='file' name='newimage'><br/><small>JPG / GIF / PNG format only<br/>Width : 196px; Height : 318px preferable</small>";
								echo "</td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td>";
									echo "Caption :";
								echo "</td>";
								echo "<td>";
									echo "<textarea name='caption' rows='5' cols='30'>".stripslashes(get_img_caption($img_id))."</textarea>";
								echo "</td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td>";
									echo "Link :<br/><small>(Optional)</small>";
								echo "</td>";
								echo "<td>";
									echo "<input type='text' name='link' value='".get_img_link($img_id)."'>";
								echo "</td>";
							echo "</tr>";
							echo "<tr>";
								echo "<td>";
									echo "Border :"; 
								echo "</td>";
								echo "<td>";
								$border=get_img_border($img_id);
								echo "<select name='border'>";
									echo "<option value='0'>No border</option>";
									echo "<option value='1'";
									if($border==1) echo "selected='selected'";
									echo ">Bordered</option>";
								echo "</select>";
								echo "</td>";
							echo "</tr>";
							echo "<tr>";
								echo "<th colspan='2'>";
									echo "<input type='hidden' name='page_id' value='".$page_id."'/>";
									echo "<input type='submit' name='".$sc."submit' value='Save' onClick='showloading();'>";
								echo "</th>";
							echo "</tr>";
						echo "</table>";	
					echo "</form>";
				echo "</td>";
			echo "</tr>";
		echo "</table>";
?>