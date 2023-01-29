<?php 

//$server = true;
$ashraful = true;

if(isset($server) && $server){
        $h = "127.0.0.1"; $dn = "ATIL_14_2014_3"; $du = "root"; $dp = "1234";  	$lu = "root"; $lp = "1234"; 
}
else if( isset($ashraful) && $ashraful){
	$h = "127.0.0.1"; $dn = "abidingg_trad_apr_16"; $du = "abidingg_root"; $dp = "__mMnNbB12_x";  	$lu = "abidingg_root"; $lp = "__mMnNbB12_x"; 

}
else{
	$h = "127.0.0.1"; $dn = "bp"; $du = "root"; $dp = "";  $lu = "root"; $lp = ""; 
}

?>
