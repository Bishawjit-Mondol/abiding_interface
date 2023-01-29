<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html  lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
<?php
		error_reporting(0);
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
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
		<link href="layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
		<link href="layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
		<link href="layout/scripts/responsiveslides.js-v1.53/responsiveslides.css" rel="stylesheet" type="text/css" media="all">
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/slideupdown_uti.js"></script>
	</head>
	
<body class="">
<div class="wrapper row1">
  <header id="header" class="full_width clear">
    <div id="hgroup">
	  <img src="images/logo.png" align="bottom" alt="<?php echo $companyname; ?>"/>
      <h1><?php echo $companyname; ?></h1>
    </div>
    <div id="header-contact">
	  <?php include("_private/search_form.php");?>
      <ul class="list none">
        <li><span class="icon-envelope"></span> <a href="#"><?=$admin_email?></a></li>
        <li>
			<?
				if($facebook)
				{
					echo "<a href='".$facebook."' target='_blank'><img src='images/facebook.png'/></a>";
				}
			?>
		</li>
      </ul>
    </div>
  </header>
</div>
<div class="wrapper row2">
  <nav id="topnav">
    <?php
		include("_private/topmenu.php");
	?>
  </nav>
</div>
						<?php
							include("_private/content.php");
						?>
<div class="wrapper row2">
  <div id="footer" class="clear">
    <div class="one_quarter first">
      <h2 class="footer_title">Website Highlights</h2>
      <nav class="footer_nav">
        <ul class="nospace">
		<?php
			$qt=all_data("page","priority");
			while($datat=mysql_fetch_assoc($qt))
			{
			echo "<li><a href='index.php?page=".$datat['page']."'>".$datat['visual']."</a></li>";
			}
		?>
        </ul>
      </nav>
    </div>
    <div class="one_quarter">
      <h2 class="footer_title">Visitors of our Website</h2>
	  <script type="text/javascript" src="//ra.revolvermaps.com/0/0/6.js?i=0ni7luzu4ll&amp;m=0&amp;s=255&amp;c=ff0000&amp;cr1=ffffff&amp;f=arial&amp;l=0" async="async"></script>
      <a href="http://bit.ly/12REuTy"><img src="http://s11.flagcounter.com/count/12REuTy/bg_232323/txt_ffffff/border_343434/columns_4/maxflags_8/viewers_0/labels_0/pageviews_0/flags_0/" alt="Flag Counter" border="0"></a>
    </div>
    <div class="one_quarter">
      <h2 class="footer_title">Follow us on Facebook</h2>
      <div class="tweet-container">
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		</script>
		<div class="fb-like-box" data-href="<?=$facebook?>" data-width="240" data-height="300" data-show-faces="true" data-stream="false" data-header="true" data-colorscheme="dark"></div>
      </div>
    </div>
    <div class="one_quarter">
      <h2 class="footer_title">Contact Details</h2>
		<?
			echo "<table style='border-width:0px'>";
				$q=get_page_text_data(8);
						$count=0;
						while($data=mysql_fetch_assoc($q))
						{
							$contact_id=$data['id']; 	
							$contact=$data['heading']; 	
							$description=$data['content'];
							if(($count%2)==0)
							{
								echo "<tr>";
							}
							else
							{
								echo "<tr>";
							}
								echo "<td style='border-width:0px'>";
								echo "<b>".$contact."</b>";
								echo "</td>";
								echo "<td style='border-width:0px'>:</td>";
								echo "<td style='border-width:0px'>";
								display_multi_image($page_id,$contact_id);
								echo nl2br($description);
								display_multi_link($page_id,$contact_id);
								echo "</td>";
							echo "</tr>";
							$count++;
						}
			echo "</table>";
		?>
    </div>
  </div>
</div>
<div class="wrapper row4">
  <div id="copyright" class="clear">
    <p class="fl_left">Copyright &#169; <a href="http://<?php echo $domain; ?>" target="_blank"><?php echo $companyname; ?></a>. All rights reserved.</p>
    <p class="fl_right">  Developed by <a href="http://www.uniquewebers.com/" target="_blank">Unique Webers Ltd.</a></p>
  </div>
</div>
<!-- Scripts -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.min.js"></script>
<script>window.jQuery || document.write('<script src="layout/scripts/jquery-latest.min.js"><\/script>\
<script src="layout/scripts/jquery-ui.min.js"><\/script>')</script>
<script>jQuery(document).ready(function($){ $('img').removeAttr('width height'); });</script>
<script src="layout/scripts/responsiveslides.js-v1.53/responsiveslides.min.js"></script>
<script src="layout/scripts/jquery-mobilemenu.min.js"></script>
<script src="layout/scripts/custom.js"></script>
</body>