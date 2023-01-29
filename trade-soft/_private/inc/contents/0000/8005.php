<?
	$page_subtitle =   ($lang == 1 ? "পন্যসমূহ" : "Products");
	$query 
= "SELECT * FROM(
SELECT *, 1 FROM ___view_raw_mattarials ORDER BY product_name
) AS A
UNION
SELECT * FROM (
SELECT * , 2 FROM ___view_work_in_process  ORDER BY product_name 
) AS B

UNION
SELECT * FROM (
SELECT * , 3 FROM ___view_finished_product  ORDER BY product_name
) AS C";
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<div class="col-lg-6">
    <div class="panel panel-primary">
        <div class="panel-heading" id = "head<?=$_REQUEST['sub'];?>">
            <span class = 'page-title'><?=$page_subtitle;?></span>
        </div>
        <div class="panel-body">
			<div class="bs-example table-responsive ">
<section class="paginate">

			  <table id = 'report-1x-8004' class="table table-striped table-hover">
				       <tbody>
	<tr class = 'table_head'>
		<th><?=($lang ? 'ক্রম' : 'Sl');?></td>
		<th><?=($lang ? 'পন্যের ধরন' : 'Product Type');?></th>
		<th id = 'report-1x-8004-type' style = 'display:none'></th>
		<th id = 'report-1x-8004-val' style = 'display:none'></th>


		<th id = 'report-1x-8004-label'>
			<?=($lang ? 'নাম' : 'Name');?>
	
		</th>
		<th id = 'report-1x-8004-unite'><?=($lang ? 'ইউনিট' : 'Unite');?></th>

		<th ><?=($lang ? 'বিক্রয় মূল্য' : 'Sales Price');?></th>
		<th ><?=($lang ? 'উৎপাদন / ক্রয়  মূল্য' : 'Purchase Price');?></th>

		<th id = 'report-1x-8004-sp' style = 'display:none'><?=($lang ? 'বিক্রয় মূল্য' : 'Sales Price');?></th>
		<th id = 'report-1x-8004-pp' style = 'display:none'><?=($lang ? 'উৎপাদন / ক্রয়  মূল্য' : 'Purchase Price');?></th>
	</tr>
<? foreach($det as $d){ ?>
	<tr class = 'report-1x-8004-data'>	
		<td><?=cb($inp,++$i);?></td>
		<td class = 'product_type notforprint'><?
			if($d[5]==1){
				echo ($lang ? 'কাচামাল' : 'Raw Matarials');
			}
			else if($d[5]==2){
				echo ($lang ? 'পক্রিয়াজাত পন্য' : 'Work In Process');

			}
			else if($d[5]==3){
				echo ($lang ? 'বিক্রয় উপযোগী পন্য' : 'Finished Product');

			}
		?></td>
		<td style = 'display:none' ><?=$d[5];?></td>
		<td style = 'display:none' ><?=$d[0];?></td>


		<td class = 'product'><?=$d[1];?></td>
		<td><?=$d[2];?></td>
		<td><?=cb($inp,two_dec($d[3]));?></td>
		<td><?=cb($inp,two_dec(($d[4])));?></td>
		<td style = 'display:none'><?=two_dec(($d[3]));?></td>
		<td style = 'display:none'><?=two_dec(($d[4]));?></td>


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

