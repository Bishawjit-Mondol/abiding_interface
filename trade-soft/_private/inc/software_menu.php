<? /* ----------------------------------------------------------------------------*/ ?>         
<? /* Software menu Start  */ ?>

<?php

	if($usertype==0){  
		include("_private/inc/___software_menu0.php");   /* Management (Bus.) */
	}
 
	if($usertype==1){  
		include("_private/inc/___software_menu1.php");   /* Management(IT) */
	}
	elseif($usertype==2){
		include("_private/inc/___software_menu2.php");   /* Admin */
	}
	elseif($usertype==3){
		include("_private/inc/___software_menu3.php");   /* Accounts */
	}
	elseif($usertype==4){
		include("_private/inc/___software_menu4.php");   /* Sales */
	}
	elseif($usertype==5){
		include("_private/inc/___software_menu5.php");   /* Marketing */
	}
	elseif($usertype==6){
		include("_private/inc/___software_menu6.php");   /* Stock */
	}

?>

<? /* ----------------------------------------------------------------------------*/ ?>
<? /* Software menu end  */ ?>
