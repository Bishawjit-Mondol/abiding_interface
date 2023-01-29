<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	  $page_title = ($lang ?  "লেনদেন মুছে ফেলা  " : "Deleting Transaction");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
