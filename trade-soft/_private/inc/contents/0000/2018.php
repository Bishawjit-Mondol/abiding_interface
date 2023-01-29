<?php 
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন পন্য বিক্রয়" : "New Sales" ); // Barcode Sale
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
