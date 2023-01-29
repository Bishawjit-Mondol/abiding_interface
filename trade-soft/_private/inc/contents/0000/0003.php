<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
			$page_title = ($lang ? "নতুন পদবী" : "Add New Post");
            include 'form/'.req('sub').'.php';
        }
    } 
	die();
?>