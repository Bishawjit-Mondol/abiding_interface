<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন ব্যাবহারকারী" : "New User");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
 