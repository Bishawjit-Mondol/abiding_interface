<?
    $page_subtitle =   ($lang == 1 ? "স্থানসমূহ" : "Places");;
    $label_1 =  ($lang == 1 ? "ক্রম " : "Sl"); 
    $label_2 =  ($lang == 1 ? "নাম " : "Name"); 
    $label_3 =  ($lang == 1 ? "ধরন " : "Type"); 
    $label_4 =  ($lang == 1 ? "কোড " : "Code"); 
	
	$query = "SELECT * FROM (
SELECT idpoint_godown, point_godown_name, 1 FROM ___view_godown v  ORDER BY point_godown_name
) as a
UNION
SELECT * FROM (
SELECT idpoint_godown, point_godown_name, 2 FROM ___view_showroom v  ORDER BY point_godown_name
) as b
UNION
SELECT * FROM (
SELECT idpoint_account,  point_account_name , 3 FROM point_account p WHERE idtype_account = 0 ORDER BY point_account_name
) as c
UNION
SELECT * FROM (
SELECT idpoint_account,  point_account_name , 4 FROM point_account p WHERE idtype_account = 1 ORDER BY point_account_name
) as d
UNION
SELECT * FROM 
(SELECT idpoint_godown, CONCAT(point_godown_name, ' : ' , point_machine_description) as k, 5 FROM (SELECT idpoint_godown, point_godown_name FROM point_godown p WHERE point_godown_type = 2) as a
LEFT JOIN point_machine b ON a.idpoint_godown = b.idpoint_machine ORDER BY k
) as e
";
	$inf = $qur->custom_select_query($query);
	$n = count($inf);
?>
<div class="col-lg-6">
    <div class="panel panel-primary">
        <div class="panel-heading" id = "head<?=$_REQUEST['sub'];?>">
            <span class = 'page-title'><?=$page_subtitle;?></span>
        </div>
        <div class="panel-body">
			<div class="bs-example table-responsive ">
<section class="paginate">

			  <table id = 'report-1-8003' class="table table-striped table-hover">
				       <tbody>
					<tr>
					  <th id = 'ins-8003-sl'><?=$label_1;?></th>
					  <th id = 'ins-8003-name'><?=$label_2;?></th>
					  <th id = 'ins-8003-type'><?=$label_3;?></th>
					  <th id = 'ins-8003-code' class = 'hidden'><?=$label_4;?></th>
					  <th id = 'ins-8003-id' class = 'hidden'>ID</th>
					</tr>
	<? for($i=0; $i<$n;$i++){ ?>
					<tr class = 'report-1-8003-data'>
					  <td><?=$inp->cb($i+1);?></td>
					  <td><?=$inf[$i][1];?></td>
					  <td>
					  	<?
					  		if($inf[$i][2]==1){
					  			echo ($lang ? "গুদাম" : "Godwon");
					  		}
							else if($inf[$i][2]==2){
					  			echo ($lang ? "শোরুম" : "Showroom");					  			
					  		}
							else if($inf[$i][2]==3){
					  			echo ($lang ? "ক্যেশ" : "Cash");					  			
					  		}
							else if($inf[$i][2]==4){
					  			echo ($lang ? "ব্যাংক" : "Bank");					  			
					  		}

					  	?>
					  </td>
					  <td class = 'hidden'><?=$inf[$i][2];?></td>
					  <td class = 'hidden'><?=$inf[$i][0];?></td>

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
