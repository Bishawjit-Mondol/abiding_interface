<?php
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "সরবরাহকারী সাথে লেনদেন" : "Transaction With Supplier ");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
