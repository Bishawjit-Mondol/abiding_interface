<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন গুদাম" : "Add New Godown");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
