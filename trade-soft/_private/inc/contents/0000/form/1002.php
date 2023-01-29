<? if(!req('type')){?>
    <div class = 'header' id = 'header<?=req('sub');?>'>
    </div>
    <div class = 'result' id = 'result<?=req('sub');?>' ></div> 
<? } ?>
<?
	$query = "SELECT * FROM ___view_godown_stock v;;";
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<table id = 'stock_1002' class = 'rb' width = '1000px'>

	<tr >
		<td><?=($lang ? 'ক্রম' : 'Sl');?></td>
		<td>
			<?=($lang ? 'গুদাম' : 'Godwon');?><br/> 
			<? $inp->d2_array_drop_down("",$qur->custom_select_query("SELECT * FROM ___view_godown S;"),0,"fg1002", 'filter notforprint' ,  "style='display:none'" ); ?>
		</td>
		<td>
			<?=($lang ? 'পন্যের ধরন' : 'Product Type');?><br/>  
			<select id = "fpt1002" class = 'filter' style='display:none'>
				<option></option>
				<option><?=($lang ? 'কাচামাল' : 'Raw Matarials');?></option>
				<option><?=($lang ? 'পক্রিয়াজাত পন্য' : 'Work In Process');?></option>
				<option><?=($lang ? 'বিক্রয় উপযোগী পন্য' : 'Finished Product');?></option>
			</select>
		</td>
		<td>
			<?=($lang ? 'নাম' : 'Name');?><br/> 
			<? $inp->d2_array_drop_down("",$qur->custom_select_query("SELECT idproduct,product_name FROM product;"),0,"fp1002",'filter notforprint', "style='display:none'" ); ?>
		</td>
		<td><?=($lang ? 'পরিমান' : 'Quantity');?></td>

		<td><?=($lang ? 'বিক্রয় মূল্য' : 'Sales Price');?></td>
		<td><?=($lang ? 'মোট' : 'Total');?></td>
	</tr>
<? foreach($det as $d){ ?>
	<tr>	
		<td><?=cb($inp,++$i);?></td>
		<td class = 'godown'><?=$d[3];?></td>
		<td class = 'product_type notforprint'><?
			if($d[8]==1){
				echo ($lang ? 'কাচামাল' : 'Raw Matarials');
			}
			else if($d[8]==2){
				echo ($lang ? 'পক্রিয়াজাত পন্য' : 'Work In Process');

			}
			else if($d[8]==3){
				echo ($lang ? 'বিক্রয় উপযোগী পন্য' : 'Finished Product');

			}
		?></td>
		<td class = 'product'><?=$d[2];?></td>
		<td><?=cb($inp,$d[4]).' '.$d[5];?></td>
		<td><?=cb($inp,two_dec($d[6]));?></td>
		<td><?=cb($inp,two_dec(($d[4]*$d[6])));?></td>


	</tr>
<? } ?>
</table>
    
    
