<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "সকল ক্রয় তথ্য" : "All Purchase Statement");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
