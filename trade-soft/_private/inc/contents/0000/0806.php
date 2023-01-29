<?
    $reutrn_array = array();
    $ra = array();
	$ra[0]['cs'] = 0;
	$pr = req('pr');
    if($pr > 0){
		$qr =  "SELECT ammount FROM pestablishment_product p WHERE idproduct = $pr AND idpestablishment = 1 LIMIT 1;";
		$det = $qur->custom_select_query($qr);
		$ra[0]['cs'] =  sprintf("%.2f",$det[0][0]);
    }
    echo json_encode($ra);
?>
