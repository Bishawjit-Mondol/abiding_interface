<?php
function get_insert_query($array){
	$table = $array[0];
	for($a=0; $a<count($array[2]); $a++){
		$col = $col.', '.$array[2][$a];
		if($array[1][$a] == 's')
			$value = $value.', '."'".$array[3][$a]."'";
		else
			$value = $value.', '.$array[3][$a];
		}
		$col = substr($col, 1);
		$value = substr($value, 1);
		$print_query = "</br> INSERT INTO $table ($col) VALUES ($value) $q;";
		
		return $print_query;
}


function current_url($except = '_______IMPOSSIBLE_____'){
    $key = ( array_keys($_GET));
    $str = "index.php"; 
    $n = count($key);
    $flag = false;
    for($i = 0; $i<$n; $i++){ 
            if($key[$i] != $except){
                    if($flag){
                        $str = $str."&&".$key[$i]."=".$_GET[$key[$i]];
                    }
                    else{
                            $flag = true;
                            $str = $str."?".$key[$i]."=".$_GET[$key[$i]];
                    
                    }
            }
    }
    return $str;
}

function two_dec($inp){
	if($inp==null || $inp == 0){
		return "0.00";
	}
	else{
		$out = sprintf("%.2f",$inp);
		if($out == 0){
			return "0.00";
		}
		return sprintf("%.2f",$inp);
	}
}


function check_numeric($data){
	return is_numeric($data);
}

function check_positive($data){
	return (is_numeric($data) && $data >= 0);
}

function check_email($data){
	if (!preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/",$data)){ 
	  return true; 
	} 
	else{ 
	  return false; 
	} 
}


function check_integer($data){
	return ((string)(int)$data == $data);
}


function dateconvert($date)
{
	if($date=="0000-00-00"||(!$date))
	return "";
	else
	return $newDate = date("d M Y (D)", strtotime($date));
}

function post_date($name){
	$dateInput = explode( '-', post($name) );
	return  $dateInput[2].'-'.$dateInput[1].'-'.$dateInput[0];
}

function req_date($name){
	$dateInput = explode('-',req($name));
	return  $dateInput[2].'-'.$dateInput[1].'-'.$dateInput[0];
}

function dc($date)
{
	if($date=="0000-00-00"||(!$date))
	return "";
	return $newDate = date("d-m-y", strtotime($date));
}
function microtime_float(){
	list($usec, $sec) = explode(" ", microtime());
	return ((float)$usec + (float)$sec);
}

function req($name){
	if(isset($_POST[$name])){
        return htmlentities( $_POST[$name], ENT_QUOTES, 'utf-8' );
	}
	elseif(isset($_REQUEST[$name])){
		return htmlentities( $_REQUEST[$name], ENT_QUOTES, 'utf-8' );
	}
	elseif(isset($_REQUEST[$name.'_y'])){
		$d = $_REQUEST[$name.'_y'].'-'.$_REQUEST[$name.'_m'].'-'.$_REQUEST[$name.'_d'];
		return $d;
	}		
	return null;
}
 
function post($name){
	
	if(isset($_POST[$name])){
		return htmlentities( $_POST[$name], ENT_QUOTES, 'utf-8' );
	}
	elseif(isset($_POST[$name.'_y'])){
		$d = $_POST[$name.'_y'].'-'.$_POST[$name.'_m'].'-'.$_POST[$name.'_d'];
		return $d;
	}
	return null;
}

 
function get_extrastring($name){
	if($_REQUEST[$name])
	{
		$_REQUEST[$name];
		$extrastring="&&".$name."=".$_REQUEST[$name];
	}
	return $extrastring;
}

function get_extrastring_date($name){
	if($_REQUEST[$name.'_y']&&$_REQUEST[$name.'_m']&&$_REQUEST[$name.'_d'])
	{
		$extrastring="&&".$name."=".$_REQUEST[$name.'_y'].'-'.$_REQUEST[$name.'_m'].'-'.$_REQUEST[$name.'_d'];
	}
	return $extrastring;
}

class html_interface {

    public function getPostDate($p){
			    if($_POST[$p.'_y']&&$_POST[$p.'_m']&&$_POST[$p.'_d'])
                  return $_POST[$p.'_y'].'-'.$_POST[$p.'_m'].'-'.$_POST[$p.'_d'];    
				else 
				   return 0;
    }

    public function dateconvert($date){
				if($date=="0000-00-00"||(!$date))
					return "";
				elseif($date==date("Y-m-d"))
					return "Today";
				else
					return $newDate = date("d M Y (D)", strtotime($date));
	}	
	
	public function value_pgd($name,$default_value=null){
		if(isset($_POST[$name]))
		{
			return $_POST[$name];
		}
		elseif(isset($_GET[$name]))
		{
			return $_GET[$name];
		}
		elseif($default_value!=null)
		{
			return $default_value;
		}
		else
		{
			return null;
		}
	}
	
	public function cb($str){
		return $this->convert_bangla($str);
	}
	public function convert_bangla($str){
		$str = (string)$str;
		if($_GET['ln'] == 0){
			return $str;

		}
		$new = "";
		$n = strlen($str);
		for($i=0; $i<$n; $i++){
			if($str[$i]=='0'){
				$new = $new."০";
			}			
			else if($str[$i]=='1'){
				$new = $new."১";
			}
			else if($str[$i]=='2'){
				$new = $new."২";
			}
			else if($str[$i]=='3'){
				$new = $new."৩";
			}
			else if($str[$i]=='4'){
				$new = $new."৪";
			}
			else if($str[$i]=='5'){
				$new = $new."৫";
			}
			else if($str[$i]=='6'){
				$new = $new."৬";
			}
			else if($str[$i]=='7'){
				$new = $new."৭";
			}
			else if($str[$i]=='8'){
				$new = $new."৮";
			}
			else if($str[$i]=='9'){
				$new = $new."৯";
			}
			else{
				$new = $new.$str[$i];
			}
		}
		return $new;
	}

	public function select_number($name, $start, $end,  $post_asc = 1 , $value = null, $class = null, $id = null, $inc = 1, $js = '', $tab = ''){
		$lang = $_GET['ln'];
		if($post_asc == 1){
			if(isset($_REQUEST[$name])){
				$value = $_REQUEST[$name];
			}
		}

		print "<select name = '".$name."' id = '".$id."' tabindex = '".$tab."'  >";
		if($value == null){
			for($i = $start; $i<= $end; $i+=$inc){
				print "<option value = '".$i."'>".$this->convert_bangla($i)."</option>";
			}
		}
		else{
			for($i = $start; $i<= $end; $i++){
				if($value != $i)
				print "<option value = '".$i."'>".$this->convert_bangla($i)."</option>";
				else
				print "<option value = '".$i."' selected >".$this->convert_bangla($i)."</option>";
			}
		}
		print "</select>";

	}

	public function select_d_number($name, $start, $end,   $post_asc = 1 , $value = null, $id = null, $class = null, $tab){

		if($post_asc == 1){
			if(isset($_REQUEST['name'])){
				$value = $_REQUEST['name'];
			}
		}

		print "<select name = '".$name."' id = '".$id."'  class = '".$class."' tabindex = '".$tab."' >";
		if($value == null){
			for($i = $start; $i<= $end; $i++){
				if($i>9)
				print "<option value = '".$i."'>".$this->convert_bangla($i)."</option>";
				else
				print "<option value = '".$i."'>".$this->convert_bangla("0".$i)."</option>";
			}
		}
		else{
			for($i = $start; $i<= $end; $i++){
				if($value != $i){
					if($i>9)
				print "<option value = '".$i."'>".$this->convert_bangla($i)."</option>";
					else
				print "<option value = '".$i."'>".$this->convert_bangla("0".$i)."</option>";
				}
				else{
					if($i>9)
					print "<option value = '".$i."' selected >".$this->convert_bangla($i)."</option>";
					else
					print "<option value = '".$i."' selected >".$this->convert_bangla("0".$i)."</option>";
				}
			}
		}
		print "</select>";

	}


	public function input_date($name, $value = null, $id = '', $class = '', $tab = ''){

		if($value==null){
			$value = date('Y-m-d');
		}
		if($class==null){
			$class = 'date';
		}

		$d = (isset($_REQUEST[$name."_d"]) ? req($name."_d") : $value[8].$value[9]);
		$m = (isset($_REQUEST[$name."_m"]) ? req($name."_m") : $value[5].$value[6]);
		$y = (isset($_REQUEST[$name."_y"]) ? req($name."_y") : $value[0].$value[1].$value[2].$value[3]);

		$this->select_d_number($name.'_d', 1, 31, 1, $d, null,$class, $tab);
		$this->select_d_number($name.'_m', 1, 12, 1, $m, null ,$class, $tab);
		$this->select_d_number($name.'_y', 2010,2020, 1, $y,null,$class, $tab);


	}

	public function d2_array_drop_down($name, $value, $selected = null, $id = null, $class = null, $js = null, $tab = ''){

		if($selected == null){
			$selected = req($name);
		}

		echo "<select name = '$name' id = '$id' class = '$class' $js tabindex='".$tab."'  >";
		echo "<option></option>";
		if($selected == null){
			foreach($value as $v)
			echo "<option value = '".$v[0]."'>".$v[1]."</option>";
		}
		else{
			foreach($value as $v){
				if($v[0] != $selected)
				echo "<option value = '".$v[0]."'>".$v[1]."</option>";
				else
				echo "<option value = '".$v[0]."'selected >".$v[1]."</option>";
			}
		}
		echo "</select>";
	}
	public function d2_array_drop_down_all($name, $value, $selected = null, $id = null, $class = null, $js = null, $tab = ''){

		if($selected == null){
			$selected = req($name);
		}

		echo "<select name = '$name' id = '$id' class = '$class' $js tabindex='".$tab."'  >";

		if($selected == null){
			foreach($value as $v)
			echo "<option value = '".$v[0]."'>".$v[1]."  </option>";
		}
		else{
			foreach($value as $v){
				if($v[0] != $selected)
				echo "<option value = '".$v[0]."'>".$v[1]."</option>";
				else
				echo "<option value = '".$v[0]."'selected >".$v[1]."</option>";
			}
		}
		echo "</select>";
	}
	
	
	public function d1_array_drop_down($name, $value, $selected = null, $id = null, $class = null, $js = null, $tab = ''){

		if($selected == null){
			$selected = req($name);
		}

		echo "<select name = '$name' id = '$id' class = '$class' $js tabindex='".$tab."'  >";
		echo "<option></option>";
		if($selected == null){
			foreach($value as $v)
			echo "<option value = '".$v[0]."'> ".$v[0]."  </option>";
		}
		else{
			foreach($value as $v){
				if($v[0] != $selected)
				echo "<option value = '".$v[0]."'> ".$v[0]."</option>";
				else
				echo "<option value = '".$v[0]."'selected > ".$v[0]."</option>";
			}
		}
		echo "</select>";
	}
	 

	public function d2_array_drop_down_mix($name, $value, $selected = null, $id = null, $class = null, $js = null, $tab = ''){
		if($selected == null){
			$selected = req($name);
		}

		echo "<select name = '$name' id = '$id' class = '$class' $js tabindex='".$tab."' >";
		echo "<option></option>";
		if($selected == null){
			foreach($value as $v)
			echo "<option value = '".$v[0]."'> ".$v[1].' ( '.$v[2]." ) </option>";
		}
		else{
			foreach($value as $v){
				if($v[0] != $selected)
				echo "<option value = '".$v[0]."'> ".$v[1].' - '.$v[2]."</option>";
				else
				echo "<option value = '".$v[0]."'selected > ".$v[1].' - '.$v[2]."</option>";
			}
		}
		echo "</select>";
	}


	public     function anchor_link($href, $label, $class = null, $id = null){
		print "<a href = '".$href."' >".$label."</a>";
	}


	public     function input_text($name, $value = null, $id = null, $class = null){

		if(isset($_REQUEST[$name])){
			$value = mysql_escape_string($_REQUEST[$name]);
		}
		echo "<input type = 'text' name = '".$name."'"." class = '".$class."' id = '".$id."' value = '". $value."' />" ;
	}

	public function print_purchase($t,$k){

		    $label_1  =   ($_GET['ln'] == 1 ? "তারিখ" : "Date");
		    $label_2  =   ($_GET['ln'] == 1 ? "সরবরাহকারী" : "Supplier");
		    $label_3  =   ($_GET['ln'] == 1 ? "ক্রম" : "Sl");
		    $label_4  =   ($_GET['ln'] == 1 ? "পন্যের নাম" : "Product");
		    $label_5  =   ($_GET['ln'] == 1 ? "পরিমান" : "Quantity");
		    $label_6  =   ($_GET['ln'] == 1 ? "ইউনিট" : "Unite");
		    $label_7  =   ($_GET['ln'] == 1 ? "দর" : "Rate");
		    $label_8 =   ($_GET['ln'] == 1 ? "দাম" : "Price");
		    $label_9 =   ($_GET['ln'] == 1 ? "রাখা হয়েছে" : "Stored On");
		    $label_10 =   ($_GET['ln'] == 1 ? "মন্তব্য" : "Comments");
		    $label_11 =   ($_GET['ln'] == 1 ? "অাইডি" : "ID");
		    $label_12 =   ($_GET['ln'] == 1 ? "সর্বমোট" : "Total");
		    $label_13 =   ($_GET['ln'] == 1 ? "পরিবহন খরচ" : "Transport Cost");
		    $label_14 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস" : "Discount");
		    $label_15 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস ছাড়া" : "Without Discount");
		    $label_16 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস সহ" : "With Discount");
		    $label_17 =   ($_GET['ln'] == 1 ? "মন্তব্য" : "Comments");

?>
		<table class = 'embossed main_pur<?php echo$t[0][0];?>'  width = '100%' border = '0px' >
			<tr class = 'purchase notforprint' id = 'pur<?php echo$t[0][0];?>' >
				<td width = '8%'><?php echo$label_11;?> : <?php echo$t[0][0];?></td>
				<td width = '25%' ><?php echo$label_1;?> : <?php echodateconvert($t[0][1]);?></td>
				<td  colspan = '3'> <?php echo$label_2;?> : <?php echo$t[0][3];?></td>
				
				<th width = '20%'><?php echo$label_12;?> : <b><?php echo($t[0][12])?></b></th>
			</tr>
			<tr class = 'pur<?php echo$t[0][0];?> notforprint' id = 'data_row' style='display:none' >
				<td ><b><?php echo$label_3;?></b></td>
				<td><b><?php echo$label_4;?></b></td>
				<td><b><?php echo$label_5;?></b></td>
				<td><b><?php echo$label_6;?></b></td>
				<td><b><?php echo$label_7;?></b></td>
				<td><b><?php echo$label_8;?></b></td>
			</tr>	
			<?
				$n = count($t);
				$tot = 0;
				
				for($i=0; $i<$n; $i++){
			?>
					<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' style='display:none'>
						<td><?php echo($i+1);?></td>
						<td><?php echo$t[$i][6];?></td>
						<td><?php echo$t[$i][7];?></td>
						<td><?php echo$t[$i][8];?></td>
						<td><?php echo$t[$i][9];?></td>
						<td><?php echo($t[$i][9] * $t[$i][7]);?></td>
						<? $tot = $tot + $t[$i][9] * $t[$i][7]; ?>
					</tr>
			<?		
				}
			?>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' style='display:none'>
				<td colspan = '2'><?php echo$label_9;?> : <?php echo$t[0][4];?></td>
				<td colspan = '2'> <?php echo$label_13;?>: <?php echo$t[0][11];?></td>
				<td colspan = '2'><?php echo$label_15;?> : <?php echo$tot;?></td>
			</tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row'>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' style='display:none'>
				<td colspan = '2'><?php echo$label_10;?> : <?php echo$t[0][5];?></td>
				<td colspan = '2'><?php echo$label_14;?> : <?php echo$t[0][10];?></td>
				<td colspan = '2'><?php echo$label_16;?> : <?php echo($tot-$t[0][10])?> </td>
			</tr>	
			<tr class = 'pur<?php echo$t[0][0];?> notforprint' id = 'data_row' style='display:none'>
			    <th colspan = '6' class = 'notforprint'>
				    <? 
					  $print = "index.php?e=".req('e')."&&page=0000&&sub=0112&&id=".$t[0][0]."&&print=1";
					  $delete = "index.php?e=".req('e')."&&page=0000&&sub=0212&&id=".$t[0][0];
				    ?>
				    <a href = '<?php echo$print;?>' target = '_blank' class = 'button'  > &nbsp;&nbsp;  Print &nbsp;&nbsp; </a>

				    <a href = '<?php echo$delete;?>' target = '_blank' class = 'button pur_del' id = '<?php echo$t[0][0];?>'  > &nbsp;&nbsp;  Delete &nbsp;&nbsp; </a>
				</th>
			</tr>
		</table>

<?php
	}




	public function print_purchase_show($t,$k){

		    $label_1  =   ($_GET['ln'] == 1 ? "তারিখ" : "Date");
		    $label_2  =   ($_GET['ln'] == 1 ? "সরবরাহকারী" : "Supplier");
		    $label_3  =   ($_GET['ln'] == 1 ? "ক্রম" : "Sl");
		    $label_4  =   ($_GET['ln'] == 1 ? "পন্যের নাম" : "Product");
		    $label_5  =   ($_GET['ln'] == 1 ? "পরিমান" : "Quantity");
		    $label_6  =   ($_GET['ln'] == 1 ? "ইউনিট" : "Unite");
		    $label_7  =   ($_GET['ln'] == 1 ? "দর" : "Rate");
		    $label_8 =   ($_GET['ln'] == 1 ? "দাম" : "Price");
		    $label_9 =   ($_GET['ln'] == 1 ? "রাখা হয়েছে" : "Stored On");
		    $label_10 =   ($_GET['ln'] == 1 ? "মন্তব্য" : "Comments");
		    $label_11 =   ($_GET['ln'] == 1 ? "অাইডি" : "ID");
		    $label_12 =   ($_GET['ln'] == 1 ? "সর্বমোট" : "Total");
		    $label_13 =   ($_GET['ln'] == 1 ? "পরিবহন খরচ" : "Transport Cost");
		    $label_14 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস" : "Discount");
		    $label_15 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস ছাড়া" : "Without Discount");
		    $label_16 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস সহ" : "With Discount");
		    $label_17 =   ($_GET['ln'] == 1 ? "মন্তব্য" : "Comments");

		
		

?>
		<table class = 'embossed main_pur<?php echo$t[0][0];?>'  width = '100%' border = '0px' >
			<tr class = 'purchase notforprint' id = 'pur<?php echo$t[0][0];?>' >
				<td width = '8%'><?php echo$label_11;?> : <?php echo$t[0][0];?></td>
				<td width = '25%' ><?php echo$label_1;?> : <?php echodateconvert($t[0][1]);?></td>
				<td  colspan = '3'> <?php echo$label_2;?> : <?php echo$t[0][3];?></td>
				
				<th width = '20%'><?php echo$label_12;?> : <b><?php echo($t[0][12])?></b></th>
			</tr>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row'  >
				<td ><b><?php echo$label_3;?></b></td>
				<td><b><?php echo$label_4;?></b></td>
				<td><b><?php echo$label_5;?></b></td>
				<td><b><?php echo$label_6;?></b></td>
				<td><b><?php echo$label_7;?></b></td>
				<td><b><?php echo$label_8;?></b></td>
			</tr>	
			<?
				$n = count($t);
				$tot = 0;
				
				for($i=0; $i<$n; $i++){
			?>
					<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' >
						<td><?php echo($i+1);?></td>
						<td><?php echo$t[$i][6];?></td>
						<td><?php echo$t[$i][7];?></td>
						<td><?php echo$t[$i][8];?></td>
						<td><?php echo$t[$i][9];?></td>
						<td><?php echo($t[$i][9] * $t[$i][7]);?></td>
						<? $tot = $tot + $t[$i][9] * $t[$i][7]; ?>
					</tr>
			<?		
				}
			?>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' >
				<td colspan = '2'><?php echo$label_9;?> : <?php echo$t[0][4];?></td>
				<td colspan = '2'> <?php echo$label_13;?>: <?php echo$t[0][11];?></td>
				<td colspan = '2'><?php echo$label_15;?> : <?php echo$tot;?></td>
			</tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row'>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' >
				<td colspan = '2'><?php echo$label_10;?> : <?php echo$t[0][5];?></td>
				<td colspan = '2'><?php echo$label_14;?> : <?php echo$t[0][10];?></td>
				<td colspan = '2'><?php echo$label_16;?> : <?php echo($tot-$t[0][10])?> </td>
			</tr>	
			<tr class = 'pur<?php echo$t[0][0];?> notforprint' id = 'data_row' >
				<th colspan = '6'>
				    <? 
					  $print = "index.php?e=".req('e')."&&page=0000&&sub=0112&&id=".$t[0][0]."&&print=1";
					  $delete = "index.php?e=".req('e')."&&page=0000&&sub=0212&&id=".$t[0][0];
				    ?>
				    <a href = '<?php echo$print;?>' target = '_blank' class = 'button'  > &nbsp;&nbsp;  Print &nbsp;&nbsp; </a>

				    <a href = '<?php echo$delete;?>' target = '_blank' class = 'button pur_del' id = '<?php echo$t[0][0];?>'  > &nbsp;&nbsp;  Delete &nbsp;&nbsp; </a>
				</th>
			</tr>
		</table>

<?
	}




	public function print_sell_show($t,$k){

		    $label_1  =   ($_GET['ln'] == 1 ? "তারিখ" : "Date");
		    $label_2  =   ($_GET['ln'] == 1 ? "ক্রেতা" : "Client");
		    $label_3  =   ($_GET['ln'] == 1 ? "ক্রম" : "Sl");
		    $label_4  =   ($_GET['ln'] == 1 ? "পন্যের নাম" : "Product");
		    $label_5  =   ($_GET['ln'] == 1 ? "পরিমান" : "Quantity");
		    $label_6  =   ($_GET['ln'] == 1 ? "ইউনিট" : "Unite");
		    $label_7  =   ($_GET['ln'] == 1 ? "দর" : "Rate");
		    $label_8 =   ($_GET['ln'] == 1 ? "দাম" : "Price");
		    $label_9 =   ($_GET['ln'] == 1 ? "রাখা হয়েছে" : "Stored On");
		    $label_10 =   ($_GET['ln'] == 1 ? "মন্তব্য" : "Comments");
		    $label_11 =   ($_GET['ln'] == 1 ? "অাইডি" : "ID");
		    $label_12 =   ($_GET['ln'] == 1 ? "সর্বমোট" : "Total");
		    $label_13 =   ($_GET['ln'] == 1 ? "পরিবহন খরচ" : "Transport Cost");
		    $label_14 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস" : "Discount");
		    $label_15 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস ছাড়া" : "Without Discount");
		    $label_16 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস সহ" : "With Discount");
		    $label_17 =   ($_GET['ln'] == 1 ? "মন্তব্য" : "Comments");
		    $label_18 =   ($_GET['ln'] == 1 ? "কোড" : "Code");
		
		

?>
		<table class = 'embossed  main_sal<?php echo$t[0][0];?>'  width = '100%' border = '0px' >
			<tr class = 'purchase notforprint' id = 'pur<?php echo$t[0][0];?>' >
				<td width = '8%'><?php echo$label_11;?> : <?php echo$t[0][0];?></td>
				<td width = '25%' colspan = '2' ><?php echo$label_1;?> : <?php echodateconvert($t[0][1]);?></td>
				<td  colspan = '3'> <?php echo$label_2;?> : <?php echo$t[0][3];?></td>
				
				<th width = '20%'><?php echo$label_12;?> : <b><?php echo($t[0][12])?></b></th>
			</tr>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row'  >
				<td ><b><?php echo$label_3;?></b></td>
				<td><b><?php echo$label_18;?></b></td>
				<td><b><?php echo$label_4;?></b></td>
				<td><b><?php echo$label_5;?></b></td>
				<td><b><?php echo$label_6;?></b></td>
				<td><b><?php echo$label_7;?></b></td>
				<td><b><?php echo$label_8;?></b></td>
			</tr>	
			<?
				$n = count($t);
				$tot = 0;
				
				for($i=0; $i<$n; $i++){
			?>
					<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' >
						<td><?php echo($i+1);?></td>
						<td><?php echo$t[$i][13];?></td>
						<td><?php echo$t[$i][6];?></td>
						<td><?php echo$t[$i][7];?></td>
						<td><?php echo$t[$i][8];?></td>
						<td><?php echo$t[$i][9];?></td>
						<td><?php echo($t[$i][9] * $t[$i][7]);?></td>
						<? $tot = $tot + $t[$i][9] * $t[$i][7]; ?>
					</tr>
			<?		
				}
			?>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' >
				<td colspan = '2'><?php echo$label_9;?> : <?php echo$t[0][4];?></td>
				<td colspan = '2'> <?php echo$label_13;?>: <?php echo$t[0][11];?></td>
				<td colspan = '2'><?php echo$label_15;?> : <?php echo$tot;?></td>
			</tr>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' >
				<td colspan = '2'><?php echo$label_10;?> : <?php echo$t[0][5];?></td>
				<td colspan = '2'><?php echo$label_14;?> : <?php echo$t[0][10];?></td>
				<td colspan = '2'><?php echo$label_16;?> : <?php echo($tot-$t[0][10])?> </td>
			</tr>	
			<tr class = 'pur<?php echo$t[0][0];?> notforprint' id = 'data_row' >
			    <th colspan = '7' >
					<? 
					      $print = "index.php?e=".req('e')."&&page=0000&&sub=0113&&id=".$t[0][0]."&&print=1";
					      $delete = "index.php?e=".req('e')."&&page=0000&&sub=0213&&id=".$t[0][0];
					?>
					<a href = '<?php echo$print;?>' target = '_blank' class = 'button'  > &nbsp;&nbsp;  Print &nbsp;&nbsp; </a>

					<a href = '<?php echo$delete;?>' target = '_blank' class = 'button sal_del' id = '<?php echo$t[0][0];?>'  > &nbsp;&nbsp;  Delete &nbsp;&nbsp; </a>
				    </th>
		      </tr>
		</table>

<?
	}






	public function print_sell($t,$k){

		    $label_1  =   ($_GET['ln'] == 1 ? "তারিখ" : "Date");
		    $label_2  =   ($_GET['ln'] == 1 ? "ক্রেতা" : "Client");
		    $label_3  =   ($_GET['ln'] == 1 ? "ক্রম" : "Sl");
		    $label_4  =   ($_GET['ln'] == 1 ? "পন্যের নাম" : "Product");
		    $label_5  =   ($_GET['ln'] == 1 ? "পরিমান" : "Quantity");
		    $label_6  =   ($_GET['ln'] == 1 ? "ইউনিট" : "Unite");
		    $label_7  =   ($_GET['ln'] == 1 ? "দর" : "Rate");
		    $label_8 =   ($_GET['ln'] == 1 ? "দাম" : "Price");
		    $label_9 =   ($_GET['ln'] == 1 ? "রাখা হয়েছে" : "Stored On");
		    $label_10 =   ($_GET['ln'] == 1 ? "মন্তব্য" : "Comments");
		    $label_11 =   ($_GET['ln'] == 1 ? "অাইডি" : "ID");
		    $label_12 =   ($_GET['ln'] == 1 ? "সর্বমোট" : "Total");
		    $label_13 =   ($_GET['ln'] == 1 ? "পরিবহন খরচ" : "Transport Cost");
		    $label_14 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস" : "Discount");
		    $label_15 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস ছাড়া" : "Without Discount");
		    $label_16 =   ($_GET['ln'] == 1 ? "মূল্য হ্রাস সহ" : "With Discount");
		    $label_17 =   ($_GET['ln'] == 1 ? "মন্তব্য" : "Comments");
		    $label_18 =   ($_GET['ln'] == 1 ? "কোড" : "Code");
		
		
		

?>
		<table class = 'embossed  main_sal<?php echo$t[0][0];?>'  width = '100%' border = '0px' >
			<tr class = 'purchase notforprint' id = 'pur<?php echo$t[0][0];?>' >
				<td width = '8%'><?php echo$label_11;?> : <?php echo$t[0][0];?></td>
				<td width = '25%' colspan='2' ><?php echo$label_1;?> : <?php echodateconvert($t[0][1]);?></td>
				<td  colspan = '3'> <?php echo$label_2;?> : <?php echo$t[0][3];?></td>
				
				<th width = '20%'><?php echo$label_12;?> : <b><?php echo($t[0][12])?></b></th>
			</tr>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' style='display:none' >
				<td ><b><?php echo$label_3;?></b></td>

				<td><b><?php echo$label_18;?></b></td>
				<td><b><?php echo$label_4;?></b></td>
				<td><b><?php echo$label_5;?></b></td>
				<td><b><?php echo$label_6;?></b></td>
				<td><b><?php echo$label_7;?></b></td>
				<td><b><?php echo$label_8;?></b></td>
			</tr>	
			<?
				$n = count($t);
				$tot = 0;
				
				for($i=0; $i<$n; $i++){
			?>
					<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' style='display:none'>
						<td><?php echo($i+1);?></td>

						<td><?php echo$t[$i][13];?></td>
						<td><?php echo$t[$i][6];?></td>
						<td><?php echo$t[$i][7];?></td>
						<td><?php echo$t[$i][8];?></td>
						<td><?php echo$t[$i][9];?></td>
						<td><?php echo($t[$i][9] * $t[$i][7]);?></td>
						<? $tot = $tot + $t[$i][9] * $t[$i][7]; ?>
					</tr>
			<?		
				}
			?>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' style='display:none'>
				<td colspan = '2'><?php echo$label_9;?> : <?php echo$t[0][4];?></td>
				<td colspan = '2'> <?php echo$label_13;?>: <?php echo$t[0][11];?></td>
				<td colspan = '2'><?php echo$label_15;?> : <?php echo$tot;?></td>
			</tr>
			<tr class = 'pur<?php echo$t[0][0];?>' id = 'data_row' style='display:none'>
				<td colspan = '2'><?php echo$label_10;?> : <?php echo$t[0][5];?></td>
				<td colspan = '2'><?php echo$label_14;?> : <?php echo$t[0][10];?></td>
				<td colspan = '2'><?php echo$label_16;?> : <?php echo($tot-$t[0][10])?> </td>
			</tr>	
			<tr class = 'pur<?php echo$t[0][0];?> notforprint' id = 'data_row' style='display:none'>
				   <th colspan = '7' class = 'notforprint'>
					<? 
					      $print = "index.php?e=".req('e')."&&page=0000&&sub=0113&&id=".$t[0][0]."&&print=1";
					      $delete = "index.php?e=".req('e')."&&page=0000&&sub=0213&&id=".$t[0][0];
					?>
					<a href = '<?php echo$print;?>' target = '_blank' class = 'button'  > &nbsp;&nbsp;  Print &nbsp;&nbsp; </a>

					<a href = '<?php echo$delete;?>' target = '_blank' class = 'button sal_del' id = '<?php echo$t[0][0];?>'  > &nbsp;&nbsp;  Delete &nbsp;&nbsp; </a>
				    </th>				
			</tr>
		</table>

<?php
	}



	public     function get_drop_down($name,$array_of_value,$array_of_item,$selected = null,$select_by_value = true){

		if($selected==null){
			$selected = req($name);
		}

		echo "<select name = '".$name."' >";
		if($selected == null){
			for ( $i = 0 ; $i < COUNT($array_of_item) ; $i++) {
				echo "<option value = '".$array_of_value[$i]."' >".$array_of_item[$i]."</option>";
			}
		}
		else{

			if($select_by_value){
				for($i=0; $i<COUNT($array_of_item); $i++){
					if($array_of_value[$i] != $selected)
					echo "<option value = '".$array_of_value[$i]."' >".$array_of_item[$i]."</option>";
					else
					echo "<option value = '".$array_of_value[$i]."' selected >".$array_of_item[$i]."</option>";
				}
			}
			else{

				for($i=0; $i<COUNT($array_of_item); $i++){
					if($array_of_item[$i] != $selected)
					echo "<option value = '".$array_of_value[$i]."' >".$array_of_item[$i]."</option>";
					else
					echo "<option value = '".$array_of_value[$i]."' selected >".$array_of_item[$i]."</option>";
				}

			}

		}
		echo "</select>";

	}

	public function input_pass($name, $value = null, $id = null, $class = null){

		if(isset($_REQUEST[$name])){
			$value = mysql_escape_string($_REQUEST[$name]);
		}
		echo "<input type = 'password' name = '".$name."'"." class = '".$class."' id = '".$id."' value = '". $value."' />" ;
	}

}
  function find_catagory($qur, $id,$nl){
    $qur_x = "SELECT idproduct_catagory, product_catagory_name FROM product_catagory WHERE idproduct_catagory_parent = $id ORDER BY product_catagory_name";
    $dx = $qur->custom_select_query($qur_x);
    if(count($dx)==0){
	$qur_y = "SELECT  idproduct, product_name, product_mrp, product_mpp,unite_name , product_type, ammount FROM product p LEFT JOIN unite USING(idunite) LEFT JOIN pestablishment_product USING(idproduct) WHERE idproduct_catagory = ".$id." AND product_status = 1 ORDER BY product_name;";
	$dy = $qur->custom_select_query($qur_y);
	if(count($dy)>0){
	?>
	  <table class = 'product_list' nested_level = '<?=$nl?>' border = '1px'>
	  <?
	    foreach($dy as $d){
	      echo "<tr id = 'product-row-".$d[0]."' ><td>".$d[0]."</td><td>".$d[1]."</td><td>".$d[2]."</td><td>".$d[3]."</td><td>".$d[4]."</td><td>".$d[5]."</td><td>".$d[6]."</td></tr>";
	    }
	  ?>
	  </table>
	<?
	}
      }
      else{
	foreach($dx as $d){
	  echo "<div id = 'product-cat-".$d[0]."'   did = '".$d[0]."' dname = '".$d[1]."' nested_level = '".$nl."' >";
	    find_catagory($qur,$d[0],$nl+1);
	  echo "</div>";
	  
	}
      }
  }


?>

<?php
  function print_barcode($string, $height=50, $width=1 , $qur)
  {
    $string = strtoupper($string);
   
    $string = "*".$string."*";

    for($i=0; $i<strlen($string); $i++)
    {
      $cur_bit_string = $qur->custom_select_query("SELECT bit from bitstring WHERE letter='$string[$i]'");
      $bit_string = $bit_string.$cur_bit_string[0][0]."0";
    }
  
    echo "<div class='barcode'>";
    for($i=0; $i<strlen($bit_string); $i++)
    {
      if($bit_string[$i]==1)
        echo "<img src='img/black1by1.gif' height='".$height."px' width='".$width."px'/>";
      else
        echo "<img src='img/white1by1.gif' height='".$height."px' width='".$width."px'/>";
    }
    echo "<br/><center><small>Product Code : ".$string."</small></center>";
    echo "</div>";
  }
function validateDate($date, $format = 'Y-m-d H:i:s')
{
    $d = DateTime::createFromFormat($format, $date);
    return $d && $d->format($format) == $date;
    //return (true);
}

?>
