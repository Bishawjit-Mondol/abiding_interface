<?php
if (!empty($_POST['searchword'])) {
  $searchword =  htmlentities(stripslashes($_POST['searchword']));
} else {
  $searchword = "";
}
//$searchword = htmlentities(stripslashes($_POST['searchword']))
?>
<form action="index.php?page=search" method="POST" />
<input type="text" name="searchword" value="<?php echo $searchword; ?>" placeholder="Search" required style="width:200px;display:inline" /><input type="submit" name="search" value="GO" />
</form>