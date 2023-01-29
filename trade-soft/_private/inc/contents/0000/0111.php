<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " ক্রেতার সাথে লেনদেন" : "Transaction With Client");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
