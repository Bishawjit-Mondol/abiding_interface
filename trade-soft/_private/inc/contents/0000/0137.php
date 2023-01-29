<?php
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " আগাম চেক সংশোধন করুন " : "Edit Transaction On Cheque Receive");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
