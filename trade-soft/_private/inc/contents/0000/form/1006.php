<? if(!req('type')){?>
    <div class = 'header' id = 'header<?=req('sub');?>'>
    </div><br/><br/>
<? } ?>
<?
				if(strlen(req_date('d1'))>2){
					$d1= req_date('d1');
					$d2= req_date('d2');
				}
				else{
					$d1 = date('Y-m-d');
					$d2 = strtotime ( '-30 day' , strtotime ( $d1 ) ) ;
					$d2 = date ( 'Y-m-d' , $d2 );
				}
?>
<div class='notforprint' >

    <form id = 'frm<?=req('sub');?>'  >
		<?=($lang?"":"From ");?><? $inp->input_date('d2',$d2); ?> <?=($lang?"হইতে ":"To ");?>
		 <? $inp->input_date('d1',$d1); ?> <?=($lang?"পর্যন্ত ":"");?>
	<?
		  $inf = $qur->custom_select_query("SELECT idpoint_account, point_account_name, idtype_account FROM point_account p ORDER BY idtype_account;");
	?>
	<select name = 'p' class = 'optional'>
		      <option value = '-1' ></option>
<?
		      foreach($inf as $i){
				echo "<option value = '".$i[0]."' ".(req('p')==$i[0] ? " selected " : " " ).">".$i[1]."</option>"; 
		      }							
?>
	</select>
		<input  type = 'button' id = 'sub_but_<?=req('sub');?>' class = 'sub_but' name = 'ab' value = '<?=($lang ? "প্রসেস করুন" : "Process ");?>' />

	</form>
</div>
<br/>
<div class = 'result' id = 'result<?=req('sub');?>' ></div>
