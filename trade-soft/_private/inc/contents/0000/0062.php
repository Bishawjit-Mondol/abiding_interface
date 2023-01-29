<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "মজুদ স্থানান্তর " : "Propose to Stock Transfer");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>

