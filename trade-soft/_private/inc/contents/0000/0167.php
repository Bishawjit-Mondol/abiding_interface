<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "সকল বিক্রয় তথ্য" : "All Sales Statement");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
