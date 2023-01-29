<?
	if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
			$page_title = ($lang ? "ক্রেতা সংশোধন" : "Edit Client");
            include 'form/'.req('sub').'.php';
        }
    }  
	die(); 
?>