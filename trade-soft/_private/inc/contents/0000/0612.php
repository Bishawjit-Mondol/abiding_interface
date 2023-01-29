<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন পণ্য" : "Add New Product");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
