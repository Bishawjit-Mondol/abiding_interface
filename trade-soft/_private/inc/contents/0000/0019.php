<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "স্বত্বাধিকারীর সাথে লেনদেন" : "Transaction With Propiter");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
