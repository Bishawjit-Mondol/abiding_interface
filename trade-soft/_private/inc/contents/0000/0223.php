<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "-" : " Employee sales statement" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
