<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " বিক্রয় ফেরতের পূর্বের তথ্য" : " Sales return history " );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
