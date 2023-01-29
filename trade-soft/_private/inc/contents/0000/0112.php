<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " চেকের পাতা যোগ করুন" : "Add Cheque Leaf");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
