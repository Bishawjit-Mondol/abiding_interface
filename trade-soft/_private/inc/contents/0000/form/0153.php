<div>
<?php 

	$flag = false;

	$id =req('id'); 


	if(true){

		$query = "CALL ___view_transaction($id);";

		$det = $qur->custom_select_query($query);

		$bdet = $qur->custom_select_query("SELECT * FROM transaction_details t WHERE idtransaction = $id AND transaction_bank IS NOT NULL");

		$type = $qur->custom_select_query("SELECT transaction_type FROM transaction WHERE idtransaction = $id");

		if(count($bdet)>0){

			$bank_from = $qur->custom_select_query( "SELECT bank_name_en FROM bank WHERE idbank = ".$det[0][18] );

		}
?>

<div class="bs-example table-responsive ">



<div class="form-group" hidden>
	<div class = 'col-lg-2'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-chalan-secial"><i class = 'fa fa-print'></i> </span>

								</div>                  
							</div>        
</div>
<br/>
 	
<?php
 	} else 
		{ $error = $qur->custom_select_query("SELECT @software_error"); 
     			echo ($lang ?   " ব্যর্থ হয়েছে " : "Failed To Do :  ").$error[0][0];
		}
 ?>


<div id = 'page_print_231'>



<div class="print_reportx " style = 'disply:none'>

<div class = 'chalan_print_try <? if(!$fpp){ echo 'pagebreak'; } ?>' >
	<table class='recipt' align = 'center' width = '400px'>
		<tr class='onlyprint'><td colspan='2' class='pspace'></td></tr>
		<tr height="100px"><td valign="top" align = 'center' colspan = '2' class='banner'><h3> Bill / Vouchar </h3></td></tr>
		
		<tr>

			  <td >
		
				<table class = '' width = '100%'  >
					  <tr>
					     <td  width = '30%'><?php echo($lang == 1 ? "ভাউচার নং" : " Vouchar No");?> </td>
						 <td  width = '20%'> : <?php echo $det[0][0];?></td>
						 <td  width = '50%' align='right' ><?php echo($lang == 1 ? "তারিখ  :" : "Date  :");?><?php echo dateconvert($det[0][3]);?></td>
					  </tr>

					  <tr>
					      <td><?php echo($lang == 1 ?  "খাত " : "Head of accounts");?> </td>
						  <td> : </td>
						  <td align='right' ><?php echo $det[0][15];?></td>
					  </tr>


					  <tr>
						<td> <?php echo $det[0][4] < 0 ? ($lang == 1 ? "গ্রহনকারী" : "Paid To") : ($lang == 1 ? "প্রদানকারী" : "Received From")   ;?> </td>
						<td> : </td>
						<td align='right' ><?php echo $det[0][6];?></td>
					  </tr>

					  <tr>
						<td> <?php echo($lang == 1 ? "লেনদেনের ধরন " : "Mode Of Payment");?></td>
						<td> : </td>
						<td align='right' ><?php echo($type[0][0] == 1 ? "Cash" : "Cheque ( ".$det[0][17].")"  ); ?></td>
					  </tr>
					
			<?php 		if(count($bdet)>0){  ?>
					  <tr>
						<td colspan = '2'> <?php echo($lang == 1 ? "ব্যাংক " : "Bank  :");?> <?php echo $bank_from[0][0];?></td>
						<td hidden> <?php echo($lang == 1 ? "ব্রাঞ্চের নাম " : "Branch  :");?> <?php echo ($det[0][19] && isset($det[0][19]) && $det[0][19] != NULL ? $det[0][19] : " - ")  ;?></td>
						<td align='right' > <?php echo($lang == 1 ? "চেকের তারিখ  :" : "Cheque Date  : ");?><?php echo dateconvert($det[0][22]);?></td>
					 </tr>
			<?php   } ?>	 
					 
				</table>
		      </td>
			  

		</tr>

		<tr><td colspan='2' class='onlyprint'><br/></td></tr>

		<tr><td colspan = '2'>
		  <table class='data' class="report-table" width="520px" height="180px" border = '1px'>

			<thead>
			<tr height="10px" >
				<td valign="top" width="30px"><?php echo ($lang == 1 ? "ক্রম " : "Sl");?></td>
				<td valign="top"><?php echo ($lang == 1 ? "বিস্তারিত " : "Description");?></td>
				<td valign="top"  width="90px"><?php echo ($lang == 1 ? "টাকা " : "Taka");?></td>
				
			</tr>

			</thead>
			<tbody>

			<tr>
				<td valign="top"><?php echo $inp->cb(1);?></td>
				<td valign="top"><?php echo $det[0][20]; ?></td>
				<td valign="top"><?php echo $det[0][4] > 0 ? $det[0][4] : -$det[0][4] ;?></td>
			</tr>
			<tr height="10px">
				<td valign="top" colspan="2" align="right"><?php echo ($lang == 1 ? "মোট = " : "Total ="); ?></td>
				<td valign="top"><?php echo $det[0][4] > 0 ? $det[0][4] : -$det[0][4]   ;?></td>
			</tr>

			</tbody>

		   </table>
		</td></tr>

		<tr class='onlyprint'>
			<td colspan='2'>
				<br>

				<table width="100%" border="0px">
					<tbody><tr><td><b>Taka In Word</b> : <?php echo ucwords(convert_number_to_words($det[0][4] > 0 ? $det[0][4] : -$det[0][4])); ?> Taka Only</td></tr>
					</tbody>
				</table>
				<br><br>

				<table width="100%" border="0px">
					<tbody><tr><td align="center">---------------------------<br><b>Recived By</b></td><td align="center">---------------------------<br><b>Approved By</b></td><td align="center">---------------------------<br><b>Paid By</b></td></tr>
					</tbody>
				</table>

			</td>
		</tr>
	</table>
	<br/>
<div class="form-group">
	<div class="col-lg-12">
								<div class="input-group margin-bottom-sm pull-right">
									<button class="btn btn-info print-money-recipt"> <i class="fa fa-print"></i> Print  </button>
								</div>                  
							</div>        
</div>
</div>

  

</div>
</div>

<?
function convert_number_to_words($number) {
    
    $hyphen      = '-';
    $conjunction = ' and ';
    $separator   = ', ';
    $negative    = 'negative ';
    $decimal     = ' point ';
    $dictionary  = array(
        0                   => 'zero',
        1                   => 'one',
        2                   => 'two',
        3                   => 'three',
        4                   => 'four',
        5                   => 'five',
        6                   => 'six',
        7                   => 'seven',
        8                   => 'eight',
        9                   => 'nine',
        10                  => 'ten',
        11                  => 'eleven',
        12                  => 'twelve',
        13                  => 'thirteen',
        14                  => 'fourteen',
        15                  => 'fifteen',
        16                  => 'sixteen',
        17                  => 'seventeen',
        18                  => 'eighteen',
        19                  => 'nineteen',
        20                  => 'twenty',
        30                  => 'thirty',
        40                  => 'fourty',
        50                  => 'fifty',
        60                  => 'sixty',
        70                  => 'seventy',
        80                  => 'eighty',
        90                  => 'ninety',
        100                 => 'hundred',
        1000                => 'thousand',
        1000000             => 'million',
        1000000000          => 'billion',
        1000000000000       => 'trillion',
        1000000000000000    => 'quadrillion',
        1000000000000000000 => 'quintillion'
    );
    
    if (!is_numeric($number)) {
        return false;
    }
    
    if (($number >= 0 && (int) $number < 0) || (int) $number < 0 - PHP_INT_MAX) {
        // overflow
        trigger_error(
            'convert_number_to_words only accepts numbers between -' . PHP_INT_MAX . ' and ' . PHP_INT_MAX,
            E_USER_WARNING
        );
        return false;
    }

    if ($number < 0) {
        return $negative . convert_number_to_words(abs($number));
    }
    
    $string = $fraction = null;
    
    if (strpos($number, '.') !== false) {
        list($number, $fraction) = explode('.', $number);
    }
    
    switch (true) {
        case $number < 21:
            $string = $dictionary[$number];
            break;
        case $number < 100:
            $tens   = ((int) ($number / 10)) * 10;
            $units  = $number % 10;
            $string = $dictionary[$tens];
            if ($units) {
                $string .= $hyphen . $dictionary[$units];
            }
            break;
        case $number < 1000:
            $hundreds  = $number / 100;
            $remainder = $number % 100;
            $string = $dictionary[$hundreds] . ' ' . $dictionary[100];
            if ($remainder) {
                $string .= $conjunction . convert_number_to_words($remainder);
            }
            break;
        default:
            $baseUnit = pow(1000, floor(log($number, 1000)));
            $numBaseUnits = (int) ($number / $baseUnit);
            $remainder = $number % $baseUnit;
            $string = convert_number_to_words($numBaseUnits) . ' ' . $dictionary[$baseUnit];
            if ($remainder) {
                $string .= $remainder < 100 ? $conjunction : $separator;
                $string .= convert_number_to_words($remainder);
            }
            break;
    }
    
    if (null !== $fraction && is_numeric($fraction)) {
        $string .= $decimal;
        $words = array();
        foreach (str_split((string) $fraction) as $number) {
            $words[] = $dictionary[$number];
        }
        $string .= implode(' ', $words);
    }
    
    return $string;
}
?>

