<?php
  {
    $section=$section."/".$page;
    $page=$sub;
  }
  if($page)
  {
    $path="_private/inc/".$section."/".$page.".php";
    if(file_exists("$path"))
    {
	if(true){
		function cb($inp,$con){
			return $inp->convert_bangla($con);
		}
      		include("$path");
	}
	else{
      		include("_private/inc/contents/worng_page.php");
	}
    }
    else
    {
      include("_private/inc/contents/default.php");
    }
  }
  else
  {
    include("_private/inc/".$section."/home.php");
  }
?>

