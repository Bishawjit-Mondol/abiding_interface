<?php
          session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!--This site is designed by Qazi Syed Sayeed Nahin son of Qazi Noorul Huq-->
<html  lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<title>Website Editing Panel</title>
	<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico"/>
    <?php
      include("inc/security.php");
	  $companyname=get_fixedtext(1); 
    ?>
    <link rel="stylesheet" type="text/css" href="css/general.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type='text/javascript' src='js/showloading.js'></script>
    <script type='text/javascript' src='js/timedateday.js'></script>
    <script type='text/javascript' src='js/slideupdown_uti.js'></script> 
  </head>
  <body onLoad="startTime();">
    <center>
    <div id="topmenu">
      <?php
        include("inc/topmenu.php");
      ?>
    </div>
    <div id="content">
	    <div id="ttd">
			<div id="date">
			  <?php echo date("D, d M Y");?>
			</div>
			<div id="digclock">
			</div>
		</div>
      <h1 id="banner"><?php echo $companyname; ?><br/><small>Website Editing Panel</small></h1>
      <?php
        $page=$_GET['page'];
        $sub=$_GET['sub'];
        $section="contents";		
        include("inc/content.php");
      ?>
      <br/>
      <br/>
    </div>
    <div id="ending">
      <?php
        include("inc/end.php");
      ?>
    </div>
    </center>
  </body>
</html>