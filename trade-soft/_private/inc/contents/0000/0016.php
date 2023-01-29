<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন লেনদেনের খাত" : "Add New Transaction Head");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
