<?php
if ($page) {
	$path = "_private/inc/content/" . $page . ".php";
	if (($page_pagetype_id < 1) && (file_exists("$path"))) {
		include("$path");
	} elseif ($page_id && $page_pagetype) {
		include("_private/inc/content/" . $page_pagetype . ".php");
	} else {
		include("_private/inc/content/default.php");
	}
} else {
	include("_private/inc/content/home.php");
}
