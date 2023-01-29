<?php 
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " কর্মকর্তা / কর্মচারীর খতিয়ান" : "Employee ledger" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
