<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "পাসওয়ার্ড সংশোধন করুন" : "Change Password");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>

