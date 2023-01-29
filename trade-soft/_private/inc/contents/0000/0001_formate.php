<?
    if(!req('type')){
	$col_size = 12;
        $page_title = ($lang ?  "নতুন ইউনিট" : "Add New Unite" );
    }
?>

<?
    if(isset($_POST['ab'])){
            include 'process/'.req('sub').'.php';
    }
    else{
        if(!req('type')){
	    include '_private/inc/entry_box_header.php';
            include 'form/'.req('sub').'.php';
            include '_private/inc/entry_box_footer.php';
        }
    }        
?>
 
