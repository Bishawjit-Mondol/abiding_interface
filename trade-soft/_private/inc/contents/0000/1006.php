<?
    if(!req('type')){
        $page_title = ($lang ?  "ক্যাশ / ব্যাংক স্ট্যেটম্যেন্ট" : "Cash / Bank Statement" );
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
 
