<!DOCTYPE HTML>
<!--
	Idea Trading Corporation
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Idea Trading Corporation</title>
		<link rel="shortcut icon" type="image/x-icon" href="images/favcon.png">
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.poptrox.min.js"></script>
		<script src="js/jquery.scrolly.min.js"></script>
		<script src="js/jquery.scrollgress.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-wide.css" />
			<link rel="stylesheet" href="css/style-normal.css" />

		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->
			<header id="header">

				<!-- Logo -->
					<h1 id="logo"><img src="logo/idea.png" height="60px"></img></h1>
				
				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="http://localhost/idea#intro">Home</a></li>
							<li><a href="http://localhost/idea#one">What We Do</a></li>
							<li><a href="http://localhost/idea#two">Director's Message</a></li>
							<li><a href="http://localhost/idea#work">Sister Concerns</a></li>
							<li><a href="http://localhost/idea#contact">Contact</a></li>
						</ul>
					</nav>

			</header>
		<div class="box container 75%" style="margin-bottom:200px">
					
					
					
					
					<?php
					$to = "skirasel@gmail.com";
					$subject = $_POST['name'];
					$message = $_POST['message'];
					$from = $_POST['email'];
					echo $msg=$from.'  '.$message;
					
					$headers = "From:" . $from;
					mail($to,$subject,$message,$headers);
					echo "Your email has been sent successfully";
				?>

					</div>
		<!-- Footer -->
			<footer id="footer">

				<!-- Icons -->
					<ul class="actions">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
						
					</ul>

				<!-- Menu -->
					<ul class="menu">
						<li>Developed By</li><li><a href="http://www.uniquewebers.com" target="_blank">Unique Webers Limited.</a></li>
					</ul>
			
			</footer>


	</body>
</html>