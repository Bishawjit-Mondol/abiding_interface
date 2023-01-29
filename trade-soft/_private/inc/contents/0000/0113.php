<?php
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " অ্যাকাউন্টের খতিয়ান " : "A/C Ledger");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
