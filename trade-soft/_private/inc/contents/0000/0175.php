<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "বিক্রয় খতিয়ান" : "Sales Ledger");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
