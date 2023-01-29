<?php
    if(isset($_REQUEST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
            $page_title = ($lang ?  "কর্মকর্তা / কর্মচারীর পাওনা অনুমোদন" : "Employee Grant");
            include 'form/'.req('sub').'.php';
        }
    }
  die();                
?>
