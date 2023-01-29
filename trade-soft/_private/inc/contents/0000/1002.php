<?
    $page_subtitle =   ($lang == 1 ? "মজুদ" : "Stock");
	$query = "SELECT* FROM (
SELECT * FROM ___view_godown_stock v UNION SELECT * FROM ___view_showroom_stock s
) as a WHERE stock_ammount > 0;";
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<div class="col-lg-12">
    <div class="panel panel-primary">
        <div class="panel-heading" id = "head<?=$_REQUEST['sub'];?>">
            <span class = 'page-title'><?=$page_subtitle;?></span>
        </div>
        <div class="panel-body">
			<div class="bs-example table-responsive ">
<section class="paginate">

			  <table id = 'report-1-1002' class="table table-striped table-hover">
				       <tbody>
	<tr class = 'table_head'>
		<th><?=($lang ? 'ক্রম' : 'Sl');?></td>
		<th>
			<?=($lang ? 'গুদাম' : 'Godwon');?><br/> 
		</th>
		<th><?=($lang ? 'পন্যের ধরন' : 'Product Type');?></th>


		<th>
			<?=($lang ? 'নাম' : 'Name');?>
	
		</th>
		<th><?=($lang ? 'পরিমান' : 'Quantity');?></th>

		<th><?=($lang ? 'বিক্রয় মূল্য' : 'Sales Price');?></th>
		<th><?=($lang ? 'মোট' : 'Total');?></th>
	</tr>
<? foreach($det as $d){ ?>
	<tr class = 'report-1-1002-data'>	
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
				      </tbody>
				</table>
		        <div class="pagination">
		        </div>

			</div>
        	
        </div>
    </div>
</div>
