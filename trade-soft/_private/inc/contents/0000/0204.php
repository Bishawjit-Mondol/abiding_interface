<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "" : "ledger");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
