<?php
    if(isset($_REQUEST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
			$page_title = (($lang ?  "পাওনার হিসাব করা" : "Generate Payable"));
            include 'form/'.req('sub').'.php';
        }
    }
  die();                
?>
