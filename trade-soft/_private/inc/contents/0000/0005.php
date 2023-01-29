<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন পণ্যের ধরণ" : "Add New Product Catagory");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>

