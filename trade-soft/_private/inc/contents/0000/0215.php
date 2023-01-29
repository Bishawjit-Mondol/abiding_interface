<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "মজুদ কৃত পণ্যের আসা যাওয়ার লগ" : "Stock Input output log" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
