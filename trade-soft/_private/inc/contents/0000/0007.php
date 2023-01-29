<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "নতুন অাই, ও, ইউ একাউন্ট" : "Add I.O.U. Account");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
