<br/>
<?
	$user = $qur->custom_select_query("SELECT iduser,name,login FROM ___users WHERE level != 1;");
?>
<form method = 'post'>
	<table class = 'embossed'>
		<tr>
			<td>Select User : <? $inp->d2_array_drop_down_all('u', $user , req('u')); ?> <input type = 'submit' name = 'ab1' value = 'Select' /> </td>
		</tr>
	</table>
</form>

<?

$user = req('u');	

if($user > 0){ 
	$cs = $qur->custom_select_query("SELECT idsubmenu, m.name_1, m.name_2, s.name_1, s.name_2,status FROM (SELECT idsubmenu,status FROM ___user_menu WHERE iduser = $user ) as a LEFT JOIN ___sub_menu as s USING(idsubmenu) LEFT JOIN ___menu as m USING(idmenu) ORDER BY m.priority, spriority  ;");
?>
<br/>
<form method = 'post'>
	<table width = '800px' class = 'embossed'>
		<tr>
			<td><?=($ln ? "ম্যেনু" : "Menu" );?></td>
			<td><?=($ln ? "সাব ম্যেনু" : "Sub Menu" );?></td>
			<td><?=($ln ? "অবস্থা" : "Status" );?></td>
		</tr>
<?
	$i = 0;
	foreach($cs as $c){
	
?>
		<tr>
			<td>
			<?
			 if( 1 || $cs[$i][1] != $cs[$i-1][1]  ){ 
				echo ($ln ? $c[2] :  $c[1]);
			 }
			?> 
			</td>
			<td><?=($ln ? $c[3] :  $c[4]);?></td>
			<td>
				<input type='hidden' name = 's<?=$i;?>' value = '<?=$c[0];?>' />			
				<select name = 'c<?=$i;?>' >
					<option value = '0' <? if($c[5]=='0'){ echo 'selected'; } ?> ><?=($ln ? 'বন্ধ' : 'Close' );?></option>
					<option value = '1'  <? if($c[5]=='1'){ echo 'selected'; } ?>><?=($ln ? 'খোলা' : 'Open' );?></option>
				</select>
			</td>
		</tr>

<? $i++; } ?>
		<tr>
			<th colspan = '3' >
				<input type='hidden' name = 'num' value = '<?=count($cs);?>' />
				<input type='hidden' name = 'id' value = '<?=$user;?>' />
				<input type = 'submit' name = 'ab' value = '<?=($ln ? "সংরক্ষন করুন" : "save");?>' />
			</th>
		</tr>
	</table>

</form>

<? } ?>
