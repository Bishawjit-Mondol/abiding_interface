<?php
	error_reporting(0);
	
	$loan_solved = true;
    $lang = isset($_GET['ln']) ? $_GET['ln'] : 0;
    
	
    if (!isset($_GET['type']) && !isset($_GET['mother_call'])) {
	include '_private/inc/conf_setup.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> <?php echo $lang ?  "এবাইডিং ট্রেড ইন্ট্রারন্যাশনাল লিমিটেড" :  "ABIDING TRADE INTERNATIONAL LTD - ATIL"; ?> </title>
        
	<?php include '_private/inc/css_loader.php'; ?>
    </head>
    <style>
      .input-group-addon-2x {
	min-width:200px;
	text-align:left;
       }

    </style>
    <body class="skin-blue fixed">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.php" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
               <?php echo $lang ?  "অাটিল" :  "ATIL"; ?>
            </a>
	    <?php include '_private/inc/nav.php'; ?>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
	    <?php include '_private/inc/sidebar.php'; ?>
	    <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
				
					<div id = 'head-crm-msg'>
					<h4 id = 'head-loading'><i class = 'fa fa-gears fa-spin'></i> <span class = 'message'>  <?php echo $lang ?  "অাপনার সার্ভারের সাথে যোগাযোগ করা হচ্ছে" :  "Communicating With Server ..."; ?>  </span></h4>
					<ol id = "breadcrumb" class="breadcrumb">
                        <li> <?php echo $lang ?  "এবাইডিং ট্রেড ইন্ট্রারন্যাশনাল লিমিটেডের সফটওয়ারে অাপনাকে স্বাগতম।" :  "You Are Welcome On ABIDING TRADE INTERNATIONAL LTD's Software"; ?> </li>
                    </ol>
					</div>				
                </section>

                <!-- Main content -->
                <section class="content">
                <?php include '_private/inc/software_content.php'; ?>
                
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
        
        
    </body>
    <?php include '_private/inc/jqload.php'; ?>
</html>
<?php } else { ?>
<?php
//interface
    include '_private/inc/conf_setup.php';
    $page = $_GET['page'];
    $sub = $_GET['sub'];
    $section = "contents";
    include("_private/inc/jqeuryContent.php");
}
die();
?>

