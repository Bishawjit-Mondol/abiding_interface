<?
    if(isset($_REQUEST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন কর্মকর্তা / কর্মচারী" : "Add New Employee");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
