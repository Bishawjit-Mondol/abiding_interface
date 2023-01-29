<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "মজুদ সমন্বয়" : "Stock Adjustment");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
