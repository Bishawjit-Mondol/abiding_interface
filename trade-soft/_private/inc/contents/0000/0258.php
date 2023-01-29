<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " গুদাম যোগ করুন " : " Add Godown" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
