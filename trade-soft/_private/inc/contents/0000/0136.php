<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "একাউন্ট ব্যালেন্স" : "A/C Balance");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
