<?php
	function bfn($num,$d=2){
		$num=sprintf("%.".$d."f",$num);
		$num_a=explode('.',$num);
		$num_h=$num_a[0];
		$num_f=$num_a[1];	
		$num_s="";
		if($num_h){
			$m=3;
			for($i=(strlen($num_h)-1);$i>-1;$i--){
				$num_s=$num_h[$i].$num_s;
				if(!$num_h[$i+1]){
					$num_s=$num_s.".";
				}
				elseif(($i==(strlen($num_h)-$m))&&$i!=0){
					$num_s=",".$num_s;
					$m=$m+2;
				}
			}
		}
		else{
			$num_s=$num_s."0.";
		}
		$num_s=$num_s.$num_f;
		return $num_s;
	}
	
	$x=66543213.5678;
	echo $x;
	echo "<br/>";
	echo bfn($x,3);
?>