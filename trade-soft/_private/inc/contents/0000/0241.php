<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " সরবরাহকারীর ব্যালেন্স " : "Supplier balance");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
