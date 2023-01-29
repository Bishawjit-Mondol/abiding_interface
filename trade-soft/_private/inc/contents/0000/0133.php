<?php 
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "বিক্রয়ের রিপোর্ট" : "Purchase Report");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
