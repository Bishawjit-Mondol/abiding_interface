<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নিষ্ক্রিয়তার তথ্য" : "Inactivity Report");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
