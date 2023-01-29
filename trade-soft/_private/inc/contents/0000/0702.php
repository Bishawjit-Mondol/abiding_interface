<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	  $page_title = ($lang ?  "বিক্রয় মুছে ফেলা  " : "Sales Deleting");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
