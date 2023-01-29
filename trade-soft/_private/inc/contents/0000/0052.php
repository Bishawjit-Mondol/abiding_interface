<?
	$id = req('id')>0 ? req(id) : 0; 
	$d1 = req('d1');
	$d2 = req('d2');
	$query = "CALL ___view_purchase_report($id, '$d2', '$d1');"; //echo $query;
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<table class="table table-striped table-hover">
				       <tbody>
	<tr class = 'table_head'>
		<th><?=($lang ? 'ক্রম' : 'Sl');?></th>
		<th><?=($lang ? 'Invoice No.' : 'Invoice No.');?></th>
		<th><?=($lang ? 'তারিখ' : 'Date');?></th>
		<th><?=($lang ? 'ক্রেতার নাম' : 'Client Name');?></th>
		<th><?=($lang ? 'বিল' : 'Bill amount');?></th>
		<th><?=($lang ? 'পদক্ষেপ' : 'Action');?></th>
	</tr>

<? foreach($det as $d){ ?>
	<tr>	
		<td><?=cb($inp,++$i);?></td>
		<td><?=$d[0];?></td>
		<td><?=dateconvert($d[1]);?></td>
		<td><?=$d[2];?></td>
		<td><?=$d[3];?></td>
		<td class="col-lg-3">					
			<button type = 'button' disabled class='btn btn-info divloader entry link0053' data = '&id=<?=$d[0];?>' >Open</button>
			<button type = 'button' disabled class='btn btn-info divloader entry link0054' data = '&id_0052=<?=$d[0];?>' >Edit</button>
			<button type = 'button' class='btn btn-info delete_purchase' purchase_id = '<?=$d[0];?>' >Delete</button>
		</td>

	</tr>
<? } ?>

	 </tbody>
	 
</table>


 

