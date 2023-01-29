<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "ক্রয় ফেরতের তথ্য" : "Purchase Return History");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
