<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!--This site is designed by Qazi Syed Sayeed Nahin for Unique Webers-->

<html  lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
<?php
		date_default_timezone_set('Asia/Dhaka');
	    include("_private/db.php");
		dbconnect();
		$companyname=get_fixedtext(1);
		$home_heading=get_fixedtext(2);
		$home_intro=get_fixedtext(3);
		$domain=get_fixedtext(4);
		$admin_email=get_fixedtext(5);
		$slogan=get_fixedtext(6);
		$facebook=get_fixedtext(7);
		if($_GET['page'])
		{
			$page=$_GET['page'];
			$page_info=get_page_info($page);
			$page_pagetype_id=$page_info['pagetype_id'];
			$page_id=$page_info['id'];
			$page_visual=rep_br_sp($page_info['visual']);
			$page_pagetype=get_page_type($page_pagetype_id);
		}
		else
		{ 
			$page="home";
			$page_visual="Welcome to ".$companyname." Website";
			$page_pagetype_id=0;
			$page_pagetype='custom';
		}
		$data_id=$_GET['data_id'];
?>

	<head>
		<title><?php echo $companyname." - ".$slogan." - ".$page_visual; ?></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Description" content="<?php echo $home_heading." : ".$home_intro;?>"/>
		<link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<link rel="stylesheet" type="text/css" href="css/topmenu.css"/>
		<link rel="stylesheet" type="text/css" href="css/sidemenu.css"/>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/coin-slider.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/coin-slider.css"/>
		<script type="text/javascript" src="js/slideupdown_uti.js"></script>
		<script type="text/javascript" src="js/sliding.js"></script>
		<script type="text/javascript" src="js/fly_out_menu.js"></script>
	</head>
	<body>
		<center>
			<div id="topmenubg">
					<div id="topmenu">
						<?php
								include("_private/topmenu.php");
						?>
					</div>
			</div>
			<div id="highlightbg">
					<div id="highlight">
						<h1 class="main">
							<img src="images/logo.png" align="bottom" alt="<?php echo $companyname; ?>" class='left'/>
							<?php
									include("_private/search_form.php");
							?>
						</h1>
						<?php
							include("_private/content.php");
						?>
					</div>
			</div>
			<div id="columnsbg">
					<div id="columns">
						<?php
							include("_private/columns.php");
						?>
					</div>
			</div>
			<div id="endbg">
					<div id="end">
						<?php
							include("_private/menu.php");
						?>
						<small>Copyright &#169; <a href="http://<?php echo $domain; ?>" target="_blank"><?php echo $companyname; ?></a> All rights reserved. Developed by <a href="http://www.uniquewebers.com/" target="_blank">Unique Webers</a></small>
					</div>
			</div>
		</center>
	</body>
</html>