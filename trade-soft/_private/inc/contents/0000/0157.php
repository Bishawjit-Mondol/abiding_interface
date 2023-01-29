<?
    if(isset($_REQUEST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "ক্রয় ফেরত" : "Purchase Return");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
