<h3>Change User Page Access</h3>
<br/><br/>
<?php
	
	if($_REQUEST['ab']){
		include 'process/'.req('sub').".php";
	}
	include 'form/'.req('sub').".php";
?>
