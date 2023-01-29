<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "তারিখ অনুযায়ী বিক্রয় তথ্য" : "Date-Wise Sales Statement");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
