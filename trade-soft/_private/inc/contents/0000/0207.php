<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন পন্য ক্রয়" : "Employee List");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
