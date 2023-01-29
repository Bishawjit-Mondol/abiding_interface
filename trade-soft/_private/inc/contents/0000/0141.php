<?
	if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
			$page_title = ($lang ?  "ক্রেতার তালিকা " : "Client List");
            include 'form/'.req('sub').'.php';
        }
    }  
	die(); 
?>