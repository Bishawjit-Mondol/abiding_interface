<?
    if(isset($_REQUEST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "কর্মকর্তা / কর্মচারীর তালিকা" : "Employee List");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
