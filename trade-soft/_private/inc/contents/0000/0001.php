<?
	if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
			$page_title = ($lang ? "নতুন ক্রেতা " : "Add New Client");
            include 'form/'.req('sub').'.php';
        }
    }  
	die(); 
?>