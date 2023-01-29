<?php
	function connect_database()
	{
		$con=mysql_connect("localhost","abidingg_sitea","6LwTL[AVVkXh");
		if(!$con)
		{
			die("Server Connection Failed.");
		}
		$db=mysql_select_db("abidingg_home");
		if(!$db)
		{
			die("Database Connection Failed.");
		}
	}
	
	function rep_br_sp($string){
		return str_ireplace("<br/>"," ",$string);
	}
	
	function dateconvert($date){
				if($date=="0000-00-00"||(!$date))
					return "";
				elseif($date==date("Y-m-d"))
					return "Today";
				else
					return $newDate = date("d M Y (D)", strtotime($date));
	}

	function get_fixedtext($fixedtext_id)
	{
		$q=mysql_query("SELECT fixedtext FROM fixedtext WHERE id='$fixedtext_id'");
		$ar=mysql_fetch_array($q);
		return $ar[0]; 
	}
	
	function update_fixedtext($fixedtext_id,$editedcontent)
	{
		$q=mysql_query("UPDATE fixedtext SET fixedtext='".$editedcontent."' WHERE id='".$fixedtext_id."'");
		return $q;
	}

	function check_img($id,$table)
	{
		$q=mysql_query("SELECT * FROM ".$table." WHERE img_id='".$id."'");
		if(mysql_num_rows($q)) return true;
		else return false;
	}
?>