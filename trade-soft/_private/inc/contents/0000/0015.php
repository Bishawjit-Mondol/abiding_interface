<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "স্টাফদের পাওনা অনুমদন" : "Grant Staff payment");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>

