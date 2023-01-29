<?php 
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " আগাম চেক " : "Advance cheque");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
