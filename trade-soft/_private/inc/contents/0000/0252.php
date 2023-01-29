<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "ব্যাবহারকারীকে চিহ্নিত করা" : "Assign User");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
 