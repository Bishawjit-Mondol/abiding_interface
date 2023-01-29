<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " কর্মচারী ব্যালেন্স " : " Employee balance");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
