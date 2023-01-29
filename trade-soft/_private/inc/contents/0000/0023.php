<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "পণ্যের পরিবর্তন" : "Product Conversion");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
