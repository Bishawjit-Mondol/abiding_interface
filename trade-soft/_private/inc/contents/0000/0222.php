<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  " কমিশন গ্রহনকারীর সাথে লেনদেন" : " Transaction With Commission Receiver" );
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
