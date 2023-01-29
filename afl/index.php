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
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!--This site is designed by Qazi Syed Sayeed Nahin for Unique Webers-->

<html  lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
		<title><?=$companyname?> - <?=$slogan?></title>
		<meta name="viewport" content="width=1200,user-scalable=no" />
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="<?=$home_intro?>" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.poptrox.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
			<link rel="stylesheet" href="css/style-noscript.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body>

		<div id="wrapper">
			<div id="main">
				<?/*<h1><?=$companyname?><br/><?=$slogan?></h1>*/?>
				<div id="reel">
					<?
						echo "
						<article class='item thumb' data-width='282'>
							<h2 style='font-family:BAUHS93;color:#B20000;font-size:20px;text-align:center;text-shadow:1px 1px 0px #1B0B02;'>".$companyname."</h2>
							<a href='images/logo.png'><img src='images/logo.png' alt='<?=$companyname?>'></a>
						</article>
						";
						for($j=1;$j<6;$j++)
						{
							$q=mysql_query("SELECT img.*, imgtype.imgtype FROM img LEFT JOIN imgtype ON (imgtype.id=img.imgtype_id) ORDER BY img.priority DESC");
							while($qd=mysql_fetch_assoc($q))
							{
								echo "
									<article class='item thumb' data-width='120'>
										<h2>".$qd['caption']."</h2>
										<a href='images/db/".$qd['id'].$qd['imgtype']."'><img src='images/db/".$qd['id'].$qd['imgtype']."' alt='".$qd['caption']."'></a>
									</article>
								";
							}
						}
					?>
				</div>
			</div>
		
			<div id="footer">
				<div class="left">
					<h1><?=$home_heading?></h1>
					<p>
						<?=$home_intro?>
					</p>
				</div>
				<div class="right">
					<ul class="copyright">
						<li>Developed by <a href="http://www.uniquewebers.com/" target="_blank">Unique Webers</a></li>
					</ul>
				</div>
			</div>

		</div>

	</body>
</html>