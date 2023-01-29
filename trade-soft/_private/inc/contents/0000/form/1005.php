<? if(!req('type')){?>
    <div class = 'header' id = 'header<?=req('sub');?>'>
    </div>
    <div class = 'result' id = 'result<?=req('sub');?>' ></div> 
<? } ?>

<?
	$query = "SELECT idpoint_account,idtype_account,point_account_name,point_account_current_balance FROM point_account ORDER BY idtype_account;";
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<table id = 'stock_1003' class = 'rb' width = '1000px'>

	<tr class = 'contain_filter_1003' >
		<td><?=($lang ? 'ক্রম' : 'Sl');?></td>
		<td>
			<?=($lang ? 'ধরন' : 'Type');?>
		</td>

		<td>
			<?=($lang ? 'নাম' : 'Name');?>
		</td>
		<td>
			<?=($lang ? 'ব্যালেন্স' : 'Balance');?>
		</td>

	</tr>
<? foreach($det as $d){ ?>
	<tr>	
		<td><?=++$i;?></td>

		<td class = 'product_type notforprint'><?
			if($d[1]==1){
				echo ($lang ? 'ব্যাংক' : 'Bank');
			}
			else if($d[1]==0){
				echo ($lang ? 'ক্যাশ' : 'Cash');

			}
			else if($d[1]==2){
				echo ($lang ? 'অগ্রীম চেক' : 'Advance Cheque');

			}
		?></td>
		<td><?=$d[2];?></td>
		<td><?=$inp->convert_bangla(two_dec(($d[3])));?></td>


	</tr>
<? } ?>
</table>
