<? if(!req('type')){?>
    <div class = 'header' id = 'header<?=req('sub');?>'>
    </div>
    <div class = 'result' id = 'result<?=req('sub');?>' ></div> 
<? } ?>
<?
	$query = "SELECT * FROM unite u ORDER BY unite_name;";
	$det = $qur->custom_select_query($query);
	$i = 0;
?>
<table class = 'rb' width = '100%'>
	<tr><td><?=($lang ? 'ক্রম' : 'Sl');?></td><td><?=($lang ? 'ইউনিটের নাম' : 'Unite Name');?></td></tr>
<? foreach($det as $d){ ?>
	<tr><td><?=++$i;?></td><td><?=$d[1];?></td></tr>
<? } ?>
</table>
    
    
    
