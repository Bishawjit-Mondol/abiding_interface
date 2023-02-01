<?php
if (!empty($_POST['searchword'])) {
  $searchword =  htmlentities(stripslashes($_POST['searchword']));
} else {
  $searchword = "";
}
//$searchword = htmlentities(stripslashes($_POST['searchword']));
?>
<form action="index.php?page=search" method="POST" class="searchform" />
<input type="text" name="searchword" class="searchword" value="<?php echo $searchword; ?>" placeholder="Search" required /><input type="submit" name="search" class="searchsubmit" value="GO" />
</form>