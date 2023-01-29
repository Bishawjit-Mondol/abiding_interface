<?php
	if($say==1){
		echo "<h2 class='red'>Please Select proper options and fill all Fields.</h2>
					<h2 class='blue' id='loading'><img src='../images/loading.gif' alt='Loading'></h2>";
	}
	elseif($say==2){
		echo "<h2 class='green'>Changes Saved.</h2>
					<h2 class='blue' id='loading'><img src='../images/loading.gif' alt='Loading'></h2>";
	}
	elseif($say==3){
		echo "<h2 class='red'>Could not save changes.</h2>
			<h2 class='blue' id='loading'><img src='../images/loading.gif' alt='Loading'></h2>";
	}
	elseif($say==4){
		echo "<h2 class='red'>Image has an error.</h2>
			<h2 class='blue' id='loading'><img src='../images/loading.gif' alt='Loading'></h2>";
	}
	elseif($say==5){
		echo "<h2 class='red'>File too large for web or incorrect format.</h2>
					<h2 class='blue' id='loading'><img src='../images/loading.gif' alt='Loading'></h2>";
	}
	elseif($say==6){
		echo "<h2 class='blue'>New Field Added.</h2>
					<h2 class='blue' id='loading'><img src='../images/loading.gif' alt='Loading'></h2>";
	}
	elseif($say==6){
		echo "<h2 class='blue'>Post Successfuly Deleted</h2>
					<h2 class='blue' id='loading'><img src='../images/loading.gif' alt='Loading'></h2>";
	}
	else{
		echo "<h2 class='blue' id='loading'><img src='../images/loading.gif' alt='Loading'></h2>";
	}
?>