<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	  $page_title = ($lang ?  "ক্রয় মুছে ফেলা  " : "Deleting Purchase");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
