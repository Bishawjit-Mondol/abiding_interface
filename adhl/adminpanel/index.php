<?php
error_reporting(0);
session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Admin Panel</title>
  <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico" />
  <?php
  include("inc/security.php");
  include_once("inc/db.php");
  $companyname = get_fixedtext(1);
  $soft = checksoft();
  ?>
  <link rel="stylesheet" type="text/css" href="css/general.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/topmenu.css">
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type='text/javascript' src='js/showloading.js'></script>
  <script type='text/javascript' src='js/timedateday.js'></script>
  <script type='text/javascript' src='js/slideupdown_uti.js'></script>
  <script type='text/javascript' src='js/print.js'></script>


</head>

<body onLoad="startTime();">
  <center>
    <div id="topmenubg">
      <div id="topmenu">
        <?php
        include("inc/topmenu.php");
        ?>
      </div>
    </div>
    <div id="content">
      <div id="ttd">
        <div id="userloged">
          Loged in as
          <?php
          echo "<b>" . $logeduser . "</b> ";
          if ($logeduserlevel == 1) {
            echo "(Admin)";
          } elseif ($logeduserlevel == 2) {
            echo "(Soft Operator)";
          } elseif ($logeduserlevel == 3) {
            echo "(Site Editor)";
          }
          ?>
        </div>
        <div id="date">
          <?php echo date("D, d M Y"); ?>
        </div>
        <div id="digclock">
        </div>
      </div>
      <img src="images/blank1by1.gif" class="leftpillar" alt="" />
      <img src="images/blank1by1.gif" class="rightpillar" alt="" />
      <h1 id="banner"><i><?php echo $companyname; ?></i></h1>
      <?php
      $page = $_GET['page'];
      $sub = $_GET['sub'];
      $section = "contents";
      include("inc/content.php");
      ?>
      <br />
      <br />
    </div>
    <div id="ending">
      <?php
      include("inc/end.php");
      ?>
    </div>
  </center>
</body>

</html>