<?
    if(isset($_REQUEST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "বিক্রয় সংশোধন" : "Edit Sales" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
