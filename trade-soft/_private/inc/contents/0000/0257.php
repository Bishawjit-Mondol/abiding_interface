<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " শোরুম যোগ করুন " : " Add Showroom" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
