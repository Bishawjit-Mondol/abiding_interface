<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন মেশিন" : "Add Machine");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>

