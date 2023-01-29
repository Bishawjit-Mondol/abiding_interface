<?
    if(isset($_REQUEST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "ক্রয় সংশোধন" : "Edit Purchase" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
