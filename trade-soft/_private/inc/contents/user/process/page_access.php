<?
	$id = req('id');
	$n = req('num');
	
	$qa = array();

	for($i = 0; $i<$n; $i++){
		$qa[$i] = "UPDATE ___user_menu SET status = ".req('c'.$i)." WHERE iduser = ".$id." AND idsubmenu = ".req('s'.$i);
	}

	$flag = true;
    	$qur->execute('START TRANSACTION');
  
	foreach($qa as $a){
		if($flag){
			$flag = $qur->execute($a);
		}
		else{
			$flag = false;
			break;
		}
	}
  if($flag){
        $qur->con->commit();
        $msg = ($lang ?  "সফলভাবে সম্পন্ন হয়েছে।" : "Successfully Done." );

    }
    else{
        $qur->con->rollback(); 
        $msg = ($lang ?  "দু:খিত, ব্যর্থ হয়েছে ।" : "Failed to do." );
    }

?>


<? if($flag){ ?>
<div id = 'successfull' >
    <h3 class='green'> <?=$msg;?></h3><br/>
    <br/>
</div>

<? } else { ?>

<div id = 'failed' >
    <h3 class='red'> <?=$msg;?></h3><br/>				
</div>
<? } ?>
<div id = 'res_pros' style='display:none'><?=$flag;?></div>


