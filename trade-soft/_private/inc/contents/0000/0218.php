<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " বিক্রেতার খতিয়ান" : " Supplier ledger" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
