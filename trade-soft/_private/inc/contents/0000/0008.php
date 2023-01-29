<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন ব্যাংক একাউন্ট" : "Add Bank Account");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
