<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন পন্য বিক্রয়" : "Propose to sales" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
