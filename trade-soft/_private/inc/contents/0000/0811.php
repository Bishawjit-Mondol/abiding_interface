<?
    $reutrn_array = array();
    $ra = array();
	$ra[0]['pipe'] = 0;
	$ra[1]['fittings'] = 0;
	$pr = req('pr');
    if($pr > 0){
		$qr =  "SELECT * FROM (SELECT 1 as type, 'pipe' as cat, sales_discount_p_rate FROM (SELECT * FROM sales s WHERE idcompany = $pr ) as a LEFT JOIN sales_details USING(idsales) WHERE sales_discount_p_rate > 0  ORDER BY sales_date DESC LIMIT 1) as a
UNION
SELECT * FROM (SELECT 2 as type, 'fitt' as cat, sales_discount_f_rate FROM (SELECT * FROM sales s WHERE idcompany = $pr ) as a LEFT JOIN sales_details USING(idsales) WHERE sales_discount_f_rate > 0  ORDER BY sales_date DESC LIMIT 1) as b";

		$det = $qur->custom_select_query($qr);
		foreach($det as $d){
			if($d[0]==1){
				$ra[0]['pipe'] =  sprintf("%.2f",$d[2]);
			}
			if($d[0]==2){
				$ra[1]['fittings'] =  sprintf("%.2f",$d[2]);
			}
		}
    }
    echo json_encode($ra);
?>
