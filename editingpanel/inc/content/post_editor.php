<?php

$img = $_REQUEST["img"];

$q1m = mysql_query("SELECT img.*, 
					imgtype.imgtype 
					FROM img 
					LEFT JOIN imgtype ON (img.imgtype_id=imgtype.id)
					WHERE img.id='" . $img . "'
					");
$qd = mysql_fetch_assoc($q1m);
// echo "<pre>";
// var_dump($img);
// die();


$description = $qd["description"];
$caption = $qd["caption"];
$link = $qd["link"];
$imgtype = $qd["imgtype"];
$imgtype_id = $qd["imgtype_id"];

if ($_POST[$sc . 'submit']) {
	//echo "<pre>";
	var_dump($_POST);
	//die();
	$slides = $_POST["slides"];
	$career = $_POST["career"];
	$contact = $_POST["contact"];
	$management = $_POST["management"];
	$units = $_POST["units"];
	if ($_POST['caption'] && ($slides || $career || $contact || $management || $units)) {

		$description = mysql_real_escape_string($_POST["description"]);
		$caption = mysql_real_escape_string($_POST["caption"]);
		$link = mysql_real_escape_string($_POST["link"]);


		$image_ok = 1;

		if ($_FILES["newimage" . $i]["name"]) {
			$fileerror = $_FILES["newimage" . $i]["error"];
			if (!$fileerror) {
				$filetype = $_FILES["newimage" . $i]["type"];
				$imgtype_id = null;
				$qft = mysql_query("SELECT * FROM imgtype");
				while ($data = mysql_fetch_assoc($qft)) {
					if ($filetype == $data['phpcheck']) {
						$imgtype_id = $data['id'];
						$imgtype = $data['imgtype'];
					}
				}
				echo $filesize = $_FILES["newimage" . $i]["size"];
				if (($imgtype_id != null) && ($filesize < 500000)) {
					$filetempname = $_FILES["newimage" . $i]["tmp_name"];
					$image_ok = 1;
				} else {
					$say = 5;
					$image_ok = 0;
				}
			} else {
				$say = 4;
				$image_ok = 0;
			}
		}
		mysql_query("START TRANSACTION");
		$q = mysql_query("UPDATE img SET caption='" . $caption . "', description='" . $description . "', imgtype_id='" . $imgtype_id . "', link='" . $link . "' WHERE id='" . $img . "'");

		/*	
				if($q&&$slides&&(!check_img($img,'slides'))){$q=mysql_query("INSERT INTO slides VALUES('".$img_id."')");}
				if($q&&$career&&(!check_img($img,'career'))){$q=mysql_query("INSERT INTO career VALUES('".$img_id."')");}
				if($q&&$contact&&(!check_img($img,'contact'))){$q=mysql_query("INSERT INTO contact VALUES('".$img_id."')");}
				if($q&&$management&&(!check_img($img,'management'))){$q=mysql_query("INSERT INTO management VALUES('".$img_id."')");}
				if($q&&$units&&(!check_img($img,'units'))){$q=mysql_query("INSERT INTO units VALUES('".$img_id."')");}
            */
		if ($q && $image_ok) {
			$url = $img . $imgtype;
			if ($q) {
				if (file_exists("../images/db/" . $qd['id'] . $qd['imgtype'])) $q = unlink("../images/db/" . $qd['id'] . $qd['imgtype']);
				$q = move_uploaded_file($filetempname, "../images/db/$url");
			} else {
				$say = 3;
			}
		}



		if ($q) {
			mysql_query("COMMIT");
			$say = 2;
		} else {
			mysql_query("ROLLBACK");
			if (!$image_ok) $say = 3;
		}
		include("inc/q_check.php");
	} else {
		$say = 1;
	}
} else {
	$say = null;
}
include("inc/message.php");
?>
<table class="structured">
	<tr>
		<td colspan="2">
			<h4>Edit <?= $caption; ?></h4>
			<form method="POST" enctype="multipart/form-data">
				<table class="formaligner" align="center">
					<tr>
						<td>
							Heading :
						</td>
						<td>
							<input type="text" name="caption" value="<?php echo stripslashes($caption); ?>" />
						</td>
					</tr>
					<tr>
						<td>
							Description :
						</td>
						<td>
							<textarea name="description" rows="5px" cols="20px"><?php echo stripslashes($description); ?></textarea>
						</td>
					</tr>
					<tr>
						<td>
							Show in :
						</td>
						<td>
							<input type="checkbox" name="slides" value="slides" <?php if (check_img($img, 'slides')) echo "checked='1'"; ?>>Slides
							&nbsp;&nbsp;&nbsp;<input type="checkbox" name="units" value="units" <?php if (check_img($img, 'units')) echo "checked='1'"; ?>>Units
							&nbsp;&nbsp;&nbsp;<input type="checkbox" name="career" value="career" <?php if (check_img($img, 'career')) echo "checked='1'"; ?>>Career
							<br /><input type="checkbox" name="management" value="management" <?php if (check_img($img, 'management')) echo "checked='1'"; ?>>Management
							&nbsp;&nbsp;&nbsp;<input type="checkbox" name="contact" value="contact" <?php if (check_img($img, 'contact')) echo "checked='1'"; ?>>Contact
						</td>
					</tr>
					<tr>
						<td>
							Image :
						</td>
						<td>
						<!-- IMAGE PREVIEW	 -->
						<img src="../images/db/<?php echo $img . $imgtype; ?>" height="100"><br>
						<p><?php echo $img .$imgtype; ?></p>	
							
						<input type="file" name="newimage">
						</td> 
					</tr>
					<tr>
						<td>
							Link :
						</td>
						<td>
							<input type="text" name="link" value="<?php echo $link; ?>" /><small class="red">Optional</small>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="hidden" name="img" value="<?php echo $img; ?>" />
							<input type="submit" name="<?php echo $sc; ?>submit" value="Add Post" onClick="showloading();" />
						</th>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>