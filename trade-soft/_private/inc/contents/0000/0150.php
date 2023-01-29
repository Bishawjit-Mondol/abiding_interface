<?php
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " লেনদেনের প্রস্তাব " : "Proposed Transaction");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
