<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	  $page_title = ($lang ?  "আগাম চেক মুছে ফেলা  " : "Advance cheque Deleting");
			  include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
