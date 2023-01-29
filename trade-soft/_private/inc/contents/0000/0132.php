<?php 
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "বিক্রয় ফেরৎ রিপোর্ট " : "Sales Return Report");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
