<?php
	$page=$_GET['page'];
	if($page)
	{
		$page_info=get_page_info($page);
		$page_id=$page_info['id'];
		$page_visual=rep_br_sp($page_info['visual']);
		$page_pagetype_id=$page_info['pagetype_id'];
		$page_pagetype=get_page_type($page_pagetype_id);
		if($_GET['p'])
		{
			$p=$_GET['p'];
		}
		else
		{
			$p=null;
		}
		
		$path="inc/content/".$page.".php";
		
		if($p=="priority"&&$page_id)
		{
			include("inc/content/common_priority.php");
		}
		elseif($p=="edit"&&$page_id)
		{
			include("inc/content/common_edit.php");
		}
		elseif($p=="editp"&&$page_id)
		{
			include("inc/content/people_edit.php");
		}
		elseif($p=="edit_soft"&&$page_id)
		{
			include("inc/content/soft_edit.php");
		}
		elseif($page_id&&$page_pagetype_id)
		{
			include("inc/content/".$page_pagetype.".php");
		}
		elseif(($page_common==0)&&(file_exists("$path"))&&($p==null))
		{
			include("$path");
		}
		else
		{
			include("inc/content/default.php");
		}
	}
	else
    {
		if($soft&&(($logeduserlevel==1)||($logeduserlevel==2)))
			include("inc/content/main.php");
		else
			include("inc/content/edit.php");
    }
?>