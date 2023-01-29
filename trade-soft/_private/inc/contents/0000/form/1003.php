<? if(!req('type')){?>
    <div class = 'header' id = 'header<?=req('sub');?>'>
    </div>
    <div class = 'result' id = 'result<?=req('sub');?>' ></div> 
<? } ?>
<?
	$query = "SELECT * FROM ___view_showroom_stock WHERE product_type = 3;";
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<table id = 'stock_1003' class = 'rb' width = '1000px'>

	<tr class = 'contain_filter_1003' >
		<td><?=($lang ? 'ক্রম' : 'Sl');?></td>
		<td>
			<?=($lang ? 'শোরুম' : 'Showroom');?><br/> 
			<? $inp->d2_array_drop_down("",$qur->custom_select_query("SELECT * FROM ___view_showroom S;"),0,"fg1003", 'filter notforprint' ,  "style='display:none'" ); ?>
		</td>
		<td>
			<?=($lang ? 'পন্যের ধরন' : 'Product Type');?>
		</td>
		<td>
			<?=($lang ? 'নাম' : 'Name');?><br/> 
			<? $inp->d2_array_drop_down("",$qur->custom_select_query("SELECT idproduct,product_name FROM ___view_finished_product v;"),0,"fp1003",'filter notforprint', "style='display:none'" ); ?>
		</td>
		<td><?=($lang ? 'পরিমান' : 'Quantity');?></td>

		<td><?=($lang ? 'বিক্রয় মূল্য' : 'Sales Price');?></td>
		<td><?=($lang ? 'মোট' : 'Total');?></td>
	</tr>
<? foreach($det as $d){ ?>
	<tr>	
		<td><?=$inp->convert_bangla(++$i);?></td>
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
		<td><?=$inp->convert_bangla(two_dec(($d[4]))).' '.$d[5];?></td>
		<td><?=$inp->convert_bangla(two_dec(($d[6])));?></td>
		<td><?=$inp->convert_bangla(two_dec(($d[4]*$d[6])));?></td>


	</tr>
<? } ?>
</table>
<script type = 'text/javascript'>
   $("select#fg1003").change(function(){
	$("select#fpt1003").val(0);
	$("select#fp1003").val(0);
	var label = $("select#fg1003 option:selected").text();
	var $intg = $("table#stock_1003 tr");
	var i = 0;
	if( $("select#fg1003").val().length == 0 ){
	   $intg.each(function(){ 
		var $row = $(this);
		$row.show("swing");
	   });

	}
	else{
	   $intg.each(function(){ 
		var $row = $(this);
		if ($row.children("td.godown").html() != label){
			i++;
			if(i>1){
				$row.hide("swing");
			}
		}
		else{
			$row.show("swing");
		}
	   });
	}

   });
   $("select#fpt1003").change(function(){
	$("select#fg1003").val(0);
	$("select#fp1003").val(0);
	var label = $("select#fpt1003 option:selected").text();
	var $intg = $("table#stock_1003 tr");
	var i = 0;
	if( $("select#fpt1003").val().length == 0 ){
	   $intg.each(function(){ 
		var $row = $(this);
		$row.show("swing");
	   });

	}
	else{
	   $intg.each(function(){ 
		var $row = $(this);
		if ($row.children("td.product_type").html() != label){
			i++;
			if(i>1){
				$row.hide("swing");
			}
		}
		else{
			$row.show("swing");
		}
	   });
	}

   });
   $("select#fp1003").change(function(){
	$("select#fg1003").val(0);
	$("select#fpt1003").val(0);
	var label = $("select#fp1003 option:selected").text();
	var $intg = $("table#stock_1003 tr");
	var i = 0;
	if( $("select#fp1003").val().length == 0 ){
	   $intg.each(function(){ 
		var $row = $(this);
		$row.show("swing");
	   });

	}
	else{
	   $intg.each(function(){ 
		var $row = $(this);
		if ($row.children("td.product").html() != label){
			i++;
			if(i>1){
				$row.hide("swing");
			}
		}
		else{
			$row.show("swing");
		}
	   });
	}

   });

  $(".contain_filter_1003").dblclick(function(){
	var $intg = $(this).find(".filter");
	$intg.each(function(){ 
		$row = $(this);
		$row.toggle("swing");
	});
  });

</script>
    
    
    
    
