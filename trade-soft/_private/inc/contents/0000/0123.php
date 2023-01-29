<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন পন্য বিক্রয়ের অর্ডার" : "Proposed Receive Statement");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
