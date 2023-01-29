<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ? "ক্রেতা অনুসারে বিক্রয় রিপোর্ট" : "Customer-wise Sales Report");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
