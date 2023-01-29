<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "বিক্রয় সারমর্ম" : "Sales Summery");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>

