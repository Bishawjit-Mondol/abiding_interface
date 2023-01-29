<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
        	$page_title = ($lang ?  "খাত অনুসারে খরচ " : "Expense Overhead");
			include 'form/'.req('sub').'.php';
	    }
    }
	die();        
?>
