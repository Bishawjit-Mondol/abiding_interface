<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " কর্মচারীর উপস্থিতি " : " Employee attendance " );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
