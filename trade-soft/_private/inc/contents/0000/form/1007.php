<? if(!req('type')){?>
    <div class = 'header' id = 'header<?=req('sub');?>'>
    </div>
    <div class = 'result' id = 'result<?=req('sub');?>' ></div> 
<? } ?>

<?
	$query = "SELECT * FROM ___view_show_client ;";
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<table id = 'client_1007' class = 'rb' width = '1000px'>

	<tr class = 'contain_filter_1008' >
		<td><?=($lang ? 'ক্রম' : 'Sl');?></td>
		<td>
			<?=($lang ? 'ক্রেতার নাম' : "Client's Name");?>
		</td>
		<td>
			<?=($lang ? 'মূল্যহ্রাসের হার' : 'Discount Rate');?>
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
		<td><?=++$i;?></td>
		<td><?=$d[1];?></td>
		<td><?=cb($inp,$d[4]);?>%</td>
		<? if($d[2]>=0){ ?>
		<td><?=cb($inp,$d[2]);?></td>
		<td><?=cb($inp,0.00);?></td>
		<? }else{ ?>
		<td><?=cb($inp,0.00);?></td>
		<td><?=cb($inp,-$d[2]);?></td>

		<? } ?>

	</tr>
<? } ?>
</table>
