<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "চালান" : "Make Chalan");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
