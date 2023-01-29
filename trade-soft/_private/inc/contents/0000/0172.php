<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "চীন থেকে ক্রয়" : "Purchase From China");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
