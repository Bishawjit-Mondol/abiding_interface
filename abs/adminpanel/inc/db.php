<?php
function connect_database($db_user, $db_user_p, $db)
{
	$con = mysql_connect("localhost", $db_user, $db_user_p);
	if (!$con) {
		die("Server Connection Failed.");
	}
	$db = mysql_select_db($db);
	if (!$db) {
		die("Database Connection Failed.");
	}
}

function checksoft()
{
	$q = mysql_query("SELECT id FROM page WHERE pagetype_id='3' ");
	$num = mysql_num_rows($q);
	if ($num > 0)
		return 1;
	else
		return NULL;
}

function checkuser($user)
{
	$q = mysql_query("SELECT user FROM user WHERE user='" . $user . "' ");
	$num = mysql_num_rows($q);
	if ($num > 0)
		return 1;
	else
		return NULL;
}

function rep_br_sp($string)
{
	return str_ireplace("<br/>", " ", $string);
}

function dateconvert($date)
{
	if ($date == "0000-00-00" || (!$date))
		return "";
	elseif ($date == date("Y-m-d"))
		return "Today - " . date("d M Y (D)", strtotime($date));
	else
		return date("d M Y (D)", strtotime($date));
}

function value_pgd($name, $default_value = null)
{
	if (isset($_POST[$name])) {
		return $_POST[$name];
	} elseif (isset($_GET[$name])) {
		return $_GET[$name];
	} elseif ($default_value != null) {
		return $default_value;
	} else {
		return null;
	}
}

function getPostDate($p)
{
	if ($_POST[$p . '_y'] && $_POST[$p . '_m'] && $_POST[$p . '_d'])
		return $_POST[$p . '_y'] . '-' . $_POST[$p . '_m'] . '-' . $_POST[$p . '_d'];
	else
		return 0;
}

function select_digit($name, $from, $to, $sel, $int)
{
	echo "<select name = '" . $name . "' > ";
	for ($i = $from; $i <= $to; $i = $i + $int) {
		if ($sel == $i)
			echo "<option selected>" . $i . "</option>";
		else
			echo "<option >" . $i . "</option>";
	}
	echo "</select>";
}

function input_date($n, $t)
{
	$texploded = explode('-', $t);
	$y = $texploded[0];
	$m = $texploded[1];
	$d = $texploded[2];
	$yless = date(Y) - 10;
	$ymore = date(Y) + 10;
	select_digit($n . '_d', 1, 31, $d, 1);
	select_digit($n . '_m', 1, 12, $m, 1);
	select_digit($n . '_y', $yless, $ymore, $y, 1);
}

function all_data($table, $order = 'id', $type = 'DESC')
{
	return $q = mysql_query("SELECT * FROM " . $table . " ORDER BY " . $order . " " . $type . "");
}

function get_page_info($page)
{
	$q = mysql_query("SELECT id, visual, pagetype_id FROM page WHERE page='" . mysql_real_escape_string($page) . "'");
	$a = mysql_fetch_assoc($q);
	return $a;
}

function get_page_type($pagetype_id)
{
	$q = mysql_query("SELECT pagetype FROM pagetype WHERE id='" . $pagetype_id . "'");
	$a = mysql_fetch_assoc($q);
	return $a['pagetype'];
}

function imgtype_by_id($imgtype_id)
{
	$q = mysql_query("SELECT imgtype FROM imgtype WHERE id='$imgtype_id'");
	$ar = mysql_fetch_array($q);
	return $ar[0];
}

function imgurl_by_id($img_id)
{
	$q = mysql_query("SELECT imgtype_id FROM img WHERE id='$img_id'");
	$ar = mysql_fetch_assoc($q);
	$imgtype_id = $ar['imgtype_id'];
	$imgtype = imgtype_by_id($imgtype_id);
	$url = "../images/db/" . $img_id . $imgtype;
	return $url;
}

function downloadtype_by_id($downloadtype_id)
{
	$q = mysql_query("SELECT downloadtype FROM downloadtype WHERE id='$downloadtype_id'");
	$ar = mysql_fetch_array($q);
	return $ar[0];
}

function downloadurl_by_id($download_id)
{
	$q = mysql_query("SELECT downloadtype_id FROM download WHERE id='$download_id'");
	$ar = mysql_fetch_assoc($q);
	$downloadtype_id = $ar['downloadtype_id'];
	$downloadtype = downloadtype_by_id($downloadtype_id);
	$url = "../download/db/" . $download_id . $downloadtype;
	return $url;
}

function get_fixedtext($fixedtext_id)
{
	$q = mysql_query("SELECT fixedtext FROM fixedtext WHERE id='$fixedtext_id'");
	$ar = mysql_fetch_array($q);
	return $ar[0];
}

function update_fixedtext($fixedtext_id, $editedcontent)
{
	$q = mysql_query("UPDATE fixedtext SET fixedtext='" . $editedcontent . "' WHERE id='" . $fixedtext_id . "'");
	return $q;
}

function display_image_preview($img_id)
{
	$q = mysql_query("SELECT caption, imgtype_id, link FROM img WHERE id='$img_id'");
	$ar = mysql_fetch_assoc($q);
	$caption = $ar['caption'];
	$imgtype_id = $ar['imgtype_id'];
	$imgtype = imgtype_by_id($imgtype_id);
	$link = $ar['link'];
	echo "<div class='containerblock'>";
	echo "<img src='../images/db/" . $img_id . $imgtype . "' alt='" . $caption . "' width='300px'/>";
	if ($caption) {
		echo "<br/><b>Caption : </b>";
		for ($i = 0; $i < 60; $i++) {
			echo $caption[$i];
		}
		echo "....";
	}
	if ($link) {
		echo "<br/><b>Link : </b>" . $link . "";
	}
	echo "</div>";
}

function get_img_caption($img_id)
{
	$q = mysql_query("SELECT caption FROM img WHERE id='$img_id'");
	$caption_array = mysql_fetch_array($q);
	$caption = $caption_array[0];
	return $caption;
}

function get_img_link($img_id)
{
	$q = mysql_query("SELECT link FROM img WHERE id='$img_id'");
	$link_array = mysql_fetch_array($q);
	$link = $link_array[0];
	return $link;
}

function get_img_border($img_id)
{
	$q = mysql_query("SELECT border FROM img WHERE id='$img_id'");
	$border_array = mysql_fetch_array($q);
	$border = $border_array[0];
	return $border;
}

function update_img_text($img_id, $caption, $link = null, $border = 0)
{
	$q = mysql_query("UPDATE img SET caption='$caption', link='$link', border='$border' WHERE id='$img_id'");
	return $q;
}

function update_img($img_id, $caption, $link = null, $border = 0)
{
	$fileerror = $_FILES["newimage"]["error"];
	if ($fileerror) {
		return 4;
	} else {
		$filetype = $_FILES["newimage"]["type"];
		$imgtype_id = img_file_type_check($filetype);
		$filesize = $_FILES["newimage"]["size"];
		$filetempname = $_FILES["newimage"]["tmp_name"];
		if (!(($imgtype_id != null) && ($filesize < 500000) && $filetempname)) {
			return 5;
		} else {
			$preurl = imgurl_by_id($img_id);
			$delete = unlink($preurl);
			if (!$delete) {
				return 0;
			} else {
				$imgtype = imgtype_by_id($imgtype_id);
				$url = "../images/db/" . $img_id . $imgtype;
				$uploaded = move_uploaded_file($filetempname, $url);
				if (!$uploaded) {
					return 0;
				} else {
					$q = update_img_attribute($img_id, $imgtype_id, $caption, $link, $border);
					return $q;
				}
			}
		}
	}
}

function img_file_type_check($filetype)
{
	$qft = mysql_query("SELECT * FROM imgtype");
	while ($data = mysql_fetch_assoc($qft)) {
		if ($filetype == $data['phpcheck']) {
			$imgtype_id = $data['id'];
		}
	}
	return $imgtype_id;
}

function update_img_attribute($img_id, $imgtype_id, $caption, $link = null)
{
	$q = mysql_query("UPDATE img SET caption='$caption', link='$link', imgtype_id='$imgtype_id', border='$border' WHERE id='$img_id'");
	return $q;
}

function people_email($text_data_id)
{
	$q = mysql_query("SELECT email FROM people_email WHERE text_data_id='$text_data_id'");
	$ar = mysql_fetch_array($q);
	return $ar[0];
}

function get_page_by_id($page_id)
{
	$q = mysql_query("SELECT page FROM page WHERE id='" . $page_id . "'");
	$a = mysql_fetch_assoc($q);
	return $a['page'];
}

function product_options()
{
	$q1 = mysql_query("SELECT id FROM page WHERE pagetype_id='3'");
	if (mysql_num_rows($q1) > 0) {
		$c = 0;
		while ($d = mysql_fetch_assoc($q1)) {
			if ($c == 0) {
				$string = " text_data.page_id='" . $d['id'] . "' ";
				$c = 1;
			} else {
				$string = " OR text_data.page_id='" . $d['id'] . "' ";
			}
		}
	}
	$q2 = mysql_query("SELECT 
										id,heading
										FROM text_data
										WHERE " . $string . "
										ORDER BY priority
									");
	if ($q2) {
		$num = mysql_num_rows($q2);
		if ($num > 0) {
			$option = $option . "<option></option>";
			while ($data = mysql_fetch_assoc($q2)) {
				$option = $option . "<option value='" . $data['id'] . "'>" . $data['heading'] . "</option>";
			}
		} else {
			$option = "<option>No products</option>";
		}
	}
	return $option;
}

function product_heading($id)
{
	$q = mysql_query("SELECT heading FROM text_data WHERE id='" . $id . "'");
	$a = mysql_fetch_assoc($q);
	return $a['heading'];
}

function product_stock($id)
{
	$q = mysql_query("SELECT stock FROM stock WHERE text_data_id='" . $id . "'");
	$a = mysql_fetch_assoc($q);
	return $a['stock'];
}

function get_page_text_data_id($text_data_id)
{
	$q = mysql_query("SELECT page.page FROM text_data LEFT JOIN page ON (text_data.page_id=page.id) WHERE text_data.id=" . $text_data_id . "");
	$a = mysql_fetch_assoc($q);
	return $a['page'];
}

function check_product_sell($text_data_id)
{
	$q = mysql_query("SELECT id FROM sells_details WHERE text_data_id=" . $text_data_id . "");
	return $num = mysql_num_rows($q);
}

function opening_balance($date)
{
	$q = mysql_query("SELECT SUM(amount) as balance FROM payments WHERE date<'" . $date . "' ");
	$a = mysql_fetch_assoc($q);
	return $a['balance'];
}

function closing_balance($date)
{
	$q = mysql_query("SELECT SUM(amount) as balance FROM payments WHERE date<='" . $date . "' ");
	$a = mysql_fetch_assoc($q);
	return $a['balance'];
}

function bfn($num, $d = 2)
{
	$neg = false;
	if ($num < 0) {
		$neg = true;
	}
	$num = abs($num);
	$num = sprintf("%." . $d . "f", $num);
	$num_a = explode('.', $num);
	$num_h = $num_a[0];

	$num_f = $num_a[1];
	$num_s = "";
	if ($num_h) {
		$m = 3;
		for ($i = (strlen($num_h) - 1); $i > -1; $i--) {
			$num_s = $num_h[$i] . $num_s;
			if (($i == (strlen($num_h) - $m)) && $i != 0) {
				$num_s = "," . $num_s;
				$m = $m + 2;
			}
		}
	} else {
		$num_s = $num_s . "0";
	}
	if ($d == 0) {
		return $num_s;
	}
	$num_s = $num_s . ".";
	$num_s = $num_s . $num_f;
	if ($neg) {
		$num_s = "(-) " . $num_s;
	}
	return $num_s;
}
