<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "অন্যান্যদের সাথে লেনদেন" : "Transaction With Other");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
