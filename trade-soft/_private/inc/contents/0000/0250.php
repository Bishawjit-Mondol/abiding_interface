<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ? " পণ্য সংশোধন " : "Edit product");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
 