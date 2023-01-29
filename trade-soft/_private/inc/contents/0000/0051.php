<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ? "সরবরাহকারী অনুসারে ক্রয় রিপোর্ট" : "Supplier-wise Purchase Report");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
