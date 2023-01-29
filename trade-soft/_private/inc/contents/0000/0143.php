<?
	if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
			$page_title = ($lang ?  "বিক্রেতার তালিকা " : "Supplier List");
            include 'form/'.req('sub').'.php';
        }
    }  
	die(); 
?>