<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "সকল মজুদকৃত পণ্যের বই" : "All Stock book report");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>

