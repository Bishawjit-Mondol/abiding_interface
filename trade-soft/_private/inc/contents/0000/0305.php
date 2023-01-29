<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "বারকোড প্রিন্ট" : "Barcode Print");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
