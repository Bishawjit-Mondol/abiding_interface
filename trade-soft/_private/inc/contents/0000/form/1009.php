<? if(!req('type')){?>
    <div class = 'header' id = 'header<?=req('sub');?>'>
    </div>
    <div class = 'result' id = 'result<?=req('sub');?>' ></div> 
<? } ?>

<?
	$query = "SELECT * FROM ___view_show_employee;";
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<table id = 'client_1007' class = 'rb' width = '1000px'>

	<tr class = 'contain_filter_1008' >
		<td><?=($lang ? 'ক্রম' : 'Sl');?></td>
		<td>
			<?=($lang ? 'নাম' : "Name");?>
		</td>
		<td>
			<?=($lang ? 'পদবী' : 'Designation');?>
		</td>
		<td>
			<?=($lang ? 'বেতন' : 'Sallary');?>
		</td>

		<td>
			<?=($lang ? 'পাওনা' : 'Recivable');?>
		</td>
		<td>
			<?=($lang ? 'দেনা' : 'Payable');?>
		</td>

	</tr>
<? foreach($det as $d){ ?>
	<tr>	
		<td><?=cb($inp,++$i);?></td>
		<td><?=$d[1];?></td>
		<td><?=$d[2];?></td>
		<td><?=cb($inp,two_dec($d[4]));?></td>
		<? if($d[3]>=0){ ?>
		<td><?=cb($inp,two_dec($d[3]));?></td>
		<td><?=cb($inp,two_dec(0));?></td>
		<? }else{ ?>
		<td><?=cb($inp,two_dec(0));?></td>
		<td><?=cb($inp,two_dec(-$d[3]));?></td>

		<? } ?>

	</tr>
<? } ?>
</table>
