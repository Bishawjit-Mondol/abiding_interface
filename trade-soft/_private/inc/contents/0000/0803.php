<?
    echo $bn = req('bn');
    if($bn>0){
    $det = $qur->custom_select_query("SELECT * FROM cheque_leaf WHERE cheque_leaf_status = 0 AND idbank = 32 ORDER BY cheque_leaf_pre, cheque_leaf_sl;")	
	$i = 0;
    foreach($det as $d){
	    $ra[$i]['id'] = $d[0];
    	    $ra[$i]['num'] = $d[1];
	    $i++;
    }
	$reutrn_array['cl'] = $ra;

    echo json_encode($return_array);
	}
?>
