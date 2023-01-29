<?php
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "প্রস্তাবিত ক্যেশ লেনদেন" : "Cash Transaction Proposed");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
