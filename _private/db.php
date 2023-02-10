<?php
function dbconnect()
{
	mysql_connect("localhost","abidingg_sitev","8U533fVkMaAF") || die(mysql_error());
	//mysql_connect("localhost", "root", "") || die(mysql_error());
	mysql_select_db("abidingg_home") || die(mysql_error());
	mysql_query("SET NAMES utf8");
}

function get_fixedtext($id)
{
	$q = mysql_query("SELECT fixedtext FROM fixedtext WHERE id='$id' ");
	$a = mysql_fetch_array($q);
	return $a[0];
}

function full_image($id)
{
	$q1m = mysql_query("SELECT img.*, 
						imgtype.imgtype 
						FROM img 
						LEFT JOIN imgtype ON (img.imgtype_id=imgtype.id)
						WHERE img.id='" . $id . "'
						");
	$qd = mysql_fetch_assoc($q1m);
	echo "				
		<div class='about'>
				<div class='wrap'>
					<div class='panels'>
						<div class='panel-left'>";
	if (file_exists("images/db/" . $qd['id'] . $qd['imgtype'])) echo "<img src='images/db/" . $qd['id'] . $qd['imgtype'] . "' width='60%'>";
	echo "</div>
						<div class='panel-right'>
							<h3><span>" . $qd['caption'] . "</span></h3>
							<p style='text-align:justify;'>
								" . $qd['description'] . "
							</p>
						</div>
						<div class='clear'> </div>
					</div>
				</div>
		</div>
		";
}

function grid_images($table)
{
	$qm = mysql_query("SELECT img.id, img.caption, SUBSTR(img.description,1,100) as description,
					imgtype.imgtype 
					FROM " . $table . " 
					LEFT JOIN img ON (" . $table . ".img_id=img.id)
					LEFT JOIN imgtype ON (img.imgtype_id=imgtype.id)
					ORDER BY img.priority DESC
					");

	$count = 0;
	echo "<div class='testimonial-grids'>";
	while ($qmd = mysql_fetch_assoc($qm)) {
		if (($count % 3) == 0) {
			echo "<div class='clear'></div>";
		}
		echo "<div class='testimonial-grid'>";
		echo "<a href='index.php?page=large_img&&img=" . $qmd['id'] . "'>" . $qmd['caption'] . "</a><br/>";
		if (file_exists("images/db/" . $qmd['id'] . $qmd['imgtype'])) echo "<a href='index.php?page=large_img&&img=" . $qmd['id'] . "'><img src='images/db/" . $qmd['id'] . $qmd['imgtype'] . "' alt='" . $qmd['caption'] . "' width='72px'></a>";
		echo "<p>" . nl2br($qmd['description']) . "...</p>";
		echo "</div>";
		$count++;
	}
	echo "<div class='clear'></div>";
	echo "</div>";
}

function slides()
{

	echo "
			<div class='text-slider'>
				<div class='wrap'> 
					<div id='da-slider' class='da-slider'>
		";
	$qs = mysql_query("SELECT img.id, 	
					img.caption, SUBSTR(img.description,1,400) as description,  
					img.link, 
					imgtype.imgtype 
					FROM slides 
					LEFT JOIN img ON (slides.img_id=img.id)
					LEFT JOIN imgtype ON (img.imgtype_id=imgtype.id)
					ORDER BY img.priority DESC
					");
	while ($qsd = mysql_fetch_assoc($qs)) {
		echo "<div class='da-slide'>";
		echo "<h2>";
		echo $qsd['caption'];
		if (file_exists("images/db/" . $qsd['id'] . $qsd['imgtype']))  echo "<img src='images/db/" . $qsd['id'] . $qsd['imgtype'] . "'/>";
		else echo "<img src='images/logo.png'/>";
		echo "</h2>";
		echo "<p>" . nl2br($qsd['description']) . "...</p>";
		if ($qsd['link']) echo "<a href='" . $qsd['link'] . "' class='da-link' target='_blank'>Find out More</a>";
		else echo "<a href='index.php?page=large_img&&img=" . $qsd['id'] . "' class='da-link'>Find out More</a>";
		echo "</div>";
	}
	echo "
							<nav class='da-arrows'>
								<span class='da-arrows-prev'></span>
								<span class='da-arrows-next'></span>
							</nav>
					</div>
						<script type='text/javascript' src='js/jquery.cslider.js'></script>
						<script type='text/javascript'>
							$(function() {
								$('#da-slider').cslider({
									autoplay	: true,
									bgincrement	: 450
								});
							
							});
						</script>
				</div>
			</div>
		";
}

function u_list($table)
{
	$qm = mysql_query("SELECT img.id, 	
					   img.caption
					   FROM " . $table . " 
					   LEFT JOIN img ON (" . $table . ".img_id=img.id)
					   ORDER BY img.priority DESC
					 ");
	echo "<ul>";
	$count = 0;
	while ($qmd = mysql_fetch_assoc($qm)) {
		echo "<li><a href='index.php?page=large_img&&img=" . $qmd['id'] . "'>" . $qmd['caption'] . "</a></li>";
		$count++;
	}
	echo "</ul>";
}
