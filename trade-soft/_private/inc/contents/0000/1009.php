<?
    if(!req('type')){
        $page_title = ($lang ?  "কর্মকর্তা / কর্মচারীর তালিকা" : "Employee's List" );
        echo "<div class = 'page_head' id = 'page_head".req('sub')."' style='display:none'>$page_title</div>";
    }
?>

<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if( req('type') != 'ok' ){
            include 'form/'.req('sub').'.php';
        }
    }        
?>
 
