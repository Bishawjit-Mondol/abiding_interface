<?php
    $lang = $_GET['ln'];
    if (!isset($_GET['type']) && !isset($_GET['mother_call'])) {
	include '_private/inc/conf_setup.php';
?>
<html>
	<head>
		<meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<?
//		echo "<link rel='stylesheet' href='bs/css/cerulean.min.css'>";
//		echo "<link rel='stylesheet' href='bs/css/cosmo.min.css'>";
//		echo "<link rel='stylesheet' href='bs/css/cyborg.min.css'>";

/* ok */
//		echo "<link rel='stylesheet' href='bs/css/flatly.min.css'>";
//		echo "<link rel='stylesheet' href='bs/css/journal.min.css'>";
//		echo "<link rel='stylesheet' href='bs/css/lumen.min.css'>";
//		echo "<link rel='stylesheet' href='bs/css/shamrock.min.css'>";
//		echo "<link rel='stylesheet' href='bs/css/simplex.min.css'>";
//		echo "<link rel='stylesheet' href='bs/css/slate.min.css'>";
//		echo "<link rel='stylesheet' href='bs/css/spacelab.min.css'>";
//		echo "<link rel='stylesheet' href='bs/css/superhero.min.css'>";
		echo "<link rel='stylesheet' href='bs/css/united.min.css'>";

?>
		<link rel="stylesheet" href="bs/css/font-awesome.min.css">
		<link rel="stylesheet" href="bs/css/custom.css">
	        <link rel="stylesheet" type="text/css" media="all" href="bs/css/daterangepicker-bs3.css" />
		<script src="bs/js/jquery-1.11.0.min.js"></script>
		<title><?=($lang?"BIKROMPUR PLASTIC":"বিক্রমপুর প্লাষ্টিক");?></title>
	</head>
<body style="">
    <div class="navbar navbar-default navbar-fixed-top">
    <? include '_private/inc/menu.php' ?>  
    </div>
    <div class="container wall" id = 'content'>
	<? include '_private/inc/dashbord.php' ?>  
    </div>
</body>
</html>
		<script src="bs/js/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="bs/js/moment.js"></script>
        <script type="text/javascript" src="bs/js/daterangepicker.js"></script>
		<script src="bs/js/bootstrap.js"></script>
		<script src="bs/js/bootstrap-table-nav.js"></script>
		<script src="bs/js/jquery-barcode.js"></script>
		<script src="bs/js/custom.js"></script>
		<script src="bs/js/jquery-scrollto.js"></script>
		<script src="bs/js/avro-v1.1.4.min.js"></script>
		<script src="bs/js/content_loader.js"></script>
                    
<? } else { ?>
<?
//interface
    include '_private/inc/conf_setup.php';
    $page = $_GET['page'];
    $sub = $_GET['sub'];
    $section = "contents";
    include("_private/inc/content.php");
}
?>
