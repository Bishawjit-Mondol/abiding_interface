<?
	$id = req('id')>0 ? req(id) : 0; 
	$d1 = req('d1');
	$d2 = req('d2');
	$query = "CALL ___view_all_customer($id, '$d2', '$d1');";
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<table id = 'report-1-1002' class="table table-striped table-hover">
				       <tbody>
	<tr class = 'table_head'>
		<th><?=($lang ? 'ক্রম' : 'Sl');?></th>
		<th><?=($lang ? 'Invoice No.' : 'Invoice No.');?></th>
		<th><?=($lang ? 'তারিখ' : 'Date');?></th>
		<th><?=($lang ? 'ক্রেতার নাম' : 'Customer Name');?></th>
		<th><?=($lang ? 'বিল' : 'Bill amount');?></th>
		<th><?=($lang ? 'পদক্ষেপ' : 'Action');?></th>
	</tr>

<? foreach($det as $d){ ?>
	<tr class = 'report-1-0026-data'>	
		<td><?=cb($inp,++$i);?></td>
		<td><?=$d[0];?></td>
		<td><?=dateconvert($d[1]);?></td>
		<td><?=$d[2];?></td>
		<td><?=$d[3];?></td>
		<td>					
			<button type = 'button' disabled class='btn btn-info divloader entry link00' data = '&id=<?=$d[0];?>' >Open</button>
			<button type = 'button' disabled class='btn btn-info divloader entry link00' data = '&id_0047=<?=$d[0];?>' >Edit</button>
			<button type = 'button' class='btn btn-info delete_sales' sales_id = '<?=$d[0];?>' >Delete</button>
		</td>

	</tr>
<? } ?>

	 </tbody>
	 
</table>

<script type = 'text/javascript'>
$(document).on('click',".delete_sales",function(){
	
	var sales_id = $(this).attr('sales_id');
	var enc = $("#enc").html();
	var lang = $("#lang").html();
	var nt = "0058"; 
	$ele = $(this); 
	
	if(confirm('Do you want to delete?')){
		var s_url = "index.php?type=ok&e="+enc+"&page=0000&sub="+nt+"&ln="+lang+"&id="+sales_id ; 

		$.ajax({
			url: s_url,
			type: "post",

		
			success: function(msg){
			//alert(msg);
				if(msg[0]=="1"){
					$ele.closest('tr').hide('swing');
				}
				else if(msg[0]=="2"){
					alert("Sorry Failed to Delete");
				}
				else if(msg[0]=="3"){
					alert("You Are Not Authorized to Delete");
				}
			},
			error:function(){
		    
			}
			,complete:function(){
			
			}
		});	
	}
	
});

</script>

 

