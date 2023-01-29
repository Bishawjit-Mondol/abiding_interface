<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "লোনের তথ্য" : " Loan statement" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
