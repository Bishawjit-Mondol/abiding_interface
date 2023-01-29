<?
	$d1= req_date('d1');
	$d2= req_date('d2');
	$id = req('p')/1;

	$previous_bal = $qur->custom_select_query("SELECT ___show_point_account_past_balance($id,'".$d2."');");
	$pbal = $previous_bal[0][0];

	$query = "CALL ___show_cash_bank_statement($id,'".$d2."','".$d1."');";
	$det = $qur->custom_select_query($query);

?>
<div class = 'report'>
    <img src='images/blank1by1.gif' width='1200px' height='1px'/>

<table class = 'rb' width = '95%'>
	<tr>
		<td><?=($lang?"তারিখ":"Date");?></td>
		<td><?=($lang?"একাউন্ট":"Account");?></td>
		<td><?=($lang?"খাত":"Head");?></td>
		<td><?=($lang?"সাথে / থেকে ":"With");?></td>
		<td><?=($lang?"গ্রহন":"Recived");?></td>
		<td><?=($lang?"প্রদান":"Payment");?></td>
		<td><?=($lang?"ব্যালেন্স":"Balance");?></td>
		<td><?=($lang?"অন্যান্য":"Others");?></td>
	</tr>
	<tr>
		<td colspan = '4'><?=($lang?"সাবেক":"Previous Balance");?></td>
		<td colspan = '4'><?=cb($inp,two_dec($pbal));?></td>
	</tr>
<? foreach($det as $d){ ?>
	<tr>
		<td><?=cb($inp,dc($d[1]));?></td>
		<td><?=$d[2];?></td>
		<td><?=$d[3];?></td>
		<td><?=$d[4];?></td>
		<td><?=cb($inp,two_dec($d[5]));?></td>
		<td><?=cb($inp,two_dec($d[6]));?></td>
		<td><? $pbal = $pbal + $d[5] - $d[6]; echo cb($inp,two_dec($pbal));?></td>
		<td> </td>
	</tr>
<? } ?>
</table>
</div>
<div class = 'res_pros' id = 'res_pros<?=req('sub');?>' style='display:none'>1</div>

<? 

              /*

    

            DETAILS OF idproduct


            column default value  :  undefined,
            can null be assigned  :  NO,
            data type             :  int(10) unsigned,
            character set         :  undefined,
            key type              :  PRI,
            additional info       :  auto_increment,
            comments on db        :  id for any product.
             

      

            DETAILS OF product_type


            column default value  :  undefined,
            can null be assigned  :  NO,
            data type             :  tinyint(3) unsigned,
            character set         :  undefined,
            key type              :  undefined,
            additional info       :  nothing,
            comments on db        :  1 raw matterial, 2 work in process, 3 finished product.
             

      

            DETAILS OF product_name


            column default value  :  undefined,
            can null be assigned  :  NO,
            data type             :  varchar(64),
            character set         :  utf8_general_ci,
            key type              :  UNI,
            additional info       :  nothing,
            comments on db        :  name of this product.
             

      

            DETAILS OF idunite


            column default value  :  undefined,
            can null be assigned  :  NO,
            data type             :  tinyint(3) unsigned,
            character set         :  undefined,
            key type              :  MUL,
            additional info       :  nothing,
            comments on db        :  nothing.
             

      

            DETAILS OF product_description


            column default value  :  undefined,
            can null be assigned  :  NO,
            data type             :  varchar(128),
            character set         :  utf8_general_ci,
            key type              :  undefined,
            additional info       :  nothing,
            comments on db        :  any descriptiontion regarding product.
             

      

            DETAILS OF product_mrp


            column default value  :  undefined,
            can null be assigned  :  NO,
            data type             :  double,
            character set         :  undefined,
            key type              :  undefined,
            additional info       :  nothing,
            comments on db        :  sales price of this product.
             

      

            DETAILS OF product_mpp


            column default value  :  undefined,
            can null be assigned  :  NO,
            data type             :  double,
            character set         :  undefined,
            key type              :  undefined,
            additional info       :  nothing,
            comments on db        :  purchase price of this product.
             

      

            DETAILS OF product_status


            column default value  :  1,
            can null be assigned  :  NO,
            data type             :  tinyint(1),
            character set         :  undefined,
            key type              :  undefined,
            additional info       :  nothing,
            comments on db        :  1 active 2 iactive.
             

      

              */
?>                            


