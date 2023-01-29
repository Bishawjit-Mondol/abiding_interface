<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "কমিশন গ্রহীতা যোগ করুন" : "New Commission Receiver");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>