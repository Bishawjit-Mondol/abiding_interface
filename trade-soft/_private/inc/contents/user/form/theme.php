<script type = 'text/javascript'>
	function alter(){
		var cur = document.getElementById("cccs").options[document.getElementById("cccs").selectedIndex].value;
		
		changecss(cur);
	}
</script>
<? if(req('newcss')>0){ ?>
<script type = 'text/javascript'>
		changecss(<?=req('newcss');?>);
</script>
<? } ?>
<form method = 'POST' class='embossed'>
<img src='images/blank1by1.gif' width='500px' height='1px'/><br/>
<h2>Theme Settings</h2>
  <br/><? $inp->d2_array_drop_down_all('newcss',$qur->custom_select_query("SELECT css,name FROM ___css"),$csschoice,'cccs','',"onchange='alter()'"); ?><input type="submit" name="ab" value="Update"/>
  <br/>
</form>

