<?
	if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
			$page_title = ($lang ? "বিক্রেতা সংশোধন" : "Edit Supplier");
            include 'form/'.req('sub').'.php';
        }
    }  
	die(); 
?>