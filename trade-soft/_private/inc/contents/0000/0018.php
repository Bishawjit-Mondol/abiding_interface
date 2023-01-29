<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "কর্মকর্তা / কর্মচারী সাথে লেনদেন" : "Transaction With Employee ");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
