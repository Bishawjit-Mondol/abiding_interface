<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ? "নতুন ইউনিট" : "Add New Unite");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
