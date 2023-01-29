<?php
date_default_timezone_set('Asia/Dhaka');
include("_private/db.php");
dbconnect();
$companyname = get_fixedtext(1);
$home_heading = get_fixedtext(2);
$home_intro = get_fixedtext(3);
$domain = get_fixedtext(4);
$admin_email = get_fixedtext(5);
$slogan = get_fixedtext(6);
if (!empty($_GET['page'])) {
	$page = $_GET['page'];
} else {
	$page = 'home';
}
//$page = $_GET['page'];
?>
<!DOCTYPE HTML>
<html>

<head>
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
	<title><?= $companyname ?> - <?= $slogan ?></title>
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="application/x-javascript">
		addEventListener("load", function() {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	</script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/slider-style.css" />
	<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>

	<script src="js/login.js"></script>
	<link type="text/css" rel="stylesheet" href="css/jquery.mmenu.all.css" />
	<script type="text/javascript" src="js/jquery.mmenu.js"></script>
	<script type="text/javascript">
		//	The menu on the left
		$(function() {
			$('nav#menu-left').mmenu();
		});
	</script>
</head>

<style>
/* Style The Dropdown Button */
.dropbtn {
  color: #777777;
  padding: 16px;
  font-size: 1.2em;
  border: none;
  cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}

</style>

<body>
	<div id="page">
		<div id="header">
			<a class="navicon" href="#menu-left"> </a>
		</div>
		<nav id="menu-left">
			<ul>
				<?php include("_private/menu.php"); ?>
				<div class="clear"> </div>
			</ul>
		</nav>
	</div>
	<div class="header">
		<div class="wrap">
			<div class="header-left">
				<div class="logo">
					<a href="index.php?page=home"><img src="images/logo.png"><?= $companyname ?></a>
				</div>
			</div>
			<div class="header-right">
				<div class="top-nav">
					<ul>
						<?php include("_private/menu.php"); ?>
					</ul>
				</div>
				<div class="clear"> </div>
			</div>
			<div class="clear"> </div>
		</div>
	</div>
	<?php if (($page == 'home') || (!$page)) {
		slides();
	} ?>
	<div class="content">
		<?php
		if ($page) {
			$path = "_private/content/" . $page . ".php";
			if (file_exists("$path")) {
				include("$path");
			} else {
				include("_private/content/default.php");
			}
		}
		include("_private/footer.php");
		?>
	</div>
</body>

</html>