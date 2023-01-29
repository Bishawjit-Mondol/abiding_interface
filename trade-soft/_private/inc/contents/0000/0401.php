<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "ক্রেতার সম্পূর্ন তথ্য" : "Full Details of Client");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
